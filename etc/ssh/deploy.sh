#!/bin/bash

DIR=`pwd`
for file in `ls .`
do
  if [[ ${file} != "deploy.sh" ]]; then
    ln -s ${DIR}/${file} ~/.ssh/${file}
  fi
done
