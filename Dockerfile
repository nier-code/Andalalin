# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary packages (adjust as needed)
RUN apt-get update && \
    apt-get install -y openssh-server

# Set a root password (replace "your_password" with your desired password)
RUN echo 'root:root' | chpasswd

# Authorize SSH host (replace example.com with your target host)
RUN ssh-keyscan andalalin.com > /root/.ssh/known_hosts

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
