FROM golang:1.21-alpine AS build

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -v -o quack


FROM alpine:latest

RUN apk update && \
    apk upgrade &&  \
    rm -rf /var/cache/apt/*

COPY --from=build /app/quack /app/quack

CMD ["/app/quack"]
