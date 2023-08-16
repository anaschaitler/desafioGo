FROM golang:1.20 AS builder

WORKDIR /app
COPY    /app .

RUN go build main.go

FROM scratch AS stage2 
WORKDIR /app
COPY --from=builder /app .
CMD ["./main"]