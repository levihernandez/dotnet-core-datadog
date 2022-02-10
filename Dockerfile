FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN apt-get update
RUN apt-get install nano
RUN apt-get install wget

WORKDIR /home
COPY data/dot-net-webapp dot-net-webapp
WORKDIR /home/dot-net-webapp

RUN dotnet dev-certs https

RUN mkdir /var/log/datadog/

ENV CORECLR_ENABLE_PROFILING=1
ENV CORECLR_PROFILER={846F5F1C-F9AE-4B07-969E-05C26BC060D8}
ENV CORECLR_PROFILER_PATH=/opt/datadog/Datadog.Trace.ClrProfiler.Native.so
ENV DD_DOTNET_TRACER_HOME=/opt/datadog

RUN wget https://github.com/DataDog/dd-trace-dotnet/releases/download/v2.2.0/datadog-dotnet-apm_2.2.0_amd64.deb && dpkg -i ./datadog-dotnet-apm_2.2.0_amd64.deb
# RUN dpkg -i ./datadog-dotnet-apm_2.2.0_amd64.deb

RUN bash /opt/datadog/createLogPath.sh

CMD dotnet run --urls="https://0.0.0.0:5001;http://0.0.0.0:5000"