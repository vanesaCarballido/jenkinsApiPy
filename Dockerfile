# Base Jenkins LTS
FROM jenkins/jenkins:lts

USER root

# Instalar herramientas necesarias
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    # Descargar kubectl para Linux AMD64 (ajustar si usás ARM)
    curl -LO "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Volvemos al usuario jenkins
USER jenkins
