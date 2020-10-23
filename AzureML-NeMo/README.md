This is to set up the Azure ML Environment to use Nvidia NeMo
https://ngc.nvidia.com/catalog/containers/nvidia:nemo

This works as both automated Docker scripts though the command line, or notebooks 

## Install 
Navigate to the AzureML-NeMo folder (preferably under your Azure ML user folder)
Run the '''setup_jupyter_env_latest.ipynb''' notebook double arrows (run-all)
Next open a new termial, cd into the AzureML-NeMo folder and run '''bash setup_data.sh'''

## jupyter notebooks 
'''my_GLUE_Benchmark.ipynb''' and '''my_Token_Classification-BioMegatron.ipynb''' can be ran in place after the install is done. 
Notebooks in both NeMo_v1.0.0b1 and NeMo will run, mostly without warning. However, a few will happen. NeMo is the latest release from main. NeMo_v1.0.0b1 is the last stable release. 

## docker scripts 
'''launch-nemo-latest.sh''' will launch both NER and Glue NLP task with the same setup as the environment 
'''launch-nemo-glue_v1.0.0b1.sh''' and '''launch-nemo-ner_v1.0.0b1.sh''' will run the stable release (not main, like latest)

modify '''go-gluetask.sh''' and '''go-NERNLP.sh''' to adjust  hyperparameters