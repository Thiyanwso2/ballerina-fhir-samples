// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.

import ballerina/io;
import wso2healthcare/healthcare.fhir.r4;

public function main() {

    //Create a Patient record
    r4:Patient patient = {};

    // Add an "identifier" and name element to the patient
    patient.name = [{family: "Simpson", given: ["Homer", "J"]}];
    patient.identifier = [{value: "7000135", system: "http://acme.org/MRNs"}];

    // Create an "Contact Point" element and add it to the patient
    r4:ContactPoint contact = {};
    contact.use = r4:home;
    contact.system = r4:phone;
    contact.value = "1 (416) 340-4800";
    patient.telecom = [contact];

    // Add an "gender" to the patient
    patient.gender = r4:CODE_GENDER_MALE;

    io:print(patient.toJson());

}
