# Use a base image with Ubuntu
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set root password (replace 'your_password' with the desired password)
RUN echo 'root:root' | chpasswd

# Expose the web-based terminal port
EXPOSE 4200

# Start Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
