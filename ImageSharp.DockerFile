# FROM microsoft/dotnet:2.1.300-rc1-sdk
FROM microsoft/dotnet:2.1.301-sdk
# FROM microsoft/dotnet-nightly:2.1.300-sdk
# FROM microsoft/dotnet-nightly:latest
MAINTAINER Brian Popow <popow@gmx.de>

ENV TERM xterm

RUN apt-get update
RUN apt-get -y install libgdiplus libgif-dev autoconf libtool automake build-essential gettext libglib2.0-dev libcairo2-dev libtiff-dev libexif-dev
RUN apt-get install nano

COPY . /app/
WORKDIR /app/
RUN dotnet restore
CMD ["dotnet", "test", "tests/ImageSharp.Tests/ImageSharp.Tests.csproj", "-c", "Release", "-f", "netcoreapp2.0"]
# CMD ["dotnet", "test", "tests/ImageSharp.Tests/ImageSharp.Tests.csproj", "-c", "Debug", "-f", "netcoreapp2.0"]
# CMD ["dotnet", "test", "--filter", "FullyQualifiedName=SixLabors.ImageSharp.Tests.ImageCloneTests.CloneAs_ToBgr24", "tests/ImageSharp.Tests/ImageSharp.Tests.csproj", "-c", "Release", "-f", "netcoreapp2.0"]
# CMD ["dotnet", "test", "--filter", "FullyQualifiedName=SixLabors.ImageSharp.Tests.ImageCloneTests.CloneAs_ToRgb24", "tests/ImageSharp.Tests/ImageSharp.Tests.csproj", "-c", "Release", "-f", "netcoreapp2.0"]
# CMD ["dotnet", "test", "--filter", "FullyQualifiedName=SixLabors.ImageSharp.Tests.Colors.PackedPixelTests.NormalizedByte4", "tests/ImageSharp.Tests/ImageSharp.Tests.csproj", "-c", "Release", "-f", "netcoreapp2.0"]