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
    
        stage('deploying application to staging envirenment'){
        steps{
            build job :  'Deploy_Application_Staging_Env'
        }
       
      }
       stage('Deploy to production'){
        steps{
            //if not approved in 5 days then the buid will be discated
            timeout(time:5,unit:'DAYS'){
                input message: 'Approval for Production Deployement ?'
            }
            build job : 'Deploy_Application_Production_Env'

        }
      }
    }
}