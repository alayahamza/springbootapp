#!/bin/bash

echo "*************************"
echo "*****Building jar********"
echo "*************************"

WORKSPACE=/var/lib/jenkins/workspace/spring-angular-docker-app/spring-boot-app

docker run --rm -v $WORKSPACE:/app -v /root/.m2 -w /app maven-npm "$@"
