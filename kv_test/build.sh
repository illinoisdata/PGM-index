set -e

DATASET_NAMES=(
  "books_800M_uint64"
  "fb_200M_uint64"
  "osm_cellids_800M_uint64"
  "wiki_ts_200M_uint64"
)

ROOT=$1
echo "${ROOT}"

mkdir -p ${ROOT}/temp/pgm
mkdir -p ${ROOT}/storage/pgm
mkdir -p ${ROOT}/out

echo "Start Building PGM"

for ((i = 0; i < ${#DATASET_NAMES[@]}; i++)) do
    dataset_name="${DATASET_NAMES[$i]}"
    echo ">>> ${dataset_name} ${j}"
    ./kv_test/kv_build \
	--data_path=${ROOT}/data/${dataset_name} \
   	--build_db_path=${ROOT}/temp/pgm/${dataset_name} \
	--target_db_path=${ROOT}/storage/pgm/${dataset_name}
    
done
