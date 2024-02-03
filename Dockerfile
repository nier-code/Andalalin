# Use the official Ubuntu image
FROM ubuntu:latest

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a new user (replace 'your_user' with your desired username)
RUN useradd -ms /bin/bash root

# Set password for the new user (replace 'your_password' with your desired password)
RUN echo 'root:root' | chpasswd

# Expose SSH port
EXPOSE 22

# Start SSH server on container startup
CMD ["/usr/sbin/sshd", "-D"]
