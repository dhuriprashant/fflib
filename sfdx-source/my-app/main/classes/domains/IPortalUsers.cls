public interface IPortalUsers extends IApplicationSObjectDomain {
    Map<String, Boolean> validateUserSso();
    Map<String, Boolean> validateUserSso(List<PortalUser__c> ssoId);
}