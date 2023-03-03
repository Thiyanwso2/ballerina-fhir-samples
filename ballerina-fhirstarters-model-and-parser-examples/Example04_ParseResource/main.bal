// import ballerina/io;
import wso2healthcare/healthcare.fhir.r4.parser;
import wso2healthcare/healthcare.fhir.r4;
import ballerina/io;


public function main() returns error? {
    string resourceBody = "{\"resourceType\":\"Patient\",\"identifier\":[{\"system\":\"http://acme.org/MRNs\",\"value\":\"7000135\"}],\"name\":[{\"family\":[\"Simpson\"],\"given\":[\"Homer\",\"J\"]}]}";

    json|error converted = resourceBody.fromJsonString();

    if converted is json {
        
        r4:Patient patientModel = check parser:parse(converted, r4:Patient).ensureType();

        r4:Identifier[]? identifiers = patientModel.identifier;
        
        if identifiers is r4:Identifier[]{
            r4:Identifier identifier = identifiers[0];
        
            io:print(identifier.system);
            io:print(identifier.value);

        }
    }
}
