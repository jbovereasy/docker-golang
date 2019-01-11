FROM golang:1.9.2-alpine3.8 AS build

# Install tools required for app
# Run `docker build --no-cache .` to update dependencies
WORKDIR /go/src/app/
COPY . .

RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep

# Install dependencies and update
RUN apk update && apk add \
    -- update nodejs nodejs-npm \
    curl \
    git \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

CMD ["app"]