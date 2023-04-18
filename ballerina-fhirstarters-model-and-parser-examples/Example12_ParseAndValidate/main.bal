// import ballerina/io;
import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;
import wso2healthcare/healthcare.fhir.r4.parser;
import wso2healthcare/healthcare.fhir.r4.validator;

public function main() returns error? {

    // Define a Patient data as json
    json body = {
        "resourceType": "Patient",
        "id": "591841",
        "meta": {
            "versionId": "1",
            "lastUpdated": "2020-01-22T05:30:13.137+00:00",
            "source": "#KO38Q3spgrJoP5fa"
        },
        "identifier": [
            {
                "type": {
                    "coding": [
                        {
                            "system": "http://hl7.org/fhir/v2/0203",
                            "code": "MR"
                        }
                    ]
                },
                "value": "18e5fd39-7444-4b30-91d4-57226deb2c78"
            }
        ],
        "name": [
            {
                "family": "Cushing",
                "given": ["Caleb"]
            }
        ],
        "birthDate": "assigning-a-string-value-to-produce-validate-error"
    };

    // Parse the Json to Patient model
    r4:Patient patientModel = check parser:parse(body, r4:Patient).ensureType();

    r4:FHIRValidationError? validateFHIRResourceJson = validator:validate(patientModel, r4:Patient);

    if validateFHIRResourceJson is r4:FHIRValidationError {
        io:print(validateFHIRResourceJson);
    }
}
