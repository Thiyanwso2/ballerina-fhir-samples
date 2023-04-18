import wso2healthcare/healthcare.fhir.r4;
import ballerina/io;

public function main() {

    // Create an Observation record
    r4:Observation observation = {code: {}, status: "final", valueString: "This is a value"};

    // Create a Patient and add some data on it
    r4:Patient patient = {};
    patient.id = "1563440";
    patient.name = [{family: "Simpson", given: ["Homer", "J"]}];
    patient.identifier = [{value: "7000135", system: "http://acme.org/MRNs"}];
    patient.gender = r4:CODE_GENDER_MALE;

    // Create a Reference record with Patient data
    r4:Reference reference = {id: patient.id, 'type: "Patient"};

    // Add Reference record to the Observation record
    observation.subject = reference;

    io:print(observation.toJson());
}
