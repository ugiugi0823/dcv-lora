# 현재 작업 디렉토리를 변수에 저장
current_dir=$(pwd)

# 변수 출력
echo "🔥 현재 경로!! 🔥: $current_dir"

# 현재 디렉토리를 기반으로 파일 경로 설정
accelerate_config_file="$current_dir/accelerate_config/config.yaml"
dataset_config_file="$current_dir/DCV/dataset_config.toml"
config_file="$current_dir/DCV/training_config.toml"
train_network_script="$current_dir/train_network.py"

echo " $accelerate_config_file"


# accelerate launch 명령어 실행
accelerate launch --config_file $accelerate_config_file \
                  --num_cpu_threads_per_process 1 \
                  $train_network_script \
                  --dataset_config $dataset_config_file \
                  --config_file $config_file