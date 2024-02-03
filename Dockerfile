# Use the official CentOS image as the base
FROM centos:8

# Install necessary packages (customize as needed)
RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y shellinabox

RUN echo 'root:root' | chpasswd

# Expose Shellinabox port
EXPOSE 4200

# Define the entry point (start Shellinabox)
CMD ["shellinaboxd", "-t", "-s", "/:LOGIN"]
