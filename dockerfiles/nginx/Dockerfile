FROM nginx:stable-alpine3.21-perl
COPY ./dockerfiles/nginx/nginx.conf /etc/nginx/nginx.conf

# Delete default conf
RUN rm /etc/nginx/conf.d/default.conf

# COPY virtual server config to conf.d nginx
COPY ./dockerfiles/nginx/config/*.conf /etc/nginx/conf.d/