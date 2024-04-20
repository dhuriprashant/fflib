@isTest
private class PortalUserControllerTest {

    //mocks
    static fflib_ApexMocks mocks = new fflib_ApexMocks();

    // Services (mock)
  // it is good practice to append "Mock" to these definitions.
  // you may need to initialise actual service methods (not mocked) in your test class.
  static ICommunityPortalService communityPortalServiceMock = (ICommunityPortalService) mocks.mock(
    ICommunityPortalService.class
  );

  @IsTest
  static void getAllPortalUsersTest() {
    // 1. Setup your mock data
    List<PortalUser__c> portalUsers = new List<PortalUser__c>{
      GenericTestFactory.createPortalUser(),
      GenericTestFactory.createPortalUser(),
      GenericTestFactory.createPortalUser()
    };
 
    // 2. Mock your service methods (and return your mocked data).
    // Put service method inputs here too for mocking (e.g. myServiceMethod(accountId, contactId)).
    mocks.startStubbing();
    mocks.when(communityPortalServiceMock.getAllPortalUsers())
      .thenReturn(portalUsers);
    mocks.stopStubbing();
 
    // 3. set the mock service(s)
    Application.Service.setMock(ICommunityPortalService.class, communityPortalServiceMock);
 
    // 4. Call the controller method after setting up the service layer mocks
    List<PortalUser__c> portalUsersResponse = PortalUserController.getAllPortalUsers();
 
    // 5. Assert the response
    Assert.areEqual(
      portalUsers.size(), 
      portalUsersResponse.size(),
      'Response users does not match expected size.'
    );
    // NOTE: we're using the new Winter '23 Apex assert syntax here
    // this may also be written as
    System.assertEquals(
      portalUsers.size(), 
      portalUsersResponse.size(),
      'Response users does not match expected size.'
    );
  }

}