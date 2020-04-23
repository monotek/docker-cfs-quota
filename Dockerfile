FROM golang:alpine

COPY cfs.go /cfs.go

ENV CFS_SLEEP 100ms
ENV CFS_ITERATIONS 25

ENTRYPOINT go run /cfs.go -iterations $CFS_ITERATIONS -sleep $CFS_SLEEP