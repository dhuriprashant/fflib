public inherited sharing class CommunityPortalService implements ICommunityPortalService{
    // example usage via a Selector Class
  public List<PortalUser__c> getAllPortalUsers() {
    IPortalUserSelector selector = (IPortalUserSelector)Application.Selector.newInstance(
      PortalUser__c.SObjectType
    );
    return selector.selectAll();
  }

  // example usage via a Domain Class
    public Boolean isUserLoggedIn(String userId) {
        IPortalUsers iPortalUsers = (IPortalUsers) Application.Domain.newInstance(
      new Set<Id>{userId}
        );
        Map<String, Boolean> validatedUsersBySsoId = iPortalUsers.validateUserSso();
        return validatedUsersBySsoId.get(userId);
    }
}