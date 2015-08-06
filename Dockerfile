FROM google/debian:wheezy

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates
RUN mkdir /nodejs && curl https://nodejs.org/dist/v0.10.40/node-v0.10.40-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git mercurial bzr
RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /gopath

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN npm install -g grunt-cli
RUN apt-get install -y apt-utils
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y ruby locales
ENV DEBIAN_FRONTEND ""
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en
RUN export LC_ALL="en_US.UTF-8"
RUN export LANG="en_US.UTF-8"
RUN gem install sass --no-rdoc --no-ri
RUN git clone https://github.com/Prometheus-SCN/prometheus-website
WORKDIR prometheus-website
RUN ls
RUN npm install
RUN grunt
WORKDIR server
RUN go build
CMD ./server 8080
ENTRYPOINT ./server 8080
EXPOSE 8080 2368

