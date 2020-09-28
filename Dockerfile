# syntax = docker/dockerfile:experimental@sha256:de85b2f3a3e8a2f7fe48e8e84a65f6fdd5cd5183afa6412fff9caa6871649c44
FROM golang AS stage1

ENV GOCACHE=/root/.cache/go-build/gocache
ENV GOMODCACHE=/root/.cache/go-build/gomodcache
ENV CGO_ENABLE=0
ENV GOPATH=

COPY . .

RUN --mount=type=cache,target=/root/.cache/go-build mkdir -p /root/.cache/go-build/build
RUN --mount=type=cache,target=/root/.cache/go-build go mod download
RUN --mount=type=cache,target=/root/.cache/go-build go build -o main

FROM busybox

COPY --from=stage1 /go/main /entrypoint

ENTRYPOINT ["/entrypoint"]
