FROM centos:latest
RUN yum install httpd -y
RUN sed -i "s/listen 80/listen 8090/g" /etc/httpd/conf/httpd.conf
COPY src/ /var/www/html
RUN chown apache:apache /var/run/httpd /var/log/httpd
RUN chmod 777 /var/run/httpd /var/logi/httpd
EXPOSE 8090
USER apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
