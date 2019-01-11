FROM golang:1.8

WORKDIR /go/src/app
COPY . .

# Install go
RUN go get -d -v ./...
RUN go install -v ./...

# Install dependencies
RUN apt-get update && apt-get install -yq --no-install-recommends \
    curl \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    nano \
    unzip \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

CMD ["app"]