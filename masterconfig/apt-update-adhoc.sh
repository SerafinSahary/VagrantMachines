#!/bin/bash

ansible all -v -b -m shell -a 'apt-get -q update'

