#!/bin/bash

mkdir -p $1/{tasks,handlers,files,templates,vars,defaults,meta}

for i in `ls -1 $1`; do touch $1/$i/README.md; done

ls -lR $1

