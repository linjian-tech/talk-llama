# 1. download model
```bash
e.g., include whisper(ggml-base.bin) and llama (Mixtral-8x7B-Instruct-v0.1.gguf)
```
# 2. make docker image
```bash
sudo docker build -t talk_llama_zh_en -f talk_llama.Dockerfile .
```
# 3.1. run docker contrainer
```bash
sudo docker run -it --rm   -v /path/to/models:/models  --device /dev/snd:/dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v ~/.config/pulse/cookie:/root/.config/pulse/cookie --group-add $(getent group audio | cut -d: -f3)  image_name "./talk-llama -mw /models/ggml-base.bin -ml /models/llama.gguf -p "Georgi" -t 2 -l zh -cap 3"
* e.g., /path/to/models: /home/lenovo/桌面/whisper/whisper.cpp/models
* image_name: talk_llama_zh_en:latest  
* llama.gguf: Mixtral-8x7B-Instruct-v0.1.gguf
```
# run in local machine 
```bash
./talk-llama -mw /home/lenovo/桌面/whisper/whisper.cpp/models/ggml-base.bin -ml /home/lenovo/.cache/huggingface/hub/models--TheBloke--Mixtral-8x7B-Instruct-v0.1-GGUF/snapshots/fa1d3835c5d45a3a74c0b68805fcdc133dba2b6a/mixtral-8x7b-instruct-v0.1.Q4_K_M.gguf -p "Georgi" -t 2 -l zh -cap 3
```
