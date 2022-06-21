FROM ubuntu:20.04
USER root
WORKDIR /
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -yq && apt install curl -y \
    && curl -fsSL https://get.docker.com | bash -s docker

RUN curl -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.1.0/graalvm-ce-java17-linux-amd64-22.1.0.tar.gz \
	| tar -xz --strip-components=1 -C /usr/local && \ 
    java --version && gu install nodejs && npm install -g npm@latest --force  && \
	rm -rf /var/lib/apt/lists/*
ENTRYPOINT [/usr/local/bin/node]
CMD [node -v]
