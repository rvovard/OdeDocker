# FrontManager Dockerfile

FROM node:9.2.0

WORKDIR /opt

RUN git clone https://github.com/ixio/FrontManager

WORKDIR /opt/FrontManager

RUN git submodule init && \
    git submodule update --recursive --remote

RUN npm install

RUN sed -i "s/ebdo/ode/" .env.development
