FROM pihole/pihole:beta-v5.0-armhf

#Install cloudflared
#https://docs.pi-hole.net/guides/dns-over-https/
RUN wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz &&\
tar -xvzf cloudflared-stable-linux-arm.tgz &&\
sudo cp ./cloudflared /usr/local/bin &&\
sudo chmod +x /usr/local/bin/cloudflared &&\
cloudflared -v

COPY config.yaml /etc/cloudflared/config.yaml

RUN sudo cloudflared service install

ENTRYPOINT [ "sudo cloudflared service start && /s6-init" ]

