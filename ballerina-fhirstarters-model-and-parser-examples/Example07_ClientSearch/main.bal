import ballerina/io;
import wso2healthcare/healthcare.clients.fhirr4;
import ballerina/log;

public function main() {

    // Create a FHIR client connector config record
    // https://central.ballerina.io/wso2healthcare/healthcare.clients.fhirr4
    fhirr4:FHIRConnectorConfig sampleConfig = {
        baseURL: "http://hapi.fhir.org/baseR4",
        mimeType: fhirr4:FHIR_JSON
    };

    // Create map of search parameters
    map<string[]> searchParams = {_id: ["591661"]};

    do {

        // Create a client connector using the above created connector config
        fhirr4:FHIRConnector fhirConnectorObj = check new (sampleConfig);

        // Search for Patient records with the defined search parameters using the connector
        fhirr4:FHIRResponse|fhirr4:FHIRError fhirResponse = fhirConnectorObj->search(fhirr4:PATIENT, searchParams);

        io:print(fhirResponse);
    } on fail var e {
        log:printError("Something went wrong while connect to the FHIR server", e);
    }
}
