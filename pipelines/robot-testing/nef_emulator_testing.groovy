
String runCapifLocal(String nginxHost) {
    return nginxHost.matches('^(http|https)://localhost.*') ? 'true' : 'false'
}

pipeline{

    agent { node { label 'evol5-slave' }  }

    parameters{
        string(name: 'NGINX_HOSTNAME', defaultValue: 'http://localhost:8888', description: 'nginx hostname')        // nginx-evolved5g.apps-dev.hi.inet
        string(name: 'ROBOT_DOCKER_IMAGE_VERSION', defaultValue: '2.0', description: 'Robot Docker image version')
        // string(name: 'NEF_API_HOSTNAME', defaultValue: 'https://5g-api-emulator.medianetlab.eu', description: 'netapp hostname')
    }

    environment {
        NEF_EMULATOR_DIRECTORY = "${WORKSPACE}/nef-emulator"
        ROBOT_TESTS_DIRECTORY = "${WORKSPACE}/tests"
        ROBOT_RESULTS_DIRECTORY = "${WORKSPACE}/results"
        NGINX_HOSTNAME = "${params.NGINX_HOSTNAME}"
        ROBOT_VERSION = "${params.ROBOT_DOCKER_IMAGE_VERSION}"
        ROBOT_IMAGE_NAME = 'dockerhub.hi.inet/dummy-netapp-testing/robot-test-image'
        NEF_API_HOSTNAME="${params.NEF_API_HOSTNAME}"
        AWS_DEFAULT_REGION = 'eu-central-1'
        OPENSHIFT_URL= 'https://openshift-epg.hi.inet:443'
        RUN_LOCAL_NEF = runCapifLocal("${params.NGINX_HOSTNAME}")
    }

    stages{
        
        stage('Login to Artifactory') {
            steps {
                dir ("${env.WORKSPACE}") {
                    withCredentials([usernamePassword(
                       credentialsId: 'docker_pull_cred',
                       usernameVariable: 'USER',
                       passwordVariable: 'PASS'
                   )]) {
                        sh '''
                            docker login --username ${USER} --password ${PASS} dockerhub.hi.inet
                           '''
                   }
                }
                dir ("${env.WORKSPACE}") {
                    sh """
                        mkdir ${ROBOT_RESULTS_DIRECTORY}
                        mkdir ${ROBOT_RESULTS_DIRECTORY}/AsSessionWithQoSAPI
                        mkdir ${ROBOT_RESULTS_DIRECTORY}/MonitoringEventAPI
                    """
                }
            }
        }

        stage("Run Nef locally."){

            when {
                expression { RUN_LOCAL_NEF == 'true' }
            }

            stages{
                stage("Checkout"){
                    steps{
                        checkout([$class: 'GitSCM',
                            branches: [[name: 'main']],
                            doGenerateSubmoduleConfigurations: false,
                            extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'nef-emulator']], 
                            gitTool: 'Default',
                            submoduleCfg: [],
                            userRemoteConfigs: [[url: 'https://github.com/EVOLVED-5G/NEF_emulator.git', credentialsId: 'github_token']]
                        ])
            
                        sh '''
                            pwd
                            ls -la
                        '''
                    }
                }
                stage("Create Robot Framework docker container."){
                    steps {
                        dir ("${NEF_EMULATOR_DIRECTORY}") {
                            sh '''
	                            cp env-file-for-local.dev .env
                                docker-compose --log-level ERROR --profile dev up -d --build --quiet-pull
                                docker-compose ps -a 
                                sleep 15
                            '''
                        }
                    }
                }
            }

        }

        stage("Run test cases."){
            steps{
                dir ("${WORKSPACE}") {
                    sh """
                        docker pull ${ROBOT_IMAGE_NAME}:${ROBOT_VERSION} 
                        docker run -t \
                            --name robot \
                            --network="host" \
                            --rm \
                            -v ${ROBOT_TESTS_DIRECTORY}:/opt/robot-tests/tests \
                            -v ${ROBOT_RESULTS_DIRECTORY}/AsSessionWithQoSAPI:/opt/robot-tests/results/AsSessionWithQoSAPI \
                            -v ${ROBOT_RESULTS_DIRECTORY}/MonitoringEventAPI:/opt/robot-tests/results/MonitoringEventAPI \
                            -e NGINX_HOSTNAME=${NGINX_HOSTNAME} \
                            ${ROBOT_IMAGE_NAME}:${ROBOT_VERSION} \
                            /bin/bash \
                            -c "robot --outputdir /opt/robot-tests/results/AsSessionWithQoSAPI /opt/robot-tests/tests/features/NEF_AsSessionWithQoS_API/nef_subscriptions_api.robot; \
                            robot --outputdir /opt/robot-tests/results/MonitoringEventAPI /opt/robot-tests/tests/features/NEF_Monitoring_Event_API/nef_monitoring_event_api.robot"
                    """
                    // ;\ robot --outputdir /opt/robot-tests/results/MonitoringEventAPI /opt/robot-tests/tests/features/NEF_Monitoring_Event_API/nef_monitoring_event_api.robot"
                    // robot --outputdir /opt/robot-tests/results/AsSessionWithQoSAPI /opt/robot-tests/tests/features/NEF_AsSessionWithQoS_API/nef_subscriptions_api.robot"
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