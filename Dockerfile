# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN apt-get update && apt-get install -y bash dnsutils curl wget unzip jq && \
    if [ ${TARGETPLATFORM} = 'linux/amd64' ]; then export DOWNLOAD_ARCH=x86_64; fi && \
    if [ ${TARGETPLATFORM} = 'linux/arm64' ]; then export DOWNLOAD_ARCH=aarch64; fi && \
    if [ -z "$DOWNLOAD_ARCH"]; then exit 1; fi && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-${DOWNLOAD_ARCH}.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

COPY scripts/update-route53 /usr/local/bin/update-route53

CMD /bin/bash
