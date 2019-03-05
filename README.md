# Sample SpringBoot application with MySQL database

This application displays the list of all places in database at the following endpoint:

http://localhost:8080/showPlace

To add a place to the list, hit the following endpoint:

http://localhost:8080/addPlace

Home page for the application is available at following endpoint:

http://localhost:8080

To connect to mysql database, run the following command in mysql container:

mysql -u $MYSQL_USER -p$MYSQL_PASSWORD

##  Tools used in DevOps solution

* _Source Code Management:_ **_Git_**
* _Code Quality Analysis:_ **_SonarQube_**
* _Unit Testing:_ **_JUnit_**
* _Code Coverage:_ **_JaCoCo_**
* _Build Tool:_ **_Maven_**
* _Integration Testing:_ **_Selenium_**
* _Performance Testing:_ **_Jmeter_**
* _Security Testing:_ **_Find Security Bugs_**
