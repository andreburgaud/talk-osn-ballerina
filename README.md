# talk-osn-ballerina

Introduction to Ballerina

## Play Along

* https://play.ballerina.io/
* https://ballerina.io/downloads/
* https://github.com/andreburgaud/talk-osn-ballerina

## Install Ballerina

* https://ballerina.io/downloads/
* https://ballerina.io/learn/installing-ballerina/setting-up-ballerina/

> On Linux and Mac OS, you can also use SDKMAN https://sdkman.io/, but as of 2/20/2022, the version available via SDKMAN was still Ballerina swan-lake-p3, and not Ballerina 2201.0.0, the first Swan Lake GA release.

After installing Ballerina, validate that the installation by executing the main tool exposed by Ballerina, `bal`:

```
$ bal --version
Ballerina 2201.0.0 (Swan Lake)
Language specification 2022R1
Update Tool 1.3.9
```

You can update any new Ballerina versions by executing `bal update` to update the Ballerina tool, and `bal dist update` to update to the latest patch version of the active Ballerina distribution.

After updating the Ballerina development platform on your system, you should see the following when you execute `bal update`:

```
$  bal update
Fetching the latest update tool version from the remote server...
The latest update tool version '1.3.9' is already in use
```

To check the Ballerina distribution on your system, execute `bal dist update`:

```
$ bal dist update
Checking for newer versions of the update tool...
Fetching the latest patch distribution for 'ballerina-2201.0.0' from the remote server...
The latest patch distribution '2201.0.0' is already the active distribution
```

## Build and Test Examples

There is a `justfile` at the root of the project allowing to build and test all examples. [just](https://github.com/casey/just) is required to execute the build. A `justfile` is similar to a `Makefile`, and it is more friendly.

## Video

https://vimeo.com/681563861
