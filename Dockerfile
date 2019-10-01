FROM codercom/code-server:v2

# ubuntu installations (e.g. Python)
RUN sudo -E apt-get update && sudo -E apt-get install -y \
    python3.7 \
    python3-pip \
    openjdk-11-jdk \
    docker.io\
    maven \
    locales \
 && sudo rm -rf /var/lib/apt/lists/* \
 && sudo locale-gen "de_DE.UTF-8"

ENV LANG=de_DE.UTF-8 \
    LANGUAGE=de_DE:de \
    LC_ALL=de_DE.UTF-8

# extensions to code-server
RUN code-server --install-extension redhat.java && \
    code-server --install-extension vscjava.vscode-java-pack \
    code-server --install-extension redhat.vscode-xml \
    code-server --install-extension dotjoshjohnson.xml

CMD ["code-server", "--auth", "password"]
