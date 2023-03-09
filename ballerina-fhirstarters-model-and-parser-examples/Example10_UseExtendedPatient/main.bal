import ballerina/io;
import wso2healthcare/healthcare.fhir.r4.uscore501;
import wso2healthcare/healthcare.fhir.r4.parser;
import ballerina/log;


public function main() {

    uscore501:USCorePatientProfile|error patient = parseSamplePatient();
    io:println(patient.ensureType());
}

function parseSamplePatient() returns uscore501:USCorePatientProfile|error {
    json patientPayload = {
        "resourceType": "Patient",
        "id": "1",
        "meta": {
            "profile": [
                "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
            ]
        },
        "active":true,
        "name":[
            {
                "use":"official",
                "family":"Chalmers",
                "given":[
                    "Peter",
                    "James"
                ]
            }
        ],
        "gender":"male",
        "birthDate":"1974-12-25",
        "managingOrganization":{
            "reference":"Organization/1"
        }
    };

    do {
        anydata parsedResult = check parser:parse(patientPayload, uscore501:USCorePatientProfile);
        uscore501:USCorePatientProfile patientModel = check parsedResult.ensureType();
        log:printInfo("Patient name : " + patientModel.name.toString());
        return patientModel;
    } on fail error parseError {
    	log:printError("Error occurred while parsing : " + parseError.message(), parseError);
    }
}
