FROM alpine:3.7

MAINTAINER ragetti

RUN mkdir -p /app
WORKDIR /app

RUN apk --no-cache --no-progress update && \
  apk apk --no-cache --no-progress upgrade && \
  apk --no-cache --no-progress add bash cmake g++ make openssl openssl-dev glib git linux-headers && \
  git clone https://github.com/pocoproject/poco && \
  cd poco && \
  cmake -DENABLE_DATA_MYSQL=OFF -DENABLE_DATA_ODBC=OFF -DENABLE_MONGODB=OFF -DENABLE_ZIP=OFF -DENABLE_PAGECOMPILER=OFF -DENABLE_PAGECOMPILER_FILE2PAGE=OFF && \
  make install && \
  cd .. && \
  rm -r poco
