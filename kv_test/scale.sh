set -e

DATASET_NAMES=(
    "gmm_k100_200M_uint64"
    "gmm_k100_400M_uint64"
    "gmm_k100_600M_uint64"
    "gmm_k100_800M_uint64"
)

ROOT=$1
DATA_PATH=$2
echo "${ROOT}"

mkdir -p ${ROOT}/temp/pgm
mkdir -p ${ROOT}/storage/pgm

echo "Start PGM Scalability Test"

for ((i = 0; i < ${#DATASET_NAMES[@]}; i++)) do
    SECONDS=0
    dataset_name="${DATASET_NAMES[$i]}"
    echo ">>> ${dataset_name}"
    ./kv_test/kv_build \
        --data_path=${DATA_PATH}/${dataset_name} \
        --build_db_path=${ROOT}/temp/pgm/${dataset_name} \
        --target_db_path=${ROOT}/storage/pgm/${dataset_name}
    DURATION=$SECONDS
    echo "-------TIME---------"
    echo "It takes $(($DURATION * 1000)) milliseconds to build ${dataset_name} with max threads"
    echo "-------TIME---------"
done
