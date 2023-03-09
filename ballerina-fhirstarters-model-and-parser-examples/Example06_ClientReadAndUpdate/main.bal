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

        // Do the FHIR interaction using FHIR client connector
        do {
	        fhirr4:FHIRConnector fhirConnectorObj = check new(sampleConfig);

            fhirr4:FHIRResponse response = check fhirConnectorObj->getById("Patient", "591661");

            r4:Patient patient = check parser:parse(response.get("resource").toJson()).ensureType();
            patient.name = [{"family":"Simpson", given: ["Homer", "J"]}];

            fhirr4:FHIRResponse|fhirr4:FHIRError fhirResponse = fhirConnectorObj->update(patient.toJson(), "application/fhir+json");

            io:print(fhirResponse);

        } on fail var e {
            log:printError("Something went wrong while connect to the FHIR server",e);
        }
}
