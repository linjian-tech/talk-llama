FROM ubuntu:22.04 AS build
WORKDIR /app

RUN apt-get update && \
  apt-get install -y build-essential libsdl2-dev espeak-ng alsa-utils alsa-base alsa-oss libsndfile1-dev libasound2 libasound2-dev pulseaudio\
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

COPY . .
RUN make talk-llama

FROM ubuntu:22.04 AS runtime
WORKDIR /app

RUN apt-get update && \
  apt-get install -y curl ffmpeg libsdl2-dev espeak-ng alsa-utils alsa-base alsa-oss libsndfile1-dev libasound2 libasound2-dev pulseaudio\
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

COPY --from=build /app /app
ENTRYPOINT [ "bash", "-c" ]


