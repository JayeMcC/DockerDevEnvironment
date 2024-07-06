# Development Environment with Docker and VSCode

This repository contains a `Dockerfile` and `devcontainer.json` configuration for setting up a development environment with Ubuntu, `zsh` with Powerlevel10k, and necessary VSCode extensions.

## Prerequisites

- Docker installed on your machine
- Visual Studio Code installed on your machine
- Remote - Containers extension installed in Visual Studio Code

## Setup Instructions

1. **Clone the development environment repository**:
   ```sh
   git clone <dev-environment-repo-url>
   cd <dev-environment-repo-directory>
   ```

2. **Open the development environment repository in Visual Studio Code**:
   ```sh
   code .
   ```

3. **Reopen the folder in a container**:
   - Press `F1` to open the command palette.
   - Type `Remote-Containers: Reopen in Container` and select it.

   VSCode will use the `Dockerfile` and `devcontainer.json` to build and start a Docker container with the specified environment.

4. **Clone your actual project repository inside the container**:
   - Open a terminal inside VSCode (which will now be inside the container).
   - Clone your project repository in a separate directory inside the container:
     ```sh
     git clone <your-project-repo-url> /workspace/your-project
     ```

5. **Open your project directory in VSCode**:
   - In VSCode, use `File > Open Folder` (or `Ctrl+K Ctrl+O`) to open `/workspace/your-project`.

By following these steps, you will maintain a clear separation between the dev environment repository and your actual project repository, avoiding accidental commits to the wrong repository.
