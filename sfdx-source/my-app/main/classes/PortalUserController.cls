public with sharing class PortalUserController {
    @TestVisible
  private static ICommunityPortalService communityPortalService = (ICommunityPortalService) Application.Service.newInstance(
    ICommunityPortalService.class
  );

    @AuraEnabled
    public static List<PortalUser__c> getAllPortalUsers() {
        return communityPortalService.getAllPortalUsers();
    }
}