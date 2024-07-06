# Development Environment with Docker and VSCode

This repository contains a `Dockerfile` and `devcontainer.json` configuration for setting up a development environment.

## Prerequisites

- Docker installed on your machine
- Visual Studio Code installed on your machine
- Remote - Containers extension installed in Visual Studio Code

## Setup Instructions

1. **Clone the repository**:

   ```sh
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Open the repository in Visual Studio Code**:

   ```sh
   code .
   ```

3. **Build the Docker image**:

   ```sh
   docker build -t dev-environment .
   ```

4. **Reopen the folder in a container**:

   - Press `F1` to open the command palette.
   - Type `Remote-Containers: Reopen in Container` and select it.

   VSCode will use the `Dockerfile` and `devcontainer.json` to build and start a Docker container with the specified environment.
