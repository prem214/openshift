FROM centos:latest
RUN yum install httpd -y
RUN sed -i "s/Listen 80/Listen 8090/g" /etc/httpd/conf/httpd.conf
COPY . /var/www/html
RUN chown apache:apache /var/run/httpd /var/log/httpd
RUN chmod 777 /var/run/httpd /var/log/httpd
EXPOSE 8090
USER apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
