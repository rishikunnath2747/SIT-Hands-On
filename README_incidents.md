# Tutorial for SIT hands-on
The `com.sap.cds:sdm` dependency is a [CAP Java plugin](https://cap.cloud.sap/docs/java/building-plugins) that provides an easy CAP-level integration with [SAP Document Management Service](https://discovery-center.cloud.sap/serviceCatalog/document-management-service-integration-option). This package supports handling of attachments(documents) by using an aspect Attachments in SAP Document Management Service.  
This plugin can be consumed by the CAP application deployed on BTP to store their documents in the form of attachments in Document Management Repository.
[REVISIT - EXPLAIN PLUGIN AND USE CASE]

## Table of Contents

- [Setting up the Incidents Management App](#Setting-up-the-Incidents-Management-App)

## Setting up the Incidents Management App

In this guide, we use the Incidents Management app to use the SDM Plugin

1. Open Visual Studio Code
2. Open a new terminal using Ctrl+Shift+`
3. Execute the following commands

```sh
cd ~/Desktop/SIT-Hands-On/incident-managementjava
```

4. In the terminal execute the command given below 

```sh
   code -r .
```
5. If you are prompted with a dialog box with the following question : `"Do you trust the authors of the files in this folder?"`, click `"Yes, I trust the authors"`

6. From the explorer tab on the left open /incident-managementjava/app/incidents/webapp/manifest.json

7. On Line8, replace the value of `version` with the value given in the setup.txt file on your desktop

8. From the explorer tab on the left open incidents-managementjava/mta.yaml

9. On Line20, replace the value of `REPOSITORY_ID` with the value given in the setup.txt file on your desktop

> **INTEGRATING THE SDM PLUGIN**
>
> This note is for your information, the following steps do not need to be followed and have already been done for you
>
> In the mta.yaml file
> - On Line160 we provide the details of the SDM instance of the space in which we will deploy the application
> - On Line37 we bind the SDM instance with our CAP application
> - On Line20 we provide the ID of the SDM Repository in which we want to store our attachments
>
> In the srv/services.cds file
> - On Line2 we import the attachments aspect from the SDM plugin
> - On Line12-14 we extend the Incidents entity with the imported attachments aspect
>
> In the app/incidents/annotations.cds file
> - On Line45-50 we add the UI Facet so that we see the attachments section on the UI
>
> In the srv/pom.xml file 
> - On Line77-81 we add the Java dependency for the SDM plugin

10. Open the `cmd` and execute the following commands 

```sh
   mbt build
```
```sh
   cf deploy mta_archives/incident-management_1.0.0.mtar -f
``` 

11. Once the deployment is successful, open subaccount>HTML5 Applications and click on ns.incidents with the version you added in step 7
12. Click on Manage Books
13. Click on Create
14. Scroll down to the ATTACHMENTS section and click on upload
15. Select a file and click on Open [REVISIT - ADD TEST FILE TO ALL LAPTOPS]
16. Once you see the hyperlink with the file name in the Attachment column click on create. [REVISIT - READ/RENAME?]
