FROM golang:1.20-alpine AS builder

WORKDIR /app
COPY . .

RUN go build

FROM alpine:latest AS production

WORKDIR /app
COPY --from=builder /app/ytarchive /app/ytarchive

CMD ["/app/ytarchive"]