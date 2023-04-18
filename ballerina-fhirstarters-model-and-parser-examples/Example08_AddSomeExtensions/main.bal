import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;

public function main() {
    
    // Create a Patient and add some data on it
    r4:Patient patient = {};
    patient.name = [{family: "Simpson", given: ["Homer", "J"]}];
    patient.identifier = [{value: "7000135", system: "http://acme.org/MRNs"}];
    patient.gender = r4:CODE_GENDER_MALE;

    // Create CodeableConcept record
    r4:CodeableConcept codeable = {"text": "Patient is a VIP"};

    // Create CodeableConcept Extension record with above created CodeableConcept record
    r4:CodeableConceptExtension extension = {valueCodeableConcept: codeable, url: "http://hl7.org/fhir/StructureDefinition/patient-importance"};

    // Assign the extension record to the patient record
    patient.extension = [extension];

    // Add an extension on a primitive
    patient.birthDate = "1955-02-22";
    r4:StringExtension ext = {valueString: "23:30", url: "http://hl7.org/fhir/StructureDefinition/patient-birthTime"};

    //TODO: Need add extension to birthdate element

    io:print(patient.toJson());

}
