# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary packages (adjust as needed)
RUN apt-get update && \
    apt-get install -y openssh-server

# Create an SSH key for root user (replace with your own private key)
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    echo "YOUR_PRIVATE_SSH_KEY" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa

# Authorize SSH host (replace example.com with your target host)
RUN ssh-keyscan example.com > /root/.ssh/known_hosts

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
