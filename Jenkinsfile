pipeline {
     agent any
     stages{
	stage("build code"){
            steps{
                sh 'mvn clean install'
	  }
        }
	stage("docker image") {
	     steps {
		 sh label: '', script: '''rm -rf dockerimg
mkdir dockerimg
cd dockerimg
cp /var/lib/jenkins/workspace/$JOB_NAME/target/*war .
touch dockerfile
cat <<EOT>>dockerfile
FROM tomcat
ADD *.war /usr/local/tomcat/webapps
EXPOSE 8080
USER tomcat
CMD ["catalina.sh","run"]
EOT
sudo docker build . -t sampproj:$BUILD_NUMBER'''
   }
  }
 }
}
