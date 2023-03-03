import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;
import wso2healthcare/healthcare.fhir.r4.parser;
import ballerina/log;

isolated function loadData(string pathToJSON) returns json[]|error {
    json[]|error data =  <json[]> check io:fileReadJson(pathToJSON);
    return data;
}

isolated function writeData(string pathToJSON, json[] body) returns error? {
    check io:fileWriteJson(pathToJSON, body);
}

public isolated function parseResource(json payload, typedesc<anydata> resourceType) returns r4:Patient {
    do {
        anydata parsedResult = check parser:parse(payload, resourceType);  
        r4:Patient patientModel = check parsedResult.ensureType();
        log:printInfo("Patient name : " + patientModel.name.toString());
        return patientModel;
    } on fail error parseError {
    	log:printError("Error occurred while parsing : " + parseError.message(), parseError);
    }
}
