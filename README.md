# IMS_MRDB

Nova IMS - Managing Relational and non-Relational Databases

## Intro

This is a repo where all the installation steps and lab exercises for the Managing Relational & Non Relational DBs lecture will be placed, publicly avaitable to everyone.

Please use at your own reponsibility, as:

 1. No one can assure the exercises, results, scripts, are 100% correct
 2. Installation steps wont damage any of your environment's setup

It's assumed you already have a valid Azure subscription

## Environment

Using and old mid2014 MacBook Air BigSur, so it I ran it here, you can run it also.

Main tools used:

- VSCode with MS Azure tools and MS SQL Server extensions installed
- Azure cli for macOS
- Docker-desktop and Docker

### Environment setup

#### VSCode

The easiest setup, just download VScode for your platform, open VScode and install the extensions. After the installation is conplete, just goto command (shift+command+P) and select 'Azure Sign In' and follow the instructions.

After the login, you should be able to navigate your server from the left hand-side SQL server icon (option+command+D)

### Azure Cli

In MacOS, install via brew:
> $brew update && brew install azure-cli  

### Docker

again, install via brew:
> $brew update && brew install docker  
> $brew install docker-desktop --cask  

## Containder and AventureWorks DBs deployment

You have 2 options, either build the image yourself using the ´Dockerfile´ in this repo, or just pull an already built image with mssql and both DBs restored.

### Running the already built image

Just run the command below and connect to the ´localhost´server on port ´1433´ with user ´sa´ password ´ThisIsAReallyCoolPassword123´.

You'll be pulling an image from my public repo with everyting already running (hopefully)

> $ docker pull gaspia/ims_msssql  
> $ docker run -d --name AdventureWorks -p 1433:1433  gaspia/ims_msssql  

Once you've pulled the image, you can also use the docker-desktop GUI to run, kill, shell your container image (and discard the last command).

see below how to access to an interactive shell in the container.

### Building the docker image yourself

If you prefer to build the docker image by yourself, so you can install additional features, you can start by the base ´Dockerfile´, edit it as per your preferences.

To build the image, just make sure you are in the root of the repo where the ´Dockerfile´ is and run :

> $ docker build -t adventureworks:2019 .  

To run it:

> $ docker run -p 1433:1433 --name AdventureWorks -d adventureworks:2019  

The image is based on Microsoft oficial mssql server installation in ubunto, the DB files (.bak) are downloaded and restored into sql server et voila.

### Accessing a shell to gain container access

> $ docker exec -i -t AdventureWorks bash  

## Connecting do the MSSQL Server

Just open the Azure Data Studio, add a new server connection where the server/host is ´localhost´, Authentication is ´SQL server´, user ´sa´ and password is ´ThisIsAReallyCoolPassword123´.
