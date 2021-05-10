################################################################################################################################################################################
# 							Sentinel-1 data pre-processing
# 
# Parameters substitution:
#
# 1st parameter: location to the graph.xml file
# 2rd parameter: location to the folder containing the source products to be processed
# 3th parameter: location of the WKT which contains the Geographic coordinates for image subseting
# 4th parameter: location of the output folder
#
#
# 								HOW TO RUN THE SCRIPT
#
# bash <bash.sh script> <location of the graph> <folder of raw SAR scene> <folder contains the aoi> <output folder>
#
# 										EXAMPLE
#
# bash s1_preprocessing.sh graph/s1_preprocessing.xml input aoi/aoi.txt output/
#  
# 									Area of interest
#
# A Well Known Text (WKT) with geographic coordinates is required in order to subset the scene
# over our area of interest. The WKT can be produced using the link below
#
# 				link for the AOI:  https://arthur-e.github.io/Wicket/sandbox-gmaps3.html
###############################################################################################################################################################################


#gptPath=~/snap/bin/gpt
gptPath=/opt/snap/bin/gpt
graph="$1"
source_folder="$2" 
geoRegion="$3" 
target_product="$4"


function get_date_raw () {
    echo $1 | sed -r 's/[^ ]*(_(2.......)T......){2}[^ ]*\.zip/\2/g'
}


function get_source_type () {
	path="$1"
	echo ${path##*/} | grep -o .*_ | cut -d "_" -f1-3
}

printf 'SAR image pre-processing starts......\n'

AOI_coords=("${geoRegion}")
coords=`cat $AOI_coords` 

files=($(find "${source_folder}"/*.zip ))
for ((i=0; i<${#files[*]}; i++))
do
	source_product="${files[$i]}" 
	source_product_date=$(get_date_raw "${source_product}")
	source_product_type=$(get_source_type "${source_product}")
	target_product_name="subset_${source_product_type}_${source_product_date}"
	echo $target_product_name

	${gptPath} "${graph}" \
	-Psource="${source_product}" \
	-PgeoRegion="${coords}" \
	-Ptarget="${target_product}${target_product_name}" 
done

