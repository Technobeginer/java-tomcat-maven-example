pipeline {
    agent any
    stages {
        stage('Checkout') {
      steps {
        checkout scm
      }
    }
        stage('Build Application') {
            when {
        changeset "**/src/main/webapp/index.jsp" // Modify the path as needed
             }
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
        stage('Deploy in Staging Environment'){
            steps{
               sshagent(['deploy_user']) {
              //   timeout(time: 3, unit: 'MINUTES') {
               //     retry(5) {

                 sh "scp -o StrictHostKeyChecking=no target/java-tomcat-maven-example.war ubuntu@3.86.35.155:/opt/apache-tomcat-8.5.89/webapps"
                  }
            }

        }

    }
}
   // }
// }
