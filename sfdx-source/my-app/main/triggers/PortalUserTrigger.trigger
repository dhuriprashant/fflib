trigger PortalUserTrigger on PortalUser__c (before insert, before update) {
    fflib_SObjectDomain.triggerHandler(PortalUsers.class);
}