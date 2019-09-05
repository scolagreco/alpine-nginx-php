# NGINX e PHP7-FPM su Alpine

Repository con il dockerfile per creare una Docker Image di PHP7 (da repository) su Alpine Linux.
Viene installato PHP7, PHP7-FPM e NGINX. NGINX lavora sulla directory */var/www* ed utilizza PHP7-FPM puntando a localhost sulla porta 9000.

## Info

PHP7-FPM è in ascolto su tutte le interfacce sulla porta 9000. Questo perchè in una composizione può servire utilizzare il PHP anche da altri container.

Attualmente la latest corrisponde ad Alpine 3.9.2 nella quale si installano le seguenti versioni:
* PHP:	 7.2.22;
* NGINX: 1.14.2;

## Versions

- `latest` [(Dockerfile)](https://github.com/scolagreco/alpine-nginx-php/blob/master/Dockerfile)
- `v3.9.2` [(Dockerfile)](https://github.com/scolagreco/alpine-nginx-php/blob/v3.9.2/Dockerfile)

### Alpine

- [`v3.9.2`](https://github.com/scolagreco/alpine-base/releases/tag/v3.9.2)
