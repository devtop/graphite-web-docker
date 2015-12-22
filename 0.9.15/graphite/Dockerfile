FROM debian:jessie

RUN apt-get update \
	&& apt-get install -y libapache2-mod-wsgi python-psycopg2 python-cairo \
		python-django python-pyparsing python-django-tagging python-memcache \
		python-ldap python-rrdtool apache2 wget \
	&& apt-get clean \
	&& rm /etc/apache2/sites-enabled/* \
	&& mkdir -p /var/run/apache2/wsgi && chown www-data /var/run/apache2/wsgi \
  && echo finished

RUN echo next \
	&& wget -v --show-progress -O /tmp/whisper.tar.gz https://github.com/graphite-project/whisper/archive/0.9.15.tar.gz \
	&& tar -xzf /tmp/whisper.tar.gz --directory=/tmp/ \
	&& cd /tmp/whisper-0.9.15 && /usr/bin/python ./setup.py install \
	&& wget -v  --show-progress -O /tmp/graphite.tar.gz https://github.com/graphite-project/graphite-web/archive/0.9.15.tar.gz \
	&& tar -xzf /tmp/graphite.tar.gz --directory=/tmp/ \
	&& cd /tmp/graphite-web-0.9.15 && /usr/bin/python ./setup.py install \
	&& chown -R www-data:www-data /opt/graphite/storage \
	&& wget -v  --show-progress -O /tmp/carbon.tar.gz https://github.com/graphite-project/carbon/archive/0.9.15.tar.gz \
	&& tar -xzf /tmp/carbon.tar.gz --directory=/tmp/ \
	&& cd /tmp/carbon-0.9.15 && /usr/bin/python ./setup.py install \
	&& cd / && rm -rf /tmp/* \
	&& echo finished

COPY ./conf/local_settings.py /opt/graphite/webapp/graphite/
COPY ./conf/apache/sites-enabled/* /etc/apache2/sites-enabled/
COPY ./conf/conf/* /opt/graphite/conf/

EXPOSE 80
CMD /usr/sbin/apachectl -d /etc/apache2 -f /etc/apache2/apache2.conf -e info -DFOREGROUND
