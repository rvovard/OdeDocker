# FrontApp Dockerfile

FROM node:9.2.0

WORKDIR /opt

RUN git clone --single-branch -b demo-september2018 https://github.com/ixio/FrontApp

WORKDIR /opt/FrontApp

RUN sed -i "s/Project-ODE/ixio/g" .gitmodules
RUN git submodule update --init
RUN cd public/audio-annotator && \
    git pull --rebase origin update-post-reaction && \
    cd ../..

RUN npm install

RUN echo "REACT_APP_API_URL=http://localhost:7231/data.ode.org/v1" > .env.development.local
