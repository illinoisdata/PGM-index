set -e

DATASET_NAMES=(
  "books_800M_uint64"
  "fb_200M_uint64"
  "osm_cellids_800M_uint64"
  "wiki_ts_200M_uint64"
)

ROOT=$1
echo "${ROOT}"

echo "Start PGM Benchmark"

for ((i = 0; i < ${#DATASET_NAMES[@]}; i++)) do
    for ((j = 0; j < 10; j++)) do
        dataset_name="${DATASET_NAMES[$i]}"
       	echo ">>> ${dataset_name} ${j}"
	bash ./reload_local.sh
	./kv_test/kv_benchmark \
   	    --key_path=${ROOT}/keyset/${dataset_name}_ks \
            --target_db_path=${ROOT}/storage/pgm/${dataset_name} \
	    --out_path=${ROOT}/out/${dataset_name}_out.txt
    done
done
