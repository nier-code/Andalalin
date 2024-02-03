# Use the official Ubuntu base image
FROM ubuntu:latest

# Install shell-in-a-box
RUN apt-get update && apt-get install -y shellinabox

# Expose the default shell-in-a-box port
EXPOSE 4200

# Start shell-in-a-box service
CMD ["shellinaboxd", "-t", "--no-beep", "--disable-ssl", "--localhost-only", "--port=4200"]
