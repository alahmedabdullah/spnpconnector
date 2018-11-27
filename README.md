SPNP Smart Connector for Chiminey
=====================================
SPNP allows formal model checking of a system modeled as petri net.  'SPNP Smart Connector for Chiminey' allows payload parameter sweep over SPNP petri net models. Chiminey facilitates scheduling computes over the cloud for parallel execution of these SPNP models.

Once 'SPNP Smart Connector' is activated in Chiminey, Chiminey portal then allows to configure and submit a SPNP job for execution.

SPNP Smart Connector(SC) install
-------------------------------------
The SPNP SC installs SPNP binary in each Cloud VM. During activation of SPNP SC, the user is required to provide the SPNP binay built for linux. Please place the SPNP binary in the 'package' directory of chiminey install. Please refer to installation steps in https://github.com/alahmedabdullah/spnpconnector/blob/master/SETUP.md file for further details on installation steps.

The Input Directory
-------------------
A connector in Chiminey system specifes a 'Input Location' through 'Create Job' tab of the Chimney-Portal. Files located in the 'Input Location' directory is loaded to each VM for cloud execution. The content of 'Input Location' may vary for different runs. Chiminey allows parameteisation of the input envrionment. Any file with '_template' suffix located in the input directory is regarded as template file. Chiminey internally replaces values of the template tags based on the 'payload parameter sweep' provied as Json Dictionary from 'Create Job' tab in the Chiminey portal.

The input directory is provided with a template file 'run.sh_template' which is availabe in 'input_spnp' directory of SPNP SC install. All the template tags specified in  the run.sh_template file will be internally replaced by Chiminey with corresponding values that are passed in from 'Chiminey Portal' as Json dictionary. The 'run.sh_template' is  also renamed to 'run.sh' with all template tags replaced with corresponding values.

The model 'example1.c' is available in the example directory within the SPNP package. The following shell command is  used to execute the model.

```
$ spnp example1
```

Output files for the target SPNP model are created in the same directory where model file is located. To execute these SPNP models from the Chimiley portal, an appropiate JSON dictionary need to be passed in.  The JSON dictionary has to be passed in from 'Payload parameter sweep' field from Chiminey-Portal's 'Create Job' tab. Following ia an example JSON dictionary to execute the through this Smart Connector 

```
{ "model_name" :  [ "example1" ] }

```

Note that {{model_name}} is the tag name defined in the 'run.sh_template'. These template tags are replaced by appropiate value passed in through JSON dictionary.


Configure, Create and Execute a SPNP Job
---------------------------------------------
'Create Job' tab in 'Chiminey Portal' lists 'spnp' form for creation and submission of spnp job. The 'spnp' form requires definition of 'Compute Resource Name' and 'Storage Location'. Appropiate 'Compute Resource' and 'Storage Resource' need to be defined  through 'Settings' tab in the 'Chiminey portal'.

Payload Parameter Sweep
-----------------------
Payload parameter sweep for 'SPNP Smart Connector' in the Chiminey System may be performed by specifying appropiate JSON dictionary in 'Payload parameter sweep' field  of the 'spnp' form. 

Following ia an example JSON dictionary to execute SPNP model-checker through this Smart Connector:
```
{ "model_name" :  [ "example1" ] }
```

Above would create one task within a VM that has been allocate by Chiminey for execution of this task. The input fields in 'Cloud Compute Resource' form has to be:

```
Number of VM instances : 1
Minimum No. VMs : 1
```
