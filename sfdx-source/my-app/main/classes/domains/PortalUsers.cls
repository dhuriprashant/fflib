public inherited sharing class PortalUsers extends ApplicationSObjectDomain implements IPortalUsers {

  // 1. Boilerplate code
  public static IPortalUsers newInstance(List<PortalUser__c> records) {
    return (IPortalUsers) Application.Domain.newInstance(records);
  }
 
  public static IPortalUsers newInstance(Set<Id> recordIds) {
    return (IPortalUsers) Application.Domain.newInstance(recordIds);
  }
 
  public PortalUsers(List<PortalUser__c> records) {
    super(records);
  }
 
  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new PortalUsers(sObjectList);
    }
  }

      // 2. Trigger methods
  public override void onBeforeInsert() {
    this.validateUserSso(getRecords());
  }
 
  public override void onBeforeUpdate(Map<Id, SObject> existingRecords) {
    this.validateUserSso(getChangedRecords(new Set<String>{ 'SSOId__c' }));
  }
 
  // 3. Domain methods
  public Map<String, Boolean> validateUserSso() {
    return validateUserSso((List<PortalUser__c>)getRecords());
  }
  public Map<String, Boolean> validateUserSso(List<PortalUser__c> portalUsers) {
    // run sso validation here
    Map<String, Boolean> result = new Map<String, Boolean>();
    for(PortalUser__c portalUser : portalUsers) {
      result.put(portalUser.Id, true);
    }
    return result;
  }
}