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
RUN apt-get install ruby-full
RUN gem install sass
RUN go get -d https://github.com/Prometheus-SCN/prometheus-website
WORKINGDIR $GOROOT/github.com/Prometheus-SCN/prometheus-website
RUN npm install
RUN grunt
WORKINGDIR $GOROOT/github.com/Prometheus-SCN/prometheus-website/server
RUN go build
CMD ./server 8080
ENTRYPOINT ./server 8080
EXPOSE 8080 2368

