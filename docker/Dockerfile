FROM node:0.10.40
MAINTAINER Adriano Dadario
USER root
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean
RUN git clone https://github.com/dadario/blueprint-doc-show.git apps/blueprint-doc-show
RUN npm install -g grunt grunt-cli coffee-script protagonist aglio
ENV NODE_ENV=production
WORKDIR apps/blueprint-doc-show
RUN npm install
EXPOSE 3030
ENTRYPOINT grunt
