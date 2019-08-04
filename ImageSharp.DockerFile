FROM mcr.microsoft.com/dotnet/core/sdk:3.0-bionic AS builder
MAINTAINER Brian Popow <popow@gmx.de>

ENV TERM xterm

COPY . /app/
WORKDIR /app/tests/ImageSharp.DockerSandbox/
RUN dotnet restore
RUN dotnet build
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/runtime:3.0-bionic-arm32v7 as runtime
WORKDIR /app
COPY --from=builder /app/tests/ImageSharp.DockerSandbox/out/ .
WORKDIR /app/
CMD ["dotnet", "ImageSharp.DockerSandbox.dll"]