# nginx-extras
 
## Usage: 
`docker create \`
`  --name=<preferred name for you web server> \`
`  -p 80:80 -p 443:443 \`
`  -v <path to your data>:/etc/nginx/ \`
`  -e PGID=<docker group ID> -e PUID=<docker user id>`
`  nfugal/nginx-extras`

After a successful build: `docker start <name you chose for your webserver>`


Include the `:ro` option on the volume declaration to make a volume read only from inside the container e.g. `-v /path/to/my/data:/etc/nginx:ro`
The docker group ID and docker user ID can be obtained via `id <name of docker user>` on the host system.

I'm open to suggestions for improvement--especially since this is my first docker image. 


