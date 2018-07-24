############################################################
# Dockerfile to build Genropy container images
# Based on Ubuntu
############################################################

FROM genropy/genropy:latest
MAINTAINER Francesco Porcari - francesco@genropy.org

ADD .gnr /.gnr
EXPOSE 8080

RUN pip install psycopg2-binary
RUN pip install supervisor-stdout
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD nginx.conf /home/nginx.conf
ADD mime.types /home/mime.types
ADD gunicorn.py /home/gunicorn.py
CMD []
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

