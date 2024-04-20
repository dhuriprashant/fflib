public interface IPortalUserSelector extends IApplicationSObjectSelector {
    List<PortalUser__c> selectById(Set<Id> idSet);
    PortalUser__c selectById(Id recordId);
    List<PortalUser__c> selectAll();
}