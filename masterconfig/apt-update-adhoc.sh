#!/bin/bash

ansible all -b -m shell -a 'apt-get -q update'

