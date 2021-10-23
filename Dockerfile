FROM golang:rc-alpine AS builder

WORKDIR /go/src/app
COPY ./HelloWorld.go .

RUN go build HelloWorld.go

#############################
FROM scratch

COPY --from=builder /go/src/app/HelloWorld /go/src/app/HelloWorld

ENTRYPOINT ["/go/src/app/HelloWorld"]