# Use a base image with an operating system (e.g., Ubuntu)
FROM ubuntu:latest

# Install Shellinabox and dependencies
RUN apt-get update && \
    apt-get install -y shellinabox

# Expose Shellinabox port
EXPOSE 4200

# Start Shellinabox on container startup
CMD ["shellinabox", "-t", "-s", "/:LOGIN", "--no-beep", "--disable-ssl", "-b", "/shell:LOGIN"]
