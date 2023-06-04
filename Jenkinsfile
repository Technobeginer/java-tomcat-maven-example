pipeline {
    agent any
    stages {
        stage('Checkout') {
      steps {
        checkout scm
      }
    }
        stage('Build Application') {
      //      when {
     //   changeset "**/src/main/webapp/index.jsp" // Modify the path as needed
      //       }
            steps {
              sh 'mvn -f pom.xml clean package'
            }
            post {
                success {
                    echo "Now Archiving the Artifacts...."
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
        stage('Building Docker image for Tomcat8 application'){
             steps{
                 sh 'docker build -t pipeline:$BUILD_NUMBER .'
             }
        }
            
       /*     
        stage('Deploy in Staging Environment'){
            steps{
               sshagent(['deploy_user']) {
              //   timeout(time: 3, unit: 'MINUTES') {
               //     retry(5) {

                 sh "scp -o StrictHostKeyChecking=no target/java-tomcat-maven-example.war ubuntu@174.129.92.53:/opt/apache-tomcat-8.5.89/webapps"
                  }
            }

        } */
         
        stage("Docker login"){
      steps{
      withCredentials([string(credentialsId: 'DockerHubPwd', variable: 'dockerpwd')]) {
      sh "docker login -u shyamkrishna143 -p ${dockerpwd}"
            }
        }
         }
            
        stage('Pushing Image to Docker public hub'){
             steps{
                 sh 'docker tag pipeline:$BUILD_NUMBER shyamkrishna143/pipeline:$BUILD_NUMBER'
                 sh 'docker push shyamkrishna143/pipeline:$BUILD_NUMBER'
             }
        }
    } 
}
   // }
// }
