FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

WORKDIR /src
# Restore as distinct layers
COPY ["geektechstuff2/geektechstuff2.csproj", "."]
RUN dotnet restore
# Build and publish a release
COPY . .
RUN dotnet publish dotnetumbraco.sln --configuration Release --output /publish

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 as runtime-env
WORKDIR /publish
COPY --from=build-env /publish .
ENV ASPNETCORE_URLS "http://+:8000"
EXPOSE 8000
ENTRYPOINT ["dotnet", "geektechstuff2.dll"]