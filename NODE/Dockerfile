FROM ubuntu:22.04
    ARG NODE_MAJOR_VERSION
    RUN apt-get update \
        && apt-get install --no-install-recommends -y \
            ca-certificates \
            curl \
            gnupg \
            libatomic1 \
        && apt-get -y clean \
        && rm -rf /var/lib/apt/lists/*

    RUN mkdir -p /etc/apt/keyrings \
        && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
        && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR_VERSION}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
    
    RUN apt-get update \
        && apt-get install --no-install-recommends -y \
            nodejs \
        && apt-get -y clean \
        && rm -rf /var/lib/apt/lists/*
    
    RUN npm install -g npm@10.1.0