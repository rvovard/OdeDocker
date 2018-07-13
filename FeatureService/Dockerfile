# FeatureService Dockerfile

FROM node:9.2.0

WORKDIR /opt

RUN git clone --single-branch -b tmp-add-react-endpoints https://github.com/ixio/FeatureService

WORKDIR /opt/FeatureService

RUN npm install

ADD ./hyperswitch.patch /opt/FeatureService/hyperswitch.patch
RUN patch -p0 < hyperswitch.patch

RUN touch htpasswd && \
    cp config.test.yaml config.yaml && \
    sed -i "s:your/htpasswd/file/path:opt/FeatureService/htpasswd:" config.yaml && \
    sed -i "s/port: 5433/port: 5432,\n            host: 'testdb'/" knexfile.js && \
    sed -i "s/ebdo/ode/" sys/front_manager.js

RUN ln -s /opt/FeatureService/node_modules/knex/bin/cli.js /usr/bin/knex

EXPOSE 7231
