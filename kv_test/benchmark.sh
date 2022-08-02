set -e

DATASET_NAMES=(
  "books_800M_uint64"
  "fb_200M_uint64"
  "osm_cellids_800M_uint64"
  "wiki_ts_200M_uint64"
  "gmm_k100_800M_uint64"
)

ROOT=$1
OUT_PATH=${ROOT}/out-newks

echo "${ROOT}"

mkdir -p ${ROOT}/temp/pgm
mkdir -p ${ROOT}/storage/pgm
mkdir -p ${OUT_PATH}

echo "Start PGM Benchmark"

for ((i = 0; i < ${#DATASET_NAMES[@]}; i++)) do
    for ((j = 0; j < 40; j++)) do
        dataset_name="${DATASET_NAMES[$i]}"
       	echo ">>> ${dataset_name} ${j}"
	bash ./reload_nfs.sh
	./kv_test/kv_benchmark \
   	    --key_path=${ROOT}/newkeyset/${dataset_name}_ks_${j} \
            --target_db_path=${ROOT}/storage/pgm/${dataset_name} \
	    --out_path=${OUT_PATH}/${dataset_name}_out.txt
    done
done
