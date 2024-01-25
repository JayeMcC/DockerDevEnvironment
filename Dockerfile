# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
    curl \
    gnupg2 \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libsqlite3-dev \
    nodejs \
    npm \
    postgresql-client

# Install Ruby using RVM (Ruby Version Manager)
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm install 3.0.0"
RUN /bin/bash -l -c "rvm use 3.0.0 --default"

# Install Rails
RUN /bin/bash -l -c "gem install rails"

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Install Playwright and its dependencies
RUN npx playwright install

# Set the working directory inside the container
WORKDIR /app

# Copy the application files to the container
COPY . /app

# Install app dependencies
RUN yarn install

# Expose the port the app runs on
EXPOSE 3000

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
