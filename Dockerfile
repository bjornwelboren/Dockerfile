FROM        plesk_updated
MAINTAINER  bjorn welboren

RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -yq rsync

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/^#?PubkeyAuthentication\s+.*/PubkeyAuthentication yes/' etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUN chmod 600 ~/.ssh
ADD ./Docker/.ssh /root/.ssh
RUN chmod 700 ~/.ssh/*
