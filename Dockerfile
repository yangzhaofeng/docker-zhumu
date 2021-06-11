FROM debian:buster-slim

ENV ZHUMU_VERSION 2.5.361956.0302

RUN apt update && apt upgrade -y && \
	apt install -y xdg-utils libnss3 alsa-utils && \
	apt install -y wget && \
	cd /tmp && \
	wget -q https://downloads.zhumu.me/client/latest/linux/zhumu_${ZHUMU_VERSION}_amd64.deb && \
	dpkg -i zhumu_${ZHUMU_VERSION}_amd64.deb || apt install -f -y && \
	rm zhumu_${ZHUMU_VERSION}_amd64.deb && \
	apt remove -y wget --purge && apt autoremove -y --purge && \
	apt clean && rm -rf /var/lib/apt/lists/* && \
	cd -
