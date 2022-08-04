FROM nginx

RUN mkdir /etc/nginx/private /etc/nginx/certs
COPY static-site/index* /etc/nginx/html/
COPY static-site/nginx.conf /etc/nginx/

# https://stackoverflow.com/a/10176685
RUN openssl req -x509 -nodes -days 365 \
-subj "/C=US/ST=Oregon/L=Portland/O=TechNode, LLC/CN=weichunnn.tech" \
-newkey rsa:2048 -keyout /etc/nginx/private/nginx-selfsigned.key \
-out /etc/nginx/certs/nginx-selfsigned.crt;
