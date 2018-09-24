# FeatureService Dockerfile

FROM node:9.2.0

WORKDIR /opt

RUN git clone --single-branch -b add-campaign-report-endpoint https://github.com/ixio/FeatureService

WORKDIR /opt/FeatureService

COPY audio_files/* resources/annotator/wav/
COPY z_init_demo.js db/seeds/test/

RUN npm install

ADD ./hyperswitch.patch /opt/FeatureService/hyperswitch.patch
RUN patch -p0 < hyperswitch.patch

RUN touch htpasswd && \
    cp config.test.yaml config.yaml && \
    sed -i "s/1h/40d/g" config.yaml && \
    sed -i "s/port: 5433/port: 5432,\n            host: 'testdb'/" knexfile.js

RUN ln -s /opt/FeatureService/node_modules/knex/bin/cli.js /usr/bin/knex

EXPOSE 7231
