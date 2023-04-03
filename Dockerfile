FROM golang AS builder
RUN mkdir -p /go/src/pipline
WORKDIR /go/src/pipline
ADD pipline.go .
ADD go.mod .
RUN go install .
FROM alpine:latest
LABEL version="1.0.0"
LABEL maintainer="Denis Victorovich<slbdenis.victor@gmail.com>"
WORKDIR /root
COPY --from=builder /go/bin/pipline .
ENTRYPOINT ./pipline