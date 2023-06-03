pipeline {
    agent any
    stages {
        stage('Build Application') {
            steps {
                sh 'mvn -f java-tomcat-maven-example/pom.xml clean package'
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
                 sh "scp -o StrictHostKeyChecking=no java-tomcat-maven-example/target/java-tomcat-maven-example.war ubuntu@44.201.248.221:/opt/apache-tomcat-8.5.89/webapps"
                  }
            }

        }

    }
}
