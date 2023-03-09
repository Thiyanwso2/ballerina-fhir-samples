import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;
import wso2healthcare/healthcare.clients.fhirr4;

import ballerina/log;

public function main() {

    // Create a Patient
    r4:Patient patient = {};
    patient.name = [{family: "Simpson", given: ["Homer", "J"]}];
    patient.identifier = [{value: "7000135", system: "http://acme.org/MRNs"}];
    patient.gender = r4:male;

    // Create a FHIR client connector config record
    // https://central.ballerina.io/wso2healthcare/healthcare.clients.fhirr4
    fhirr4:FHIRConnectorConfig sampleConfig = {
        baseURL: "http://hapi.fhir.org/baseR4",
        mimeType: fhirr4:FHIR_JSON
    };

    do {

        // Create a client connector using the above created connector config
        fhirr4:FHIRConnector fhirConnector = check new (sampleConfig);

        // Create a Patient record using the connector
        fhirr4:FHIRResponse|fhirr4:FHIRError fhirResponse = fhirConnector->create(patient.toJson());

        io:print(fhirResponse);
    } on fail var e {
        log:printError("Something went wrong while connect to the FHIR server", e);
    }

}
