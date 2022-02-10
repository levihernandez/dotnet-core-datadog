## Tracing ASP.NET Core 3.1 Linux with Datadog APM

Project has been generated with `dotnet new mvc -au None -o dot-net-webapp --no-https`

The main goal of the current project is to run a quickstart with a .NET Core 3.1 app and the Datadog agent in order to trace the performance of the application.

The project will require a Dockerfile, the .NET Core dir, and a Datadog API Key. The docker-compose.yaml file has many features active to enable:
* Container Security
* Network Performance Monitoring
* Log collection (container logs, Serilog)
* Application Tracing (tracing sampling rates: 1 = 100%)
* Infrastructure metrics
* Live Process collection
* DogStatsD collection

As you can see all bells and whistles are enabled with a single agent, and you are not required to use them all. 

To get started, follow the steps below:

```
docker-compose build
export DD_API_KEY=<datadog-api-key>
docker-compose up -d
```
