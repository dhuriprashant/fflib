public interface ICommunityPortalService {
    List<PortalUser__c> getAllPortalUsers();
  Boolean isUserLoggedIn(String portalUserSsoId);
}