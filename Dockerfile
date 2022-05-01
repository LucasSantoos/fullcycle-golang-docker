FROM golang:1.12-alpine as Builder

WORKDIR /usr/src/app

COPY /main .

RUN CGO_ENABLED=0 GOOS=linux go build main.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=Builder /usr/src/app/main /usr/src/app

ENTRYPOINT [ "./main" ] 
