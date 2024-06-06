# dotnet-basic-umbraco-container
A basic container running Umbraco (CMS)


To map local port into container:
-p 8000:8000 

To use mounts (source is local, target is in container):
--mount type=bind,source=/home/geek/dockervols/views,target=/publish/views --mount type=bind,source=/home/geek/dockervols/wwwroot,target=/publish/wwwroot
