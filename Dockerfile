FROM ubuntu:latest as builder
RUN apt-get update && apt-get -y install gcc libc-dev
COPY . /work/ipc
WORKDIR /work/ipc
RUN gcc -o /usr/bin/ipc ipc.c -lrt

FROM debian
COPY --from=builder /usr/bin/ipc /usr/bin/ipc
ENTRYPOINT ["/usr/bin/ipc"]
