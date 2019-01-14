FROM golang:1.9.2-alpine3.6 AS build

WORKDIR /go/src/app/
COPY . .

# Install git and cmd depedencies
RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep

# Install dev stacks
RUN apk update && apk add \
    # -- update nodejs nodejs-npm \
    curl \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

CMD ["app"]