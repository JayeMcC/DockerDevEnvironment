# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Install zsh, nano, and other development tools
RUN apt-get update && \
    apt-get install -y curl zsh git fonts-powerline nano && \
    rm -rf /var/lib/apt/lists/*

# Disable IPv6
RUN echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf && \
    echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.conf && \
    echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf && \
    sysctl -p

# Increase the maximum number of inotify watchers
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && \
    sysctl -p

# Enable mouse support in nano
RUN echo "set mouse" >> /etc/nanorc

# Install Oh My Zsh and Powerlevel10k
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Set zsh as the default shell
RUN chsh -s $(which zsh)

# Set the working directory inside the container
WORKDIR /workspace

# Expose a default port (if needed)
EXPOSE 3000

# Start zsh by default
CMD ["zsh"]
