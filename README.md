## ASP.NET Core 3.1 - Linux

Project has been generated with `dotnet new mvc -au None -o dot-net-webapp --no-https`

Build and run the docker images with docker-compose

```
docker-compose build
export DD_API_KEY=<datadog-api-key>
docker-compose up -d
```