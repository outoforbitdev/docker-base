ARG BASE_IMAGE=ubuntu
ARG BASE_TAG=22.04
FROM ${BASE_IMAGE}:${BASE_TAG}
    ARG NODE_MAJOR_VERSION
    RUN if [ -z "${NODE_MAJOR_VERSION}" ]; \
        then echo "do not install node"; \
        else apt-get update \
            && apt-get install -y ca-certificates curl gnupg \
            && mkdir -p /etc/apt/keyrings \
            && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
            && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR_VERSION}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
            && apt-get update \
            && apt-get install nodejs -y \
            && npm install -g npm@10.1.0; \
        fi