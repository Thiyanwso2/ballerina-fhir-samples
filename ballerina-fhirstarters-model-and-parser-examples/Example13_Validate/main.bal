import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;
import wso2healthcare/healthcare.fhir.r4.validator;

public function main() {

    r4:Patient patient = {};

    patient.name = [{family: "Simpson", given: ["Homer", "J"]}];
    patient.identifier = [{value: "7000135", system: "http://acme.org/MRNs"}];

    r4:ContactPoint contact = {};
    contact.use = r4:home;
    contact.system = r4:phone;
    contact.value = "1 (416) 340-4800";
    patient.telecom = [contact];

    patient.gender = r4:CODE_GENDER_MALE;

    // birthDate is FHIR date type (e-g 1985-06-11)
    patient.birthDate = "assigning-a-string-value-to-produce-validate-error";

    r4:FHIRValidationError? validateFHIRResourceJson = validator:validate(patient);

    if validateFHIRResourceJson is r4:FHIRValidationError {
        io:print(validateFHIRResourceJson);
    }
}
