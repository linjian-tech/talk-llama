# 1. download model
```bash
e.g., include whisper(ggml-base.bin) and llama (Mixtral-8x7B-Instruct-v0.1.gguf)
```
# 2. make docker image
```bash
sudo docker build -t talk_dec_llama -f talk_dec_llama.Dockerfile .
```
# 3.1. run docker contrainer (using llama dec-server)
```bash
sudo docker run -it --rm   -v /path/to/models:/models  -p 8090:8090 --add-host host.docker.internal:host-gateway --device /dev/snd:/dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v ~/.config/pulse/cookie:/root/.config/pulse/cookie --group-add $(getent group audio | cut -d: -f3)  image_name "./talk-dec-llama -mw /models/ggml-base.bin  -p "Georgi" -t 4  -cap 3 --llama-server 10.96.132.55:8080 --whisper-host 0.0.0.0 --intranet-host 10.96.132.55"
* e.g., /path/to/models: /home/lenovo/桌面/whisper/whisper.cpp/models
* image_name: talk_dec_llama:latest  
* llama.gguf: Mixtral-8x7B-Instruct-v0.1.gguf
* llama-server 10.96.132.55:8080 (note: llama-server: dec master host, here I use the intranet host, because 127.0.0.1 and 0.0.0.0 cannot be found within the container) 
* intranet-host 10.96.132.55 (note: llama-server: dec master host, here I use the intranet host, because 127.0.0.1 and 0.0.0.0 cannot be found within the container)
```
# run in local machine (using llama dec-server)
```bash
./talk-dec-llama -mw /home/lenovo/桌面/whisper/whisper.cpp/models/ggml-base.bin -ml /home/lenovo/桌面/whisper/whisper.cpp/models/ggml-model-q4_0.gguf -p "Georgi" -t 2 -l zh -cap 3
```