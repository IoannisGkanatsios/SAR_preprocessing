# SAR data preprocessing

An automated way of pre processing Sentinel-1 SAR data. The script uses the Graph Processing Tool (gpt) in SNAP (S1TBX - ESA Sentinel-1 Toolbox, http://step.esa.int) and performs all the necessary pre processing steps for the Sentinel-1 data


# Run the script

The location of the gpt installation should be defined in the script, on the top. in older versions of SNAP, gpt is located at: `/snap/bin/gpt`. In the recent version which is SNAP 8, `gpt` is located at `/opt/snap/bin/gpt`.



``` bash s1_preprocessing.sh graph/s1_preprocessing.xml input aoi/aoi.txt output/ ```
