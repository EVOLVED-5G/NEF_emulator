
String runCapifLocal(String nginxHost) {
    return nginxHost.matches('^(http|https)://localhost.*') ? 'true' : 'false'
}

pipeline{

    agent { node { label 'evol5-slave' }  }

    parameters{
        // nginx-evolved5g.apps-dev.hi.inet
        string(name: 'NGINX_HOSTNAME', defaultValue: 'http://localhost:8888', description: 'nginx hostname')
        string(name: 'ROBOT_DOCKER_IMAGE_VERSION', defaultValue: '2.0', description: 'Robot Docker image version')
        string(name: 'ROBOT_TEST_OPTIONS', defaultValue: '', description: 'Options to set in test to robot testing. --variable <key>:<value>, --include <tag>, --exclude <tag>')
        string(name: 'NEF_API_HOSTNAME', defaultValue: 'https://5g-api-emulator.medianetlab.eu', description: 'netapp hostname')
    }

    environment {
        NEF_EMULATOR_DIRECTORY = "${WORKSPACE}/"
        ROBOT_TESTS_DIRECTORY = "${WORKSPACE}/tests"
        ROBOT_RESULTS_DIRECTORY = "${WORKSPACE}/results"
        NGINX_HOSTNAME = "${params.NGINX_HOSTNAME}"
        ROBOT_VERSION = 'latest'
        ROBOT_IMAGE_NAME = 'dockerhub.hi.inet/dummy-netapp-testing/robot-test-image'
        NEF_API_HOSTNAME="${params.NEF_API_HOSTNAME}"
        AWS_DEFAULT_REGION = 'eu-central-1'
        OPENSHIFT_URL= 'https://openshift-epg.hi.inet:443'
        RUN_LOCAL_NEF = runCapifLocal("${params.NGINX_HOSTNAME}")
    }

    stages{

        stage("Run Nef locally."){

            when {
                expression { RUN_LOCAL_NEF == 'true' }
            }

            stages{
                stage("Create Robot Framework docker container."){
                    steps {
                        dir ("${NEF_EMULATOR_DIRECTORY}") {
                            sh '''
	                            cp env-file-for-local.dev .env
                                docker-compose --profile dev up -d
                                docker-compose ps -a 
                            '''
                        }
                    }
                }
                stage("Run test cases."){
                    steps{
                        sh """
                            docker logs nef_emulator_validation_testing_backend_1
                            docker exec robot bash -c "robot ./tests/features/NEF_AsSessionWithQoS_API/nef_subscriptions_api.robot; \
                            robot ./tests/features/NEF_Monitoring_Event_API/nef_monitoring_event_api.robot;"
                        """
                    }
                }
            }

        }

        stage("Run Nef in Openshift."){
            when {
                expression { RUN_LOCAL_NEF == 'false' }
            }
            stage("Login to Openshift."){
                steps {
                    withCredentials([string(credentialsId: '18e7aeb8-5552-4cbb-bf66-2402ca6772de', variable: 'TOKEN')]) {
                        sh '''
                            export KUBECONFIG="./kubeconfig"
                            oc login --insecure-skip-tls-verify --token=$TOKEN $OPENSHIFT_URL
                        '''
                        readFile('kubeconfig')
                    }
                }
            }
            stages{
                stage("Create Robot Framework Deployment."){
                    steps{
                        dir ("${env.NEF_EMULATOR_DIRECTORY}") {
                            withCredentials([string(credentialsId: '18e7aeb8-5552-4cbb-bf66-2402ca6772de', variable: 'TOKEN')]) {
                                sh """
                                    oc create -f deploymentConfig.yaml -ntest
                                """
                            }
                        }
                    }
                }
                stage("Run test cases."){
                    steps{
                        dir ("${env.NEF_EMULATOR_DIRECTORY}") {
                            // oc cp ../tests robot-framework:/tests
                            withCredentials([string(credentialsId: '18e7aeb8-5552-4cbb-bf66-2402ca6772de', variable: 'TOKEN')]) {
                                sh """
                                    oc -ntest exec -it robot-deployment -- /bin/bash -c "robot ./tests/features/NEF_AsSessionWithQoS_API/nef_subscriptions_api.robot;"                                """
                            }
                        }
                    }
                }
            }

        }

    }

    post{
        always{
            script {
                if(env.RUN_LOCAL_NEF == 'true'){
                    dir ("${env.NEF_EMULATOR_DIRECTORY}") {
                        echo 'Shutdown all nef services'
                        sh 'docker-compose down -v'
                    }
                }
            }

            script {
                echo "Deleting directories."
                cleanWs deleteDirs: true
            }
        }
        success{
            echo "Test ran successfully."
        }
    }

}