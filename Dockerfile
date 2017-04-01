#
# Magento 1.5.1.0 w/ ubuntu-14.04.5 + mysql-5.5.54 + php-5.6 + nginx-1.4.6
#
FROM ubuntu:14.04
MAINTAINER "vlopes11" <vhrlopes@gmail.com>

# Install.
RUN apt-get update && \
   apt-get -y upgrade && \
   apt-get install -y build-essential && \
   apt-get install -y software-properties-common && \
   apt-get install -y byobu curl git htop man unzip vim wget && \
   export DEBIAN_FRONTEND=noninteractive && apt-get -q -y install mysql-server && \
   add-apt-repository -y ppa:ondrej/php && apt-get update && apt-get install -y --force-yes php5.6 php5.6-xml php5.6-mysql php5.6-mcrypt php5.6-curl php5.6-gd php5.6-fpm && \
   apt-get install -y --force-yes nginx && \
   apt-get clean

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts
ADD root/run_services.sh /root/run_services.sh
ADD opt/magento-1.5.1.0-2015-02-12-06-33-41.zip /opt/magento-1.5.1.0-2015-02-12-06-33-41.zip
ADD etc/nginx/sites-available/default /etc/nginx/sites-available/default
ADD opt/database_magento.sql /opt/database_magento.sql

# Extract magento files
RUN cd /opt && unzip magento-1.5.1.0-2015-02-12-06-33-41.zip && chown -R www-data.www-data /opt/magento

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/root/run_services.sh"]

# Expose nginx port
EXPOSE 80
