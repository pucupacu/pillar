#!/bin/bash
docker build -t pillar/api/v1 -f docker/api-dockerfile .
docker run -d --name pillar-api-v1 -p 8080:80 pillar/api/v1
