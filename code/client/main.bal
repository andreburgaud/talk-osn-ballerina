import ballerina/http;
import ballerina/io;

public function main() returns error? {
    http:Client salut = check new ("https://fourtonfish.com");
    json resp = check salut->get("/hellosalut/?lang=fr");
    io:println(resp);
}
