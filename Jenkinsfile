pipeline {
     agent { dockerfile true }
     stages{
         stage("Docker Image"){
	     steps {
		sh label: '', script: '''rm -rf dockerimg
mkdir dockerimg
cd dockerimg
cp /var/lib/jenkins/workspace/sample_project3/target/WebAppCal-1.2.1.war .
touch dockerfile
cat <<EOT>>dockerfile
FROM tomcat
ADD WebAppCal-1.2.1.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
EXPOSE 8080
EOT
sudo docker build . -t sampproj:$BUILD_NUMBER
sudo docker container run -itd --name sampleproject1 -p 8888:8080 sampproj:$BUILD_NUMBER'''
   }
  }
 }
}
