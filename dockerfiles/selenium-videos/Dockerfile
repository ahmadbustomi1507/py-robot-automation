FROM selenium/video:latest

USER root
#RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*
RUN useradd -m user1
RUN chown -R user1:user1 /videos
RUN chmod -R 777 /videos
USER user1