FROM public.ecr.aws/amazoncorretto/amazoncorretto:11

WORKDIR /opt/app

COPY target/spring-cloud-config-server.jar /opt/app/spring-cloud-config-server.jar

ENTRYPOINT ["/usr/bin/java"]
CMD ["-Dspring.profiles.active=docker", "-Dorg.apache.catalina.STRICT_SERVLET_COMPLIANCE=true", "-jar", "/opt/app/spring-cloud-config-server.jar"]

EXPOSE 9296