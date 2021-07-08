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

A failure shows:

```
Compiling source
        cloud_user/hello:0.1.0

Generating executable

Generating artifacts...

        @kubernetes:Service                      - complete 1/1
        @kubernetes:Deployment                   - complete 1/1
        @kubernetes:HPA                          - complete 1/1
error [k8s plugin]: module [cloud_user/hello:0.1.0] unable to build docker image: could not build image: failed to export image: failed to create image: failed to get layer sha256:f8a2f60941a10b096a677e54a1d509601a6ccc6853ba1c63763359cf438ef899: layer does not exist
        target/bin/hello.jar
```

More ...


