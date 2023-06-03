pipeline {
    agent any
    stages {
        stage('Build Application') {
            steps {
                def modifiedFiles = sh(returnStdout: true, script: 'git diff --name-only origin/master..HEAD')
          if (modifiedFiles.contains('src/main/webapp/index.jsp') || modifiedFiles.contains('src/main/webapp/WEB-INF')) {
                sh 'mvn -f pom.xml clean package'
          }
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

                 sh "scp -o StrictHostKeyChecking=no target/java-tomcat-maven-example.war ubuntu@52.3.183.31:/opt/apache-tomcat-8.5.89/webapps"
                  }
            }

        }

    }
}
   // }
// }
