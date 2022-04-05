#/!bin/bash

plreview () {

  pt_path=$(which python3);
  python3 PLStream.py $pt_path

};

placc () {

  pt_path=$(which python3);
  python3 PLStream_acc.py $pt_path

};

