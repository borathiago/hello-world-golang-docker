FROM golang:1.22-alpine as setup

WORKDIR /app
COPY . .
RUN go build -o /main main.go

FROM scratch
WORKDIR /
COPY --from=setup /main /main
EXPOSE 8000
ENTRYPOINT [ "/main" ]