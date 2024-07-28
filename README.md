# Development Environment with Docker and VSCode

This repository contains a `Dockerfile` and `devcontainer.json` configuration for setting up a development environment with Ubuntu, `zsh` with Powerlevel10k, and necessary VSCode extensions.

## Prerequisites

- Docker installed on your machine
- Visual Studio Code installed on your machine
- Remote - Containers extension installed in Visual Studio Code

## Setup Instructions

1. **Clone the development environment repository**:
   git clone <dev-environment-repo-url>
   cd <dev-environment-repo-directory>

2. **Open the development environment repository in Visual Studio Code**:
   code .

3. Enable filesharing of your projects directory in docker
For WSL that means:
- Settings -> General -> Use the WSL 2 based engine
- Settings -> Resources -> WSL2 integration -> Enable integration with additional distros: -> Your distro is checked

3. **Start the Docker container in VSCode**:
   - After opening the project in Visual Studio Code, you should see a prompt to reopen the folder in a container. If you don't see this prompt, you can manually do this by pressing `F1`, typing `Remote-Containers: Reopen in Container`, and selecting it.
   - VSCode will build the Docker image using the `Dockerfile` and create a container with the environment specified in the `devcontainer.json` file.

4. **Workspace Directory Mapping**:
   - Your local workspace directory (`/c/Users/jayer/repo`) will be mapped to the `/workspace` directory inside the container, allowing you to work seamlessly between your local machine and the container.

5. **Using the Environment**:
   - The development environment is now set up with `zsh` as the default shell, along with `Oh My Zsh` and `Powerlevel10k` theme for an enhanced terminal experience.
   - You can use the terminal in VSCode to interact with the container environment. Any changes made in the `/workspace` directory will reflect on your local machine.

6. **Exiting and Stopping the Container**:
   - To stop the container, you can either close Visual Studio Code or use the Docker CLI to stop and remove the container.

### Notes

- Ensure Docker is properly configured on your machine, including necessary permissions for file sharing if using Docker Desktop on Windows.
- For more information on using Remote Containers in VSCode, refer to the [official documentation](https://code.visualstudio.com/docs/remote/containers).
