#Base image from  the build stage
FROM alpine:latest AS builder
WORKDIR /app
COPY mysql-init/  ./
RUN apk add --no-cache openssl

#Base image for the final MongoDB image
FROM mysql:latest


#Copy initialization scrits from the build stage
COPY --from=builder /app /docker-entrypoint-initdb.d


#set the MongoDB environment variables 
ENV  MYSQL_ROOT_PASSWORD: MyLove@1988!
ENV  MYSQL_DATABASE: ecommerceproductsdatabase

#Expose the MongoDB port
EXPOSE 3306