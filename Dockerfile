# Dockerfile
FROM ubuntu:22.04

# Install Git
RUN apt-get update && apt-get install -y git
