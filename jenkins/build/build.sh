#!/bin/bash

cp -f target/springbootapp-0.0.1-SNAPSHOT.jar jenkins/build/

echo "******************************"
echo "*** Building Docker Images ***"
echo "******************************"


cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
