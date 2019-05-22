#!/bin/bash

ansible-playbook -i hosts.yml -l all elk.yml

