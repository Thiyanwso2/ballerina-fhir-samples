// import ballerina/io;
import wso2healthcare/healthcare.fhir.r4.parser;
import wso2healthcare/healthcare.fhir.r4;
import ballerina/io;

public function main() returns error? {

    // Define a Patient data as json string
    string resourceBody = "{\n" +
    "\"resourceType\": \"Patient\",\n" +
    "\"id\": \"591661\",\n" +
    "\"meta\": {\n" +
    "   \"versionId\": \"1\",\n" +
    "   \"lastUpdated\": \"2020-01-21T05:30:30.392+00:00\",\n" +
    "   \"source\": \"#uAn5EXox3aKjch3e\"\n" +
    "},\n" +
    "\"identifier\": [ {\n" +
    "   \"type\": {\n" +
    "   \"coding\": [ {\n" +
    "       \"system\": \"http://hl7.org/fhir/v2/0203\",\n" +
    "       \"code\": \"MR\"\n" +
    "       } ]\n" +
    "   },\n" +
    "   \"value\": \"cc7dff50-4b7f-4faa-8f58-e63b3f6ad4ff\"\n" +
    "} ],\n" +
    "\"name\": [ {\n" +
    "    \"family\": \"Alexander\",\n" +
    "   \"given\": [ \"Bob\" ]\n" +
    "} ]\n" +
    "}";

    // Convert the string to json
    json|error converted = resourceBody.fromJsonString();

    if converted is json {

        // Parse the Json to Patient model
        r4:Patient patientModel = check parser:parse(converted, r4:Patient).ensureType();

        // Retrieve the identifiers and print the first identifier
        r4:Identifier[]? identifiers = patientModel.identifier;

        if identifiers is r4:Identifier[] {
            r4:Identifier identifier = identifiers[0];
            io:println("Identifier value: " + identifier.value.toString());
        }
    }
}
