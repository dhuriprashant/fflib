@isTest
private class PortalUsersTest {

    // test that generating a new instance works
  // this will fail if the Custom Metadata records have not been setup
  @IsTest
  static void newInstanceTest() {
    IPortalUsers instanceByIds = PortalUsers.newInstance(
      new Set<Id>{ fflib_IDGenerator.generate(PortalUser__c.SObjectType) }
    );
    IPortalUsers instanceByRecords = PortalUsers.newInstance(new List<PortalUser__c>());
  }

  @IsTest
  static void insertAndUpdateOnRecords() {
    // Test insert, update and delete fires off triggers properly
    List<PortalUser__c> portalUsers = new List<PortalUser__c>{
      GenericTestFactory.createPortalUser(),
      GenericTestFactory.createPortalUser(),
      GenericTestFactory.createPortalUser()
    };
    insert portalUsers;
    update portalUsers;
    delete portalUsers;
  }

  @IsTest
  static void validateUserSsoTest() {
    // TODO: mock selector and/or service methods before running the domain class method
    List<PortalUser__c> portalUsers = new List<PortalUser__c>{
      GenericTestFactory.createPortalUser(),
      GenericTestFactory.createPortalUser(),
      GenericTestFactory.createPortalUser()
    };
 
    IPortalUsers portalUsersDomain = (IPortalUsers) Application.Domain.newInstance(portalUsers);
    portalUsersDomain.validateUserSso();
  }

}