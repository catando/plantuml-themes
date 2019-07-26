FROM openjdk:8-jdk-alpine

ENV PLANTUML_VERSION=1.2019.8

RUN \
  apk add --no-cache graphviz wget ca-certificates font-noto && \
  wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
  apk del wget ca-certificates

ENV LANG en_US.UTF-8

WORKDIR /
ENTRYPOINT ["java", "-jar", "plantuml.jar", "-o", "/usr/src/assets/rendered", "/usr/src/assets/source/*.puml"]

# Uncomment the following line to generate SVGs by default
# CMD ["-tsvg"]
