# syntax=docker/dockerfile:1

# latest alpine release
FROM alpine:3.18 AS build

WORKDIR /usr/local/src/ci-test
COPY . .
RUN mkdir -p newdir

FROM alpine:3.18 as install
WORKDIR /usr/local/src/ci-test

COPY --from=build /usr/local/src/ci-test/newdir /usr/local/src/ci-test/newdir

FROM install as test
RUN mkdir -p newdir/test && \
    ls newdir

FROM install
