FROM debian:12-slim

ENV USER=root

RUN apt-get update  \
    && apt-get -y --no-install-recommends install  \
        python3-pip wget zsh \
        sudo curl git ca-certificates build-essential \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
COPY install.sh /tmp/install.sh
RUN chmod +x /tmp/install.sh
RUN /tmp/install.sh && rm /tmp/install.sh

# # Add a new user and grant sudo privileges without a password
# RUN useradd -m -s /usr/bin/zsh $USERNAME \
#     && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# # Switch to the new user
# USER $USERNAME
# WORKDIR /home/$USERNAME
COPY bashrc /root/.bashrc

ENV TERM=xterm-256color
WORKDIR "/root"
ENTRYPOINT [ "bash", "-l" ]