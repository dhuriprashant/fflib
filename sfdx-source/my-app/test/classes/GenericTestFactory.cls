
@isTest
public class GenericTestFactory {

    @IsTest
    public static PortalUser__c createPortalUser() {
        PortalUser__c portalUser = new PortalUser__c();
        portalUser.FirstName__c = 'Test';
        portalUser.LastName__c = 'User';
        return portalUser;
    }
}