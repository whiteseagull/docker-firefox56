FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget gtk3.0

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer && \
	cd /tmp && wget http://ftp.mozilla.org/pub/firefox/releases/56.0/linux-x86_64/en-US/firefox-56.0.tar.bz2 && tar -xjf firefox-56.0.tar.bz2 && mv firefox /opt 

USER developer
ENV HOME /home/developer
CMD /opt/firefox/firefox
