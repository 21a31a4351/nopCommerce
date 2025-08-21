FROM mcr.microsoft.com/dotnet/sdk:9.0-noble AS build
COPY . /appt1
WORKDIR /appt1
RUN dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o kishore

FROM mcr.microsoft.com/dotnet/aspnet:9.0-noble AS runtime
COPY --from=build /appt1/kishore /nanda
WORKDIR /nanda
EXPOSE 5000/tcp
CMD ["dotnet","Nop.Web.dll","--urls=http://0.0.0.0:5000"]
