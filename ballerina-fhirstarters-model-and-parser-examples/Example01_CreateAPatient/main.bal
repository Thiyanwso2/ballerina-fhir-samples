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
    r4:Patient patient = {};

    // Add a "name" element
    r4:HumanName[] humanName= [{"family":"Simpson", given: ["Homer", "J"]}];
    patient.name = humanName;

    // Add an "identifier" element
    r4:Identifier[] identifier = [{"value": "7000135", "system": "http://acme.org/MRNs"}];
    patient.identifier = identifier;

    // Assign value directly to the existing patient data
    //patient.identifier = [{"value": "7000135", "system": "http://acme.org/MRNs"}];

    io:println(patient.toJson());
}
