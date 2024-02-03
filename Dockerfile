# Use the official Ubuntu image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set root password (replace 'your_password' with your desired password)
RUN echo 'root:your_password' | chpasswd

# Expose Shellinabox port
EXPOSE 4200

# Start Shellinabox on container startup
CMD ["shellinabox", "-t", "--no-beep", "-p", "4200", "--user=root", "--service=:LOGIN"]

# Remember to build the Docker image using: docker build -t ubuntu_shellinabox .
# Run the container using: docker run -p 4200:4200 ubuntu_shellinabox
