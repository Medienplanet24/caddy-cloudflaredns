[![Latest Release][version-image]][version-url]
[![caddy on DockerHub][dockerhub-image]][dockerhub-url]
[![Docker Build][gh-actions-image]][gh-actions-url]

# caddy-cloudflaredns

Please see the official [Caddy Docker Image](https://hub.docker.com/_/caddy) for deployment instructions.

Builds are available at the following Docker repositories:

* Docker Hub: [docker.io/medienplanet24/caddy-cloudflaredns](https://hub.docker.com/r/medienplanet24/caddy-cloudflaredns)
* GitHub Container Registry: [ghcr.io/medienplanet24/caddy-cloudflaredns](https://ghcr.io/medienplanet24/caddy-cloudflaredns)
* Quay Container Registry: [quay.io/medienplanet24/caddy-cloudflaredns](https://quay.io/repository/medienplanet24/caddy-cloudflaredns)

Few things to note: 

1. You should add CLOUDFLARE_EMAIL and CLOUDFLARE_API_TOKEN as environment variables to your `docker run` command. Example:

      ```
      docker run -it --name caddy \
        -p 80:80 \
        -p 443:443 \
        -v caddy_data:/data \
        -v caddy_config:/config \
        -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
        -e CLOUDFLARE_EMAIL=me@example.com \
        -e CLOUDFLARE_API_TOKEN=12345 \
        -e ACME_AGREE=true \
        medienplanet24/caddy-cloudflaredns:latest
      ```
      
      You can obtain your [Cloudflare API token](https://support.cloudflare.com/hc/en-us/articles/200167836-Managing-API-Tokens-and-Keys) via the Cloudflare Portal. To create a API token with minimal scope, the following steps are needed:

   1. Log into your dashboard, go to account settings, create API token
   2. grant the following permissions:

      * Zone / Zone / Read
      * Zone / DNS / Edit
      
2. You should add the following to your Caddyfile as the [tls directive](https://caddyserver.com/docs/caddyfile/directives/tls#tls). 

   ```
   tls {$CLOUDFLARE_EMAIL} { 
     dns cloudflare {$CLOUDFLARE_API_TOKEN}
   }
   ```

3. This image now supports tagging! [See available tags here](https://hub.docker.com/r/medienplanet24/caddy-cloudflaredns/tags). To select a specific version of `caddy`, set your [Docker image tag](https://docs.docker.com/engine/reference/run/#imagetag) to the caddy version you'd like to use. 

   Example: `medienplanet24/caddy-cloudflaredns:2.4.3`

[version-image]: https://img.shields.io/github/v/release/medienplanet24/caddy-cloudflaredns?style=for-the-badge
[version-url]: https://github.com/medienplanet24/caddy-cloudflaredns/releases

[gh-actions-image]: https://img.shields.io/github/actions/workflow/status/medienplanet24/caddy-cloudflaredns/main.yml?style=for-the-badge
[gh-actions-url]: https://github.com/medienplanet24/caddy-cloudflaredns/actions

[dockerhub-image]: https://img.shields.io/docker/pulls/medienplanet24/caddy-cloudflaredns?label=DockerHub%20Pulls&style=for-the-badge
[dockerhub-url]: https://hub.docker.com/r/medienplanet24/caddy-cloudflaredns
