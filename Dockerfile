FROM nginx:alpine
EXPOSE 8082
COPY nginx.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["nginx","-g","daemon off;"]