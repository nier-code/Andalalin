# Use the official CentOS image as the base
FROM centos:7

# Install necessary packages (customize as needed)
RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y shellinabox

# Set a username and password for Shellinabox
RUN useradd -m -s /bin/bash andalalin
RUN echo 'andalalin:andalalin' | chpasswd

# Expose Shellinabox port
EXPOSE 4200

# Define the entry point (start Shellinabox)
CMD ["shellinaboxd", "-t", "-s", "/:LOGIN"]
