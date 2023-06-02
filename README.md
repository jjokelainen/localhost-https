# localhost-https
Quick and dirty setup for localhost http/https server.  
Can be used to serve static content via https from configurable root folder.  
Server is run in a docker container and wwwroot is mounted from host OS.  
Any changes you do to your project source files while the server is running,
will take immidiate effect and are available via `https://localhost`
## Usage
### Certificates
Generate certificates for localhost.  
A helper script for this task has been added but feel free to generate or use your own.  
Call `./generate_certs.sh` to trigger certificate generation.  
Passphrase can be anything you like, keep it safe if you wish to use the same ca for new certificates.  
Server expects to find `localhost.crt` and `localhost.key` in the `./certs` folder.  
Note that you will have to add the `ca.crt` as a trusted root authority in your OS.  

### Modify www root
By default, folder `./public` is used as a www root.  
If you wish to use another folder in your system, modify the `docker-compose.yml`  
In windows for example: `- c:\wwwroot:/public` will use `c:\wwwroot` folder as a root folder.

### Starting the server
Run `docker-compose up`  
If certificates are valid and wwwroot folder is ok, server should now be serving your static content via `https://localhost`
