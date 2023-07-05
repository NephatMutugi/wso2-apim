// def NEW_TAG = 'initial_value'

pipeline {
agent any
    
    options {
        buildDiscarder logRotator( 
            daysToKeepStr: '16', 
            numToKeepStr: '10'
        )
        disableConcurrentBuilds()
    }
    tools {
        maven "maven"
    }
    environment{
		SOURCE_REPO = ""
		DEPLOYMENT_REPO = ""
        DOCOKER_DIRECTORY = "AM_Docker"
    }

    stages {
      
        stage('Docekr Build Image') {
      	    steps {
                script {
                    // NEW_TAG = readFile('nbc_mi_deployment/tagfile.txt').trim()
                    // echo NEW_TAG
                    // sh "sed -i 's/imagetag/${NEW_TAG}/g' MIDocker/buildconfig.yaml"
                    sh '''
                    #cp -r $WORKSPACE/upload/* $DOCOKER_DIRECTORY/repository/deployment/server/carbonapps/
             		cd $DOCOKER_DIRECTORY
                    #echo ${NEW_TAG}
                    #sh "sed -i 's/imagetag/${NEW_TAG}/g' buildconfig.yaml"
                    oc login --insecure-skip-tls-verify=true --token=${TOKEN} --server=https://api.ocp4-kawe.tz.af.absa.local:6443 && oc project common-svc
                    oc start-build apim-build --from-dir="." --follow
                    #oc delete bc mi-build
                    '''
                    
                }

            }
        }
        stage('Cleanup workspace'){
            steps{
            //	echo "ok"
                cleanWs()
            }
        }

    }
}
