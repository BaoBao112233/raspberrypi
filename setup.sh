#!/bin/bash

if [ $# -eq 0 ]; then
  DATA_DIR="./"
else
  DATA_DIR="$1"
fi


# Install Python dependencies.
python3 -m pip install pip --upgrade
python3 -m pip install -r requirements.txt

python -m pip install --upgrade tflite-support==0.4.3

#install required system packages

sudo apt-get install libcblas-dev
sudo apt-get install libhdf5-dev
sudo apt-get install libhdf5-serial-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libjasper-dev 
sudo apt-get install libqtgui4 
sudo apt-get install libqt4-test

# Download TF Lite model with metadata.
FILE=${DATA_DIR}/efficientnet_lite0.tflite
if [ ! -f "$FILE" ]; then
  curl \
    -L 'https://storage.googleapis.com/download.tensorflow.org/models/tflite/task_library/image_classification/rpi/lite-model_efficientnet_lite0_uint8_2.tflite' \
    -o ${FILE}
fi

FILE=${DATA_DIR}/efficientnet_lite0_edgetpu.tflite
if [ ! -f "$FILE" ]; then
  curl \
    -L 'https://storage.googleapis.com/download.tensorflow.org/models/tflite/task_library/image_classification/rpi/efficientnet_lite0_edgetpu.tflite' \
    -o ${FILE}
fi
echo -e "Downloaded files are in ${DATA_DIR}"
