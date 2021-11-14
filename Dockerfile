FROM nginx:alpine
EXPOSE 8081
COPY nginx.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["nginx","-g","daemon off;"]