FROM golang:1.14-alpine AS builder

WORKDIR /go/src/app

COPY . . 

RUN go build -ldflags "-s -w" -o /go/hello

FROM scratch

COPY --from=builder /go/hello /go/hello

ENTRYPOINT [ "/go/hello" ]