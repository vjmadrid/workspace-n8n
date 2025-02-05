# worksapece-n8n

## Example one


### Crear Variables de Entorno
Crear un fichero .env en el mismo directorio para gestionar las variables de entorno

```bash
DOMAIN_NAME=example.com
SUBDOMAIN=n8n
GENERIC_TIMEZONE=Europe/Berlin
SSL_EMAIL=user@example.com
```

### Crear Volumenes Docker
Crear los volumnes de Docker para asegurar la persitencia de datos

```bash
docker volume create traefik-data
docker volume create n8n-data
```

### Arrancar el servicio

Pasos a seguir:

* Ejecutar el siguiente comando:

```
docker-compose up -d
```