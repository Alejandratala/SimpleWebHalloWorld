# Dockerfile
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

WORKDIR /App

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["dotnet", "SimpleWebHalloWorld.dll"]