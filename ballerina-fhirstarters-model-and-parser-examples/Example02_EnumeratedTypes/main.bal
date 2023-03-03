import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;


public function main() {

    r4:Patient patient = {};

    patient.name = [{"family":"Simpson", given: ["Homer", "J"]}];
    patient.identifier = [{"value": "7000135", "system": "http://acme.org/MRNs"}];

    r4:ContactPoint contact = {};
    contact.use = r4:home;
    contact.system = r4:phone;
    contact.value = "1 (416) 340-4800";
    patient.telecom = [contact];

    patient.gender = r4:male;


    io:print(patient.toJson());

}
