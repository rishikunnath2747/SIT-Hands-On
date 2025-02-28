# Tutorial for SIT hands-on
The `com.sap.cds:sdm` dependency is a [CAP Java plugin](https://cap.cloud.sap/docs/java/building-plugins) that provides an easy CAP-level integration with [SAP Document Management Service](https://discovery-center.cloud.sap/serviceCatalog/document-management-service-integration-option). This package supports handling of attachments(documents) by using an aspect Attachments in SAP Document Management Service.  
This plugin can be consumed by the CAP application deployed on BTP to store their documents in the form of attachments in Document Management Repository.

## Table of Contents

- [Setting up the Incidents Management App](#Setting-up-the-Incidents-Management-App)

## Setting up the Incidents Management App

In this guide, we use the Incidents Management app to use the SDM Plugin

1. Open `Visual Studio Code`
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

6. Open the `Command Prompt` and execute the following commands 

```sh
   mbt build
```
```sh
   cf deploy mta_archives/Incident-Management-Java_1.0.0.mtar -f
``` 

7. Once the deployment is successful, open the app url given in the user.txt file on the desktop
8. Click on Manage Books
9. Click on Create
10. Make sure to the set some value in the `Customer` and `Title`fields
10. Scroll down to the ATTACHMENTS section and click on upload
11. Select the user.txt file present on the desktop
12. Once you see the hyperlink with the file name in the Attachment column click on create. 
