FROM ubuntu:20.04

LABEL version="2.0"
LABEL description="Docker to run Robot Framework"

ENV ROBOT_DIRECTORY=/opt/robot-tests
ENV ROBOT_TESTS_DIRECTORY=$ROBOT_DIRECTORY/tests


# Create directories structure
RUN mkdir $ROBOT_DIRECTORY
RUN mkdir $ROBOT_TESTS_DIRECTORY

# # Create Volumes for docker
# VOLUME $ROBOT_DIRECTORY
# VOLUME $ROBOT_COMMON_DIRECTORY
# VOLUME $ROBOT_TESTS_DIRECTORY
# VOLUME $ROBOT_RESULTS_DIRECTORY

WORKDIR $ROBOT_DIRECTORY

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends  \
    software-properties-common \
    build-essential \
    bash \
    bash-completion \
    curl \
    python3 \
    python3-dev \
    python3-pip \
    python3-venv 


RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y python3.9 python3.9-venv python3.9-dev

RUN pip install --upgrade pip \
    robotframework && \
    pip install pandas \
    pip install redis \
    robotframework-requests \
    ConfigParser 

RUN cp /usr/lib/python3.8/configparser.py /usr/lib/python3.8/ConfigParser.py
 
CMD [ "tail","-f","/dev/null" ]