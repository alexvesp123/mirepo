FROM java:openjdk-8-jdk
ENV MULE_HOME /opt/mule

ADD mule-standalone-3.9.0-20210217.zip /opt
#ADD demo2.zip /opt

RUN set -x \
        && cd /opt \
		&& unzip mule-standalone-3.9.0-20210217.zip \
		&& mv mule-standalone-3.9.0-20210217 mule
		
WORKDIR $MULE_HOME
VOLUME $MULE_HOME/apps	
VOLUME $MULE_HOME/conf
VOLUME $MULE_HOME/domains
VOLUME $MULE_HOME/logs

#COPY demo2.zip $MULE_HOME/apps/
#ADD demo2.zip $MULE_HOME/apps/
RUN ls -ltr $MULE_HOME/apps/

EXPOSE 8081-8091
EXPOSE 9000
EXPOSE 9082

EXPOSE 5000
EXPOSE 1098
EXPOSE 7777
EXPOSE 9997

CMD echo"--------Start mule runtime---------"
ENTRYPOINT ["./opt/mule/bin/mule"]
