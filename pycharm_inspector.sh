#!/bin/bash
set -x

docker run -v <directory to mount>:/<as mounted name>  <docker hub>/pycharm_inspector:latest <directory to scan> <inspection profile = ./unbound_locals.xml> <results directory>
