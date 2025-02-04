FROM debian:12-slim

ARG USERNAME=newuser

RUN apt-get update  \
    && apt-get -y --no-install-recommends install  \
        python3-pip wget zsh \
        sudo curl git ca-certificates build-essential \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"
ENV PATH="/mise/shims:$PATH"

RUN curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir /usr/local/bin -y

RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
RUN curl https://mise.run | sh

# Add a new user and grant sudo privileges without a password
RUN useradd -m -s /usr/bin/zsh $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the new user
USER $USERNAME
WORKDIR /home/$USERNAME
COPY zshrc /home/$USERNAME/.zshrc
RUN mkdir -p /home/$USERNAME/.config && touch /home/$USERNAME/.config/starship.toml
RUN starship preset jetpack -o /home/$USERNAME/.config/starship.toml