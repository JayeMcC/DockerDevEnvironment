# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Set environment variables to non-interactive (to avoid prompts during installation)
ENV DEBIAN_FRONTEND=noninteractive

# Update and install system dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
    curl \
    gnupg2 \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libsqlite3-dev \
    git \
    vim

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Install Ruby using RVM (Ruby Version Manager)
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm install 3.0.0"
RUN /bin/bash -l -c "rvm use 3.0.0 --default"

# Install Rails
RUN /bin/bash -l -c "gem install rails"

# Set the working directory inside the container
WORKDIR /app

# Expose ports for Rails and Storybook
EXPOSE 3000  # Rails server
EXPOSE 6006  # Storybook

# Start Rails server (modify CMD as needed for your project)
CMD ["rails", "server", "-b", "0.0.0.0"]
