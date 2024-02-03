# Use the official Ubuntu image as the base
FROM ubuntu:22.04

# Set the working directory inside the container
WORKDIR /app

# Install necessary packages (you can customize this based on your app's requirements)
RUN apt-get update && apt-get install -y \
    openssh-server \
    python3

# Create a user and set a password (replace 'your_username' and 'your_password')
RUN useradd -m -s /bin/bash andalalin
RUN echo 'andalalin:andalalin' | chpasswd

# Start SSH service
RUN service ssh start

# Expose SSH port
EXPOSE 22

# Define the entry point (start SSH server)
CMD ["/usr/sbin/sshd", "-D"]
