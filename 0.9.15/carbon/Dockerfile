FROM tobinium/graphite-web
ADD https://github.com/graphite-project/carbon/archive/0.9.15.tar.gz /usr/src/carbon
COPY ./conf/* /opt/graphite/conf/
RUN apt-get update \
	&& apt-get install -y python python-twisted \
	&& apt-get clean 
CMD /opt/graphite/bin/carbon-cache.py --debug start
EXPOSE 2003
