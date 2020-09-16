FROM debian:stable

RUN apt-get update && apt-get install -y curl unzip

ARG AWSCLI_VERSION=2.0.49
RUN cd /tmp \
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWSCLI_VERSION}.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm awscliv2.zip \
  && aws --version

ARG KUBECTL_VERSION=1.19.2

RUN cd /tmp \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl \
 && kubectl version --client



