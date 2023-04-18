import ballerina/io;
import ballerina/log;
import wso2healthcare/healthcare.fhir.r4.parser;
import wso2healthcare/healthcare.fhir.r4.uscore501;

public function main() {

    // Define US Core patient data as json
    json patientPayload = {
        "resourceType": "Patient",
        "id": "1",
        "identifier": [
            {
                "use": "usual",
                "type": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                            "code": "MR",
                            "display": "Medical Record Number"
                        }
                    ],
                    "text": "Medical Record Number"
                },
                "system": "http://hospital.smarthealthit.org",
                "value": "1032702"
            }
        ],
        "meta": {
            "profile": [
                "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
            ]
        },
        "active": true,
        "name": [
            {
                "use": "official",
                "family": "Chalmers",
                "given": [
                    "Peter",
                    "James"
                ]
            }
        ],
        "gender": "male",
        "birthDate": "1974-12-25",
        "managingOrganization": {
            "reference": "Organization/1"
        }
    };

    // Call defined method parse the json to US Core Patient model
    uscore501:USCorePatientProfile|error patient = parseSamplePatient(patientPayload);
    io:println(patient.ensureType());
}

// This method will parse the json to US Core Patient model
function parseSamplePatient(json patientPayload) returns uscore501:USCorePatientProfile|error {

    do {

        // Parse the string to the US Core Patient model
        anydata parsedResult = check parser:parse(patientPayload, uscore501:USCorePatientProfile);
        uscore501:USCorePatientProfile patientModel = check parsedResult.ensureType();

        return patientModel;
    } on fail error parseError {
        log:printError("Error occurred while parsing : " + parseError.message(), parseError);
        return parseError;
    }
}