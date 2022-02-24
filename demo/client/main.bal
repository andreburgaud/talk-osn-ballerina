import ballerina/http;
import ballerina/io;

type CodeHello record {
    string code;
    string hello;
};

// Takes an argument, a language code (fr, es, en, en-us, az, en-gb...).
// If not argument provided, will process the default value as "fr"
// curl -L "https://fourtonfish.com/hellosalut?lang=fr"
public function main(string lang = "fr") returns error? {
    // https://fourtonfish.com/project/hellosalut-api/
    http:Client salut = check new ("https://fourtonfish.com");

    // json resp = check salut->get(string `/hellosalut/?lang=${lang}`);
    // io:println("JSON  :", resp);
    // io:println(typeof resp);

    // CodeHello ch = check resp.cloneWithType(CodeHello);
    // io:println("Record:", ch);
    // io:println(typeof ch);

    CodeHello ch = check salut->get(string `/hellosalut/?lang=${lang}`);
    io:println(`code : ${ch.code}`);
    io:println(`hello: ${ch.hello}`);
}
