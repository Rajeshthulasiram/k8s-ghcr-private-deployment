#!/bin/bash

kubectl create secret docker-registry ghcr-secret \
  --docker-server=https://ghcr.io \
  --docker-username=rajesh-dev \
  --docker-password=ghp_xxxYourTokenxxx \
  --docker-email=rajesh@example.com \
  --namespace=dev
