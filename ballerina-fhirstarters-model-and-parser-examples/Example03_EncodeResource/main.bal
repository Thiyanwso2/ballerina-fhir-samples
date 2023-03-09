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

public function main() returns error? {

    // Create a Patient and add some data on it
    r4:Patient patient = {};
    patient.name = [{family: "Simpson", given: ["Homer", "J"]}];
    patient.identifier = [{value: "7000135", system: "http://acme.org/MRNs"}];
    patient.telecom = [{use: r4:home, system: r4:phone, value: "1 (416) 340-4800"}];
    patient.gender = r4:male;

    //To string
    io:println("To string: " + patient.toString());

    //To json string
    io:println("To Json string: " + patient.toJsonString());

    //To Json
    io:print("To Json: ");
    io:print(patient.toJson());
}
