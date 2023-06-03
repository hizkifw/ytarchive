FROM golang:1.20-alpine AS builder

WORKDIR /app
COPY . .

RUN go build

FROM alpine:latest AS production

RUN apk --no-cache add ca-certificates ffmpeg

WORKDIR /app
COPY --from=builder /app/ytarchive /app/ytarchive

CMD ["/app/ytarchive"]