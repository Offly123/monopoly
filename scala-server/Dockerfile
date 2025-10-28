FROM openjdk:8

# Coursier
RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | \
    gzip -d > \
    cs && \
    chmod +x cs && \
    cp cs /usr/local/bin

# Scala
RUN cs install scala3-compiler --install-dir /usr/local/bin

# sbt
RUN cs install sbt --install-dir /usr/local/bin

WORKDIR /app/monopoly

COPY ./monopoly .

RUN sbt compile

CMD ["sh", "-c", "sbt run"]