import ballerina/http;
import ballerina/io;

type Response record {
    string code;
    string hello;
};

// Takes an argument, a language code. If not argument provide, will process the default
// argument as "fr"
public function main(string lang = "fr") returns error? {
    // https://fourtonfish.com/project/hellosalut-api/
    http:Client salut = check new ("https://fourtonfish.com");
    Response resp = check salut->get(string `/hellosalut/?lang=${lang}`);
    io:println(`code : ${resp.code}`);
    io:println(`hello: ${resp.hello}`);
}
