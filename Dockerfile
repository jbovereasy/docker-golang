FROM golang:alpine

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

#Go path
ADD ./src /go/src/app
WORKDIR /go/src/app

#Set environment var
ENV PORT=3001

#Command to run app
CMD ["go", "run", "main.go"]