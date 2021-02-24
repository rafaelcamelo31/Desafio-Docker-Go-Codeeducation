FROM golang:1.14-alpine AS builder

WORKDIR /go/src/app

COPY . . 

RUN go get -d -v
RUN go build -ldflags "-s -w"

ENTRYPOINT [ "go", "run", "hello-world.go" ]