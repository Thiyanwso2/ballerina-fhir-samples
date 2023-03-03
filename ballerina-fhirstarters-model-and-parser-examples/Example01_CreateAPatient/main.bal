import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;

public function main() {
    r4:Patient patient = {};

    // Add a "name" element
    r4:HumanName[] humanName= [{"family":"Simpson", given: ["Homer", "J"]}];
    patient.name = humanName;

    // Add an "identifier" element
    r4:Identifier[] identifier = [{"value": "7000135", "system": "http://acme.org/MRNs"}];
    patient.identifier = identifier;

    // Assign value directly to the existing patient data
    //patient.identifier = [{"value": "7000135", "system": "http://acme.org/MRNs"}];

    io:println(patient.toJson());
}
