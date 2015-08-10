FROM iserko/docker-ubuntu-locale

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
RUN apt-get install -y ruby
RUN export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8 && export LANGUAGE=en_US.UTF-8 && gem install sass
WORKDIR $GOROOT
WORKDIR src
RUN mkdir github.com
WORKDIR github.com
RUN mkdir Prometheus-SCN
WORKDIR Prometheus-SCN
RUN git clone https://github.com/Prometheus-SCN/prometheus-website
WORKDIR prometheus-website
RUN export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8 && export LANGUAGE=en_US.UTF-8 && grunt
WORKDIR server
RUN go get
RUN go build
CMD ./server 80
ENTRYPOINT ./server 80
EXPOSE 8080

