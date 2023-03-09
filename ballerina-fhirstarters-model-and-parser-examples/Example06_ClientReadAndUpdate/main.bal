import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;
import wso2healthcare/healthcare.fhir.r4.parser;
import wso2healthcare/healthcare.clients.fhirr4;
import ballerina/log;

public function main() returns error? {

    // Create a FHIR client connector config record
    // https://central.ballerina.io/wso2healthcare/healthcare.clients.fhirr4
    fhirr4:FHIRConnectorConfig sampleConfig = {
        baseURL: "http://hapi.fhir.org/baseR4",
        mimeType: fhirr4:FHIR_JSON
    };

    do {

        // Create a client connector using the above created connector config
        fhirr4:FHIRConnector fhirConnector = check new (sampleConfig);

        // Read a Patient record using the connector
        fhirr4:FHIRResponse response = check fhirConnector->getById(fhirr4:PATIENT, "591661");

        // Extract and parse Patient model from the response 
        r4:Patient patient = check parser:parse(response.get("resource").toJson()).ensureType();

        // Update the retrieved Patient record form the server
        patient.name = [{family: "Simpson", given: ["Homer", "J"]}];

        // Update the Patient record using the connector to the server
        fhirr4:FHIRResponse|fhirr4:FHIRError fhirResponse = fhirConnector->update(patient.toJson(), "application/fhir+json");

        io:print(fhirResponse);

    } on fail var e {
        log:printError("Something went wrong while connect to the FHIR server", e);
    }
}
