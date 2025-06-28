#Base image from  the build stage
FROM alpine:latest AS builder
WORKDIR /app
COPY postgres-init/  ./
RUN apk add --no-cache openssl

#Base image for the final MongoDB image
FROM postgres:latest


#Copy initialization scrits from the build stage
COPY --from=builder /app /docker-entrypoint-initdb.d


#set the MongoDB environment variables 
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=D@bson2043!
ENV POSTGRES_DB=eCommerceUsers

#Expose the MongoDB port
EXPOSE 5432