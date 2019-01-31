# docker-golang in Beta

https://cloud.docker.com/u/jsb13207/repository/docker/jsb13207/my-golang-app

<h3>Two ways to install this Docker image. Make sure you are in right directory</h3>

<h2>1. Building container using Dockerfile</h2>
<ul>
    <li>clone this repository. Then cd to docker-golang</li>
    <li>docker build . -t my-golang-app</li>
    <li>docker run -p 3030:3001 my-golang-app:latest | ctrl+c to exit prompt</li>
    <li>docker-compose up</li>
</ul>

<h2>2. Using Docker pull from hub</h2>
<ul>
    <li>docker pull jsb13207/my-golang-app:latest</li>
    <li>docker run -p 3030:3001 jsb13207/my-golang-app:latest | ctrl+c to exit prompt</li>
    <li>open docker-compose.yml and modify the "container_name: jsb13207/my-golang-app:latest"</li>
    <li>docker-compose up</li>
</ul>
