#Give actual token value before running this file
oc login https://masterdnsj2p5wq2nzrzvo.southindia.cloudapp.azure.com:443 --token=

oc new-project springboot-mysql-demo-cicd

oc new-app -f jenkins_template.json -e INSTALL_PLUGINS=configuration-as-code-support,credentials:2.1.16,matrix-auth:2.3,sonar,nodejs,ssh-credentials,jacoco -e CASC_JENKINS_CONFIG=https://raw.githubusercontent.com/sourabhgupta385/openshift-jenkins/master/jenkins.yaml -n springboot-mysql-demo-cicd

oc new-app -f sonarqube-ephemeral-template.json -n springboot-mysql-demo-cicd

oc new-app mysql:5.7 -e MYSQL_USER=user -e MYSQL_PASSWORD=password -e MYSQL_DATABASE=sampledb -n springboot-mysql-demo-cicd

oc new-project springboot-mysql-demo-dev
oc new-project springboot-mysql-demo-test
oc new-project springboot-mysql-demo-prod

oc new-app mysql:5.7 -e MYSQL_USER=user -e MYSQL_PASSWORD=password -e MYSQL_DATABASE=sampledb -n springboot-mysql-demo-dev
oc new-app mysql:5.7 -e MYSQL_USER=user -e MYSQL_PASSWORD=password -e MYSQL_DATABASE=sampledb -n springboot-mysql-demo-test
oc new-app mysql:5.7 -e MYSQL_USER=user -e MYSQL_PASSWORD=password -e MYSQL_DATABASE=sampledb -n springboot-mysql-demo-prod

oc policy add-role-to-user system:image-puller system:serviceaccount:springboot-mysql-demo-test:default -n springboot-mysql-demo-dev
oc policy add-role-to-user system:image-puller system:serviceaccount:springboot-mysql-demo-prod:default -n springboot-mysql-demo-dev

oc policy add-role-to-user edit system:serviceaccount:springboot-mysql-demo-cicd:jenkins -n springboot-mysql-demo-dev
oc policy add-role-to-user edit system:serviceaccount:springboot-mysql-demo-cicd:jenkins -n springboot-mysql-demo-test
oc policy add-role-to-user edit system:serviceaccount:springboot-mysql-demo-cicd:jenkins -n springboot-mysql-demo-prod

oc new-app https://github.com/sourabhgupta385/sample-springboot-mysql-app.git --strategy=pipeline --name=springboot-mysql-demo-pipeline -n springboot-mysql-demo-cicd
