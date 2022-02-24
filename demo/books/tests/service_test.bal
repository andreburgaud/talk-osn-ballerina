import ballerina/io;
import ballerina/http;
import ballerina/test;

http:Client testClient = check new (string `http://localhost:${port.toString()}`);

// Before Suite Function

@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("I'm the before suite function!");
}

// Test function

@test:Config {}
function testServiceWithProperName() {
    Book[]|error response = testClient->get("/books");
    test:assertEquals(response, books.toArray());
}

// After Suite Function

@test:AfterSuite
function afterSuiteFunc() {
    io:println("I'm the after suite function!");
}
