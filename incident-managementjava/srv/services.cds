using { sap.capire.incidents as my } from '../db/schema';
using {sap.attachments.Attachments} from `com.sap.cds/sdm`;

service ProcessorService { 
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;
}


extend my.Incidents with {
  attachments: Composition of many Attachments
};



   annotate ProcessorService.Incidents with @odata.draft.enabled @fiori.draft.enabled;
  

    annotate ProcessorService with @(requires: 'support');

/**
 * Service used by administrators to manage customers and incidents.
 */
service AdminService {
    entity Customers as projection on my.Customers;
    entity Incidents as projection on my.Incidents;
    }




    annotate AdminService with @(requires: 'admin');
    