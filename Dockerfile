FROM golang:latest

ADD main.go /go/main.go

RUN sed 's/CLOUD_PROVIDER/Heroku/' /go/main.go > /go/heroku.go

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags '-s -w' /go/heroku.go

CMD [ "/go/heroku" ]

# http server listens on port 8080.
EXPOSE 8080
