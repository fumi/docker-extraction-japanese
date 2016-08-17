FROM fumihiro/maven
MAINTAINER Fumihiro Kato <fumi@fumi.me>

RUN mkdir -p /work
WORKDIR /work
COPY run.sh .
RUN git clone -b develop-ja https://github.com/fumi/extraction-framework.git

WORKDIR extraction-framework
RUN mvn clean install

WORKDIR core
RUN ../run download-ontology
# Disabled because the download-mappings process is often stuck 
#RUN ../run download-mappings
#RUN ../run generate-settings

WORKDIR ../dump
COPY *.properties .

WORKDIR /work

VOLUMES["/data"]

ENTRYPOINT ["run.sh"]
CMD ["--help"]
