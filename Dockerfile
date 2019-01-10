FROM golang:1.8

WORKDIR /go/src/app
COPY . .

# Update Debian Machine & set UTC
RUN apt-get update && apt-get install -y locales \
  && locale-gen en_US.UTF-8 \

  # Install software-properties-common & python-software-properties to install apt-add-repository
  && apt-get update \

  # Install go
  RUN go get -d -v ./...
RUN go install -v ./...


# Install dev stack
RUN apt-get install -y \
  curl \
  git \
  unzip \
  vim \
  wget \

  && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
  && apt-get install -y nodejs \

  # Install npm
  && nvm install --lts \
  && npm install -g yarn \
  && npm install serverless -g \
  && apt-get update \

  CMD ["app"]