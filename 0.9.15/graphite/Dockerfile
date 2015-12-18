FROM debian:jessie
ADD https://github.com/graphite-project/graphite-web/archive/0.9.15.tar.gz /usr/src/
ADD https://github.com/graphite-project/carbon/archive/0.9.15.tar.gz /usr/src/
ADD https://github.com/graphite-project/whisper/archive/0.9.15.tar.gz /usr/src/

COPY ./conf/local_settings.py /opt/graphite/webapp/graphite/
COPY ./conf/apache/sites-enabled/* /etc/apache2/sites-enabled/
COPY ./conf/conf/* /opt/graphite/conf/ 

RUN apt-get update \
	&& apt-get install -y libapache2-mod-wsgi python-psycopg2 python-cairo \
		python-django python-pyparsing python-django-tagging python-memcache \
		python-ldap python-rrdtool apache2 \
	&& apt-get clean \
	&& cd /usr/src/whisper && /usr/bin/python ./setup.py install \
	&& cd /usr/src/carbon && /usr/bin/python ./setup.py install \
	&& cd /usr/src/graphite-web && /usr/bin/python ./setup.py install \
	&& rm /etc/apache2/sites-enabled/* \
	&& mkdir -p /var/run/apache2/wsgi && chown www-data /var/run/apache2/wsgi \
	&& chown -R www-data:www-data /opt/graphite/storage \
	&& echo finished

EXPOSE 80
CMD /usr/sbin/apachectl -d /etc/apache2 -f /etc/apache2/apache2.conf -e info -DFOREGROUND

# /usr/bin/python /opt/graphite/webapp/graphite/manage.py syncdb
