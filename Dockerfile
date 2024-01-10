FROM nginx:alpine
LABEL org.opencontainers.image.source https://github.com/tipapornc/tc_ms
COPY ./html /usr/share/nginx/html