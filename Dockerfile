FROM golang:1.14-alpine AS builder

WORKDIR /go/src/app

COPY . . 

RUN go get -d -v
RUN go build -ldflags "-s -w" -o /go/src/app

FROM scratch

COPY --from=builder /go/src/app .

ENTRYPOINT [ "go", "run", "hello-world.go" ]