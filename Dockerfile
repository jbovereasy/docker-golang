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
    && rm -rf /var/lib/apt/lists/* \
    # Install composer and NVM
    && curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
    #Install node
    && curl -sL https://deb.nodesource.com/setup_11.x | sudo bash - \
    && apt-get install -y nodejs \
    && apt-get install -y build-essential \
    # Install npm packages
    && nvm install --lts \
    && npm install -g yarn \
    && npm install serverless -g \
    && apt-get update

EXPOSE  8080
CMD ["app"]