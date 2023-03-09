# ballerina-fhir-model-parser-examples
- To run the samples
- Navigate to the root directory FHIR API you want run for e-g: Example01_CreateAPatient
- Then run the below command 

```
bal run
```

# Descriptions

- [Example01_CreateAPatient](Example01_CreateAPatient): This will create simple Patient model and add some data on it.

- [Example02_EnumeratedTypes](Example02_EnumeratedTypes): This will create simple Patient model and add some Enum type data on it.

- [Example03_EncodeResource](Example03_EncodeResource): This will create simple Patient model convert it in to string and json

- [Example04_ParseResource](Example04_ParseResource): This will parse json data to Patient model

- [Example05_ClientCreate](Example05_ClientCreate): This will do create FHIR interaction with the remote FHIR server using ballerina clinet connector

- [Example06_ClientReadAndUpdate](Example06_ClientReadAndUpdate): This will do read and update FHIR interaction with the remote FHIR server using ballerina clinet connector

- [Example07_ClientSearch](Example07_ClientSearch): This will do search FHIR interaction with the remote FHIR server using ballerina clinet connector

- [Example08_AddSomeExtensions](Example08_AddSomeExtensions): This will add extension record to a Patient

- [Example09_ContainedResources](Example09_ContainedResources): This will create Observation and Patient record, add reference 

- [Example10_UseExtendedPatient](Example10_UseExtendedPatient): This will add US Core Patient model and add some data on it.
