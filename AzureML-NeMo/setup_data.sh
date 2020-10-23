#!/bin/bash
clear

MYPWD=${PWD}
echo $MYPWD

DATA_DIR='DATA_DIR'
# rm -rf $DATA_DIR Use bash cleanse.sh instead
NER_DATA_DIR=$DATA_DIR/NER
GLUE_DATA_DIR=$DATA_DIR/glue_data

# pip install wget

python create_data.py --data_dir=$DATA_DIR

cd $DATA_DIR/
python download_glue_data.py

cd $MYPWD

mv $DATA_DIR/NER/devel.tsv $DATA_DIR/NER/dev.tsv

python DATA_DIR/import_from_iob_format.py --data_file=DATA_DIR/NER/train.tsv
python DATA_DIR/import_from_iob_format.py --data_file=DATA_DIR/NER/dev.tsv
python DATA_DIR/import_from_iob_format.py --data_file=DATA_DIR/NER/test.tsv

echo "----------- head NER/text_train.txt -----------"
head $NER_DATA_DIR/text_train.txt
echo "----------- head NER/labels_train.txt -----------"
head $NER_DATA_DIR/labels_train.txt
echo "----------- head CoLA/train.tsv -----------"
head $GLUE_DATA_DIR/CoLA/train.tsv

# let's first create a subset of our dev data
head -n 100 $NER_DATA_DIR/text_dev.txt > $NER_DATA_DIR/sample_text_dev.txt
head -n 100 $NER_DATA_DIR/labels_dev.txt > $NER_DATA_DIR/sample_labels_dev.txt

mv DATA_DIR/NCBI_corpus.zip DATA_DIR/NER/NCBI_corpus.zip
mv DATA_DIR/NCBI_corpus_development.txt DATA_DIR/NER/NCBI_corpus_development.txt
mv DATA_DIR/NCBI_corpus_testing.txt DATA_DIR/NER/NCBI_corpus_testing.txt
mv DATA_DIR/NCBI_corpus_training.txt DATA_DIR/NER/NCBI_corpus_training.txt

rm -rf mlruns
rm -rf wandb

echo "----------- files in DATA_DIR -----------"
ls -lh $DATA_DIR
echo "----------- files in GLUE_DATA_DIR -----------"
ls -lh $GLUE_DATA_DIR
echo "----------- files in NER_DATA_DIR -----------"
ls -lh $NER_DATA_DIR


git clone --branch v1.0.0b1 https://github.com/NVIDIA/NeMo.git
mv NeMo NeMo_v1.0.0b1

sleep 10

git clone https://github.com/NVIDIA/NeMo.git

echo "----------- Data Setup Done -----------"