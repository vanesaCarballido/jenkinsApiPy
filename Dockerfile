FROM jenkins/jenkins:lts

USER root

# Instalar kubectl ARM64
RUN apt-get update && apt-get install -y curl \
 && curl -LO https://dl.k8s.io/release/v1.30.0/bin/linux/arm64/kubectl \
 && chmod +x kubectl \
 && mv kubectl /usr/local/bin/

# Montar volumen de kubeconfig
VOLUME /var/jenkins_home/.kube

USER jenkins
