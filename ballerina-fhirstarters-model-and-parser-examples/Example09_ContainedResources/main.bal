import wso2healthcare/healthcare.fhir.r4;
import ballerina/io;

public function main() {
    
    r4:Observation observation = {code: {}, status: "final", valueString: "This is a value"};

    // Create a Patient
    r4:Patient patient = {};
    patient.id = "1563440";
    patient.name = [{"family":"Simpson", given: ["Homer", "J"]}];
    patient.identifier = [{"value": "7000135", "system": "http://acme.org/MRNs"}];
    patient.gender = r4:male;


    r4:Reference reference = {"type": "Patient", "id": patient.id};
    observation.subject = reference;

    io:print(observation.toJson());
}
