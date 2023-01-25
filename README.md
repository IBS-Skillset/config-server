# config-server
Docker commands to run in local
-----------------------------

docker build -t spring-cloud-config-server:0.0.1-SNAPSHOT .

docker run -p 9296:9296 -e eureka.service-url.default=http://172.17.0.2:8761/eureka/  --name spring-cloud-config-server spring-cloud-config-server:0.0.1-SNAPSHOT

Replace the ip in the http://172.17.0.2:8761/eureka/ url with the conatiner ip of service-registry
To find the conatiner ip run the following command 

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' service-registry
