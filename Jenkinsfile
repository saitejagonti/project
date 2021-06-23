pipeline {
     agent any
     stages{
	stage("Docker Image"){
	     steps {
		 sh label: '', script: '''rm -rf dockerimg
mkdir dockerimg
cd dockerimg
touch dockerfile
cat <<EOT>>dockerfile

FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/saitejagonti/project.git

FROM maven as maven_builder 
WORKDIR /app
COPY . .
RUN mvn clean install

FROM tomcat
ADD --from=maven_builder /app/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
USER tomcat
CMD ["catalina.sh","run"]
EOT
sudo docker build . -t sampproj:$BUILD_NUMBER'''
   }
  }
 }
}
