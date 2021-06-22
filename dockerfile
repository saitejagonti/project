FROM openjdk

MAINTAINER Saiteja

USER root

RUN apt-get update

RUN apt-get -y install maven

COPY pom.xml /usr/local/service/pom.xml

COPY src /usr/local/service/src

WORKDIR /usr/local/service
