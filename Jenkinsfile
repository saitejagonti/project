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
RUN apt-get update
RUN apt-get -y install maven
COPY pom.xml /usr/local/service/pom.xml
COPY src /usr/local/service/src
WORKDIR /usr/local/service
RUN mvn clean install
RUN mvn compile
RUN mvn test
COPY /var/lib/jenkins/workspace/sample_project3/target/WebAppCal-1.2.1.war .
FROM tomcat
ADD WebAppCal-1.2.1.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
EXPOSE 8080
USER tomcat
EOT
sudo docker build . -t sampproj:$BUILD_NUMBER
sudo docker container run -itd --name sampleproject1 -p 8888:8080 sampproj:$BUILD_NUMBER'''
   }
  }
 }
}
