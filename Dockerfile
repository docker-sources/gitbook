FROM debian:stretch

MAINTAINER Fabio J L Ferreira <fabiojaniolima@gmail.com>

# INstala o Calibre, Nodejs, gitbook e dependências
RUN apt-get update && \
    apt-get install -y gnupg curl wget unzip calibre && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    npm install gitbook-cli -g && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*
    
# Instala Arial fonts
RUN wget -P /tmp/raw_fonts https://github.com/billryan/algorithm-exercise/files/279471/arial.zip && \
    cd /tmp/raw_fonts && \
    unzip -o arial.zip && \
    mv -t /usr/share/fonts/truetype Arial*ttf && \
    rm arial.zip && \
    fc-cache -f -v

# Instala a versão 3.2.3 do gitbook (opcionalmente: latest)
RUN gitbook fetch 3.2.3

WORKDIR /opt

EXPOSE 4000

CMD ["gitbook", "--help"]