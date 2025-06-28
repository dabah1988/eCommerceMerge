#Base image from  the build stage
FROM alpine:latest AS builder
WORKDIR /app
COPY mongodbb-init/  ./
RUN apk add --no-cache openssl

#Base image for the final MongoDB image
FROM mongo:6.0


#Copy initialization scrits from the build stage
COPY --from=builder /app /docker-entrypoint-initdb.d


#set the MongoDB environment variables 
ENV MONGO_INITDB_DATABASE=OrdersDatabase

#Expose the MongoDB port
EXPOSE 27017