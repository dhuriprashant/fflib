public inherited sharing class PortalUserSelector extends ApplicationSObjectSelector implements IPortalUserSelector{

    private List<String> additionalSObjectFieldList = new List<String>{
        'Id',
        'SSOId__c',
        'FirstName__c',
        'LastName__c',
        'DisplayName__c'
      };

    /* 2. Boilerplate code */
    public static PortalUserSelector newInstance() {
        return (PortalUserSelector) Application.Selector.newInstance(
          PortalUser__c.SObjectType
        );
    }

    public Schema.SObjectType getSObjectType() {
        return PortalUser__c.SObjectType;
    }
     
    public fflib_QueryFactory getQueryFactory() {
        return new fflib_QueryFactory(getSObjectType());
    }
     
    public override List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>();
    }
     
    public List<String> getSObjectFieldListWithRelatedFields() {
        return this.additionalSObjectFieldList;
    }
     
    public void setSObjectFieldListWithRelatedFields(String[] values) {
        this.additionalSObjectFieldList = values;
    }
     
    @TestVisible
    private List<Schema.SObjectField> getAdditionalSObjectFieldList() {
        return new List<Schema.SObjectField>{};
    }

    /* 3. Selector Methods */
    public List<PortalUser__c> selectById(Set<Id> idSet) {
        if(idSet == null || idSet.isEmpty()) {
            return new List<PortalUser__c>();
        }

        fflib_QueryFactory queryFactory = getQueryFactory();
        queryFactory.selectFields(getSObjectFieldListWithRelatedFields());
        queryFactory.setCondition('Id IN :idSet');
        return Database.query(queryFactory.toSOQL());
    }

    public PortalUser__c selectById(Id recordId) {
        List<PortalUser__c> recordList = selectById(new Set<Id>{ recordId });
        return recordList.isEmpty() ? null : recordList[0];
    }

    public List<PortalUser__c> selectAll() {
        fflib_QueryFactory queryFactory = getQueryFactory();
        queryFactory.selectFields(getSObjectFieldListWithRelatedFields());
        return Database.query(queryFactory.toSOQL());
    }
}