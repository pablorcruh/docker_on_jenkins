FROM jenkins/jenkins

USER root

RUN apt-get -y update && \ 
   apt-get -y install apt-transport-https \
   ca-certificates \
   curl \
   gnupg \ 
   gpgv \
   software-properties-common 

# install Docker

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
   add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
   apt-get -y install docker-ce   

# install Docker Compose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

# install heroku cli

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
