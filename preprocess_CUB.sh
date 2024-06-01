# CUB data preparation
mkdir -p CUB/dataset && mkdir -p CUB/CUB_original && mkdir -p CUB/CUB_processed
cd CUB
wget -q --show_progress "https://data.caltech.edu/records/65de6-vp158/files/CUB_200_2011.tgz"
tar -zxf CUB_200_2011.tgz -C dataset
python data_processing.py -save_dir CUB_original/ -data_dir dataset/CUB_200_2011
python generate_new_data.py GetClassAttributesData --out_dir CUB_processed/ --data_dir CUB_original/