pipeline{
    agent any
    tools{
        maven "maven"
    }
    stages{
        stage ("Cloning"){
            steps{
                git branch: 'main', url: 'https://github.com/Pullaiah-6720/v-profile.git'
            }
        }
        stage ('maven build'){
            steps{
            sh "mvn clean package"
            }
        }
        stage ('quality checking'){
           steps {
                withSonarQubeEnv(
                    installationName: 'sonar',
                    credentialsId: 'sonar'
                ) {
                    sh '''
                        mvn org.sonarsource.scanner.maven:sonar-maven-plugin:sonar
                    '''
                }
            }
        }
        stage ('push to nexus'){
            steps {
        withCredentials([usernamePassword(
            credentialsId: 'nexus',
            usernameVariable: 'NEXUS_USERNAME',
            passwordVariable: 'NEXUS_PASSWORD'
        )]) {
            sh '''
                mvn deploy -s settings.xml
            '''
        }
    }
        }
    }
}
