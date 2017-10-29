# Creator
A Toolkit to propose a high-level architecture based on Microservices and
Serverless technologies for a given enterprise application

### Directory Structure

##### `src/main/webapp/WEB-INF/views`
All files which are responsible of rendering a screen for the application.

##### `src/main/jaba/com.creator/controllers`
All files which are responsible of accepting each request and 
directing it to the respective service layer directories 
and returning control back to the view layer.

##### `src/main/jaba/com.creator/models`
All domain model object files.

##### `src/main/jaba/com.creator/services`
Service directory files are responsible to contain all business logic 
with respect to the application.

### Installation Guide
1. clone the repository 
[Creator](https://github.com/PravindaPerera/Creator)
2. set up maven in your local machine
3. run `mvn tomcat7:run`

### Contributor
- Pravinda Perera