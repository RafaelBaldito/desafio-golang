# # BUILD
# FROM golang:1.7.3

# WORKDIR /go/src/app
# ADD hello-world.go /go/src/app

# RUN go build hello-world.go

# # Compilação
# FROM alpine:latest

# RUN apk --no-cache add ca-certificates

# COPY --from=0 "/go/src/app/hello-world" hello-world

# ENTRYPOINT ./hello-world


FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]
