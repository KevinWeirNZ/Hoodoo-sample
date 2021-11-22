# Hoodoo-sample
A project for learning some key aspects of the Hoodoo framework.

From : http://loyaltynz.github.io/hoodoo/

# ft-973 Build a Hoodoo service that returns the current time

Goals:
Create an endpoint that responds to  HTTP GET

Understand the basic structure of a Hoodoo service

Task:
Build a Hoodoo service that responds to GET 1/Time/now as described in the Hoodoo guide homepage.

The response should be

    {
    "time": "2021-11-10T18:57:20Z"
    }


Hints:
You can use curl to trigger the API call eg:

    curl http://localhost:8080/1/Time/now --header 'Content-Type: application/json; charset=utf-8'
