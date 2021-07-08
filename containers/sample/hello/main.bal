import ballerina/http;

listener http:Listener helloEP = new(9090);

service /helloWord on helloEP {
  resource function get sayHello() returns string {
    return "Hello, World from service helloWorld ! ";
  }
}
