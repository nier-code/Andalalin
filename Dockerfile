# Use the official Ubuntu image
FROM ubuntu:latest

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a new user (replace 'your_user' with your desired username)
RUN useradd -ms /bin/bash andalalin

# Set password for the new user (replace 'your_password' with your desired password)
RUN echo 'andalalin:andalalin' | chpasswd

# Create the privilege separation directory
RUN mkdir /run/sshd

# Disable SSH banner
RUN sed -i 's/#Banner.*/Banner none/' /etc/ssh/sshd_config

# Enable SSH service
RUN systemctl enable ssh

# Expose SSH port
EXPOSE 22

# Start SSH server on container startup with debugging
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
