import os
import wget
import argparse

parser = argparse.ArgumentParser(description="setup the data for NeMo")
parser.add_argument("-d", "--data_dir", type=str, help="the base data directory")
args = parser.parse_args()

DATA_DIR = args.data_dir #"DATA_DIR"
print('data starts at: {}'.format(DATA_DIR))

os.makedirs(DATA_DIR, exist_ok=True)      
os.makedirs(os.path.join(DATA_DIR, 'NER'), exist_ok=True)

print('Downloading NCBI data...')
wget.download('https://www.ncbi.nlm.nih.gov/CBBresearch/Dogan/DISEASE/NCBI_corpus.zip', DATA_DIR)

import zipfile
with zipfile.ZipFile(os.path.join(DATA_DIR, 'NCBI_corpus.zip'), 'r') as zip_ref:
    zip_ref.extractall(DATA_DIR)

print('Downloading ncbi-disease/master/conll/train ...')
wget.download('https://raw.githubusercontent.com/spyysalo/ncbi-disease/master/conll/train.tsv', os.path.join(DATA_DIR, 'NER'))
print('Downloading ncbi-disease/master/conll/devel ...')
wget.download('https://raw.githubusercontent.com/spyysalo/ncbi-disease/master/conll/devel.tsv', os.path.join(DATA_DIR, 'NER'))
print('Downloading ncbi-disease/master/conll/test ...')
wget.download('https://raw.githubusercontent.com/spyysalo/ncbi-disease/master/conll/test.tsv', os.path.join(DATA_DIR, 'NER'))
print('Downloading import_from_iob_format.py ...')
wget.download('https://raw.githubusercontent.com/NVIDIA/NeMo/main/examples/nlp/token_classification/data/import_from_iob_format.py', os.path.join(DATA_DIR))

glue_data = os.path.join(DATA_DIR, 'glue_data')
os.makedirs(glue_data, exist_ok=True)

print('download download_glue_data.py script...')
wget.download('https://gist.githubusercontent.com/W4ngatang/60c2bdb54d156a41194446737ce03e2e/raw/17b8dd0d724281ed7c3b2aeeda662b92809aadd5/download_glue_data.py', DATA_DIR)
