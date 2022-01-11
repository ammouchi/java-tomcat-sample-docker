pipeline{
    agent any
    stages{
        stage('build application'){
            steps{
                //add -f for pom.xml path
               sh 'mvn -f pom.xml clean package'
            }
            post{
                success{
                    echo 'Now Archiving ...'
                    archiveArtifacts artifacts : '**/*.war'
                }
            }
        }
    
        stage('create tomcat image docker'){
            steps{
                sh 'docker build . -t tomcatsamplewebapp:${env.BUILD_ID}'
            }
        }
           
       
    }
}