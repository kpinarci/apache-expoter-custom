FROM alpine:latest

ENV APACHE_EXPORTER_VERSION=0.13.0
ENV ARCHIVE_NAME=apache_exporter-${APACHE_EXPORTER_VERSION}.linux-amd64.tar.gz
ENV FOLDER_NAME=apache_exporter-${APACHE_EXPORTER_VERSION}.linux-amd64

WORKDIR /app

RUN apk add --no-cache libc6-compat curl neofetch && \
    curl -L https://github.com/Lusitaniae/apache_exporter/releases/download/v${APACHE_EXPORTER_VERSION}/${ARCHIVE_NAME} | tar xz && \
    mv ${FOLDER_NAME}/apache_exporter . && \
    rm -rf ${ARCHIVE_NAME} ${FOLDER_NAME}

EXPOSE 9117

ENTRYPOINT [ "/app/apache_exporter" ]

