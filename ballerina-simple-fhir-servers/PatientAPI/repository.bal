// // Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.

import wso2healthcare/healthcare.fhir.r4;
import ballerina/io;
import ballerina/log;
import ballerina/random;

// Initializes an `isolated` variable using
// an `isolated` expression.

isolated map<r4:Patient> data = {};

isolated r4:Patient[] list = [];

    isolated function addJson(json patient) returns string|error {
        lock {
            r4:Patient parsedResource = parseResource(patient.clone(), r4:Patient);

            string? id = parsedResource.id;

                if id is string{
                    data[id] = parsedResource;
                    return id;
                } else { 
                    int randomInteger= 0;
                    do {
                        randomInteger = check random:createIntInRange(100000, 1000000);
                    } on fail var e {
                        log:printError("Something went wrong while generating random patient id", e);
                    }

                    if randomInteger is int{
                        string randomId = randomInteger.toBalString();
                        parsedResource.id = randomId;
                        data[randomId] = parsedResource;
                        return randomId; 
                    }
                }           
        }
    }

    isolated function add(r4:Patient patient) returns string|error {
        lock {

            string? id = patient.id;

                if id is string{
                    data[id] = patient.clone();
                    return  id;
                } else {
                
                    int randomInteger= 0;
                    do { 
                        randomInteger = check random:createIntInRange(100000, 1000000);
                    } on fail var e {
                        log:printError("Something went wrong while generating random patient id", e);
                    }

                    if randomInteger is int{
                        string randomId = randomInteger.toBalString();
                        patient.id = randomId;

                        //r4:Patient p = patient.clone();
                        r4:Patient|error clonedPatient = patient.clone().cloneWithType(r4:Patient);
                         if clonedPatient is r4:Patient {
                                data[randomId] = clonedPatient;
                                return randomId;
                         }
                    }
                }           
        }
        return "";
    }

    isolated function get(string id) returns r4:FHIRError|r4:Patient {
        r4:Patient clone={};
        lock {

            if(data.hasKey(id)){
                clone = data.get(id).clone();
            } else {
                return r4:createFHIRError("No resource found for the privided id",r4:CODE_SEVERITY_ERROR,r4:PROCESSING_NOT_FOUND);
            }
            
        }
        return clone;
    }

    isolated function getAll() returns r4:Patient[] {
        lock {
            return data.toArray().clone();
        }
    }

    // This init method will read some initial patient resource from a file and initialise the internal map
    function init() returns error? {
        io:print("Reading the patient data from resources/data.json and initialising the in memory patients map");

        json[]|error patientsArray =  <json[]> check io:fileReadJson("resources/data.json");

        if patientsArray is error {
            log:printError("Something went wrong", patientsArray);
                    
        } else {
            foreach json res in patientsArray {       
                _ = check addJson(res);   
            }
        }      
    }

