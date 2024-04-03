FROM golang:1.21-alpine AS build

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY .. ./

RUN CGO_ENABLED=0 GOOS=linux go build -v -o quack


FROM alpine:latest

LABEL org.opencontainers.image.description="Quack application as a docker image"
LABEL org.opencontainers.image.source=https://github.com/m00nyONE/quack
LABEL org.opencontainers.image.licenses=Apache-2.0

RUN apk update && \
    apk upgrade &&  \
    rm -rf /var/cache/apt/*

COPY --from=build /app/quack /app/quack

CMD ["/app/quack"]
