FROM openjdk:8-alpine

RUN apk add --no-cache curl bash

#Gradle installation
ARG GRADLE_VERSION=7.4.2
ARG GRADLE_URL=https://services.gradle.org/distributions

RUN mkdir -p /usr/share/gradle \
  && echo "Downlaoding gradle..." \
  && curl -fsSL -o /tmp/gradle.zip ${GRADLE_URL}/gradle-${GRADLE_VERSION}-bin.zip \
  \
  && echo "Extracting gradle..." \
  && unzip -d /usr/share/gradle /tmp/gradle.zip \
  \
  && echo "Cleaning up..." \
  && rm -f /tmp/gradle.zip \
  && ln -s /usr/share/gradle/gradle-${GRADLE_VERSION} /usr/bin/gradle \
  \
  && echo "Gradle instlled!"
  
ENV GRADLE_VERSION 7.4.2
ENV GRADLE_HOME /usr/bin/gradle
ENV GRADLE_USER_HOME /cache
ENV PATH $PATH:$GRADLE_HOME/bin

VOLUME ebiznes_shared_volume

EXPOSE 8000