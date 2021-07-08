ballerina-code-to-cloud-hellow-world
# Ballerina Code to Cloud: Hello World

Based on "Hello World Sample" at https://ballerina.io/learn/user-guide/deployment/code-to-cloud/samples/#hello-world-sample

## 100 - Creating the Ballerina Package

1. Execute the ```bal new hello``` command to create a new package named ```hello```.

2. Replace the content of the ```/hello/main.bal``` file with the content below.

***Note***: All the other code is not related to Docker or Kubernetes and those are completely focused on the business logic.

***main.bal***
```
import ballerina/http;

listener http:Listener helloEP = new(9090);

service /helloWorld on helloEP {
  resource function get sayHello() returns string {   
    return "Hello, World from service helloWorld ! ";   
  }
}
```

3. Create a file named ```Cloud.toml``` in the package directory and add the content below.

***Cloud.toml***
```
[container.image]
repository="wso2inc"
name="hello"
tag="v0.1.0"
```

## 200 - Generating the Artifacts

Execute the ```bal build --cloud=k8s``` command to build the Ballerina package and you view the output below. The ```--cloud=docker``` option will build only Docker artifacts. Optionally, the build option can be added to the ```Ballerina.toml``` file as below.

```
[build-options]
cloud = "k8s"
```
containers/sample/hello/Ballerina.toml

Now execute the build command again, but from within the package directory of 'hello':

```
$ cd hello
$ bal build --cloud=k8s
```

More ...


