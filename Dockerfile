FROM jenkins/jenkins

USER root

RUN apt-get -y update && \ 
   apt-get -y install apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common 

# install Docker

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get -y install install docker-ce docker-ce-cli containerd.io
   

# install Docker Compose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

# install heroku cli

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
