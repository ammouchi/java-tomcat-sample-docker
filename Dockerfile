FROM tomcat:8.0
ADD **/*.war /usr/local/tomcat/webapps
EXPOSE 8083
CMS ["catalania.sh","run"]