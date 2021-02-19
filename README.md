# IMS_MRDB
Nova IMS - Managing Relational and non-Relational Databases

## Intro

This is a repo where all the installation steps and lab exercises for the Managing Relational & Non Relational DBs lecture will be placed, publicly avaitable to everyone.

Please use at your own reponsibility, as:

 1. No one can assure the exercises, results, scripts, are 100% correct 
 2. Installation steps wont damage any of your environment's setup 

It's assumed you already have a valid Azure subscription

## Environment

Using and old mid2014 MacBook Air, so it I ran it here, you can run it also.

Main tools used:

- VSCode with MS Azure tools and MS SQL Server extensions installed
- Azure cli for macOS

### Environment setup

#### VSCode

The easiest setup, just download VScode for your platform, open VScode and install the extensions. After the installation is conplete, just goto command (shift+command+P) and select 'Azure Sign In' and follow the instructions.

After the login, you should be able to navigate your server from the left hand-side SQL server icon (option+command+D)

### Azure Cli

In MacOS, install via brew:
> $brew update && brew install azure-cli  

## AventureWorks DBs deployment

Download the .bak files for the AdventureWorks 2019 DBs (LT and OLTP versions)
> $ wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak  
> $ wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksLT2019.bak  
> $ mv AdventureWorks2019.bak AdventureWorks.bak  
> $ mv AdventureWorksLT2019.bak AdventureWorksLT.bak

You'll also need the [mssql tools]('https://cloudblogs.microsoft.com/sqlserver/2017/05/16/sql-server-command-line-tools-for-macos-released/') for MacOS from MS
> $ brew install --no-sandbox msodbcsql mssql-tools


Login to Azure
> $ az login

Follow the instructions on the screen and browser

