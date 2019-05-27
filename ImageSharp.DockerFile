FROM mcr.microsoft.com/dotnet/core/sdk:2.1.700-bionic
MAINTAINER Brian Popow <popow@gmx.de>

ENV TERM xterm

RUN apt-get update
RUN apt-get -y install libgdiplus libgif-dev autoconf libtool automake build-essential gettext libglib2.0-dev libcairo2-dev libtiff-dev libexif-dev
RUN apt-get install nano

COPY . /app/
WORKDIR /app/
RUN dotnet restore
CMD ["dotnet", "test", "tests/ImageSharp.Tests/ImageSharp.Tests.csproj", "-c", "Release", "-f", "netcoreapp2.1"]