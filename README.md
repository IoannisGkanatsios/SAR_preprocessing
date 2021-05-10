# SAR data preprocessing

An automated way of pre processing Sentinel-1 SAR data. The script uses the Graph Processing Tool (gpt) in SNAP (S1TBX - ESA Sentinel-1 Toolbox, http://step.esa.int) and performs all the necessary pre processing steps for the Sentinel-1 data


# Run the script

**prerequisites**

The bash scipt is looking for location of the gpt installation  at `~/snap/bin/gpt`. If the gpt is not installed at this directory, then the location of the gpt should be changed to `/opt/snap/bin/gpt` at the top of the bash sscript

**Execute the script**

``` bash s1_preprocessing.sh graph/s1_preprocessing.xml input aoi/aoi.txt output/ ```
