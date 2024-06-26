@isTest(IsParallel=true)
private class PortalUserSelectorTest {

    public final static SObjectType SOBJECT_TYPE = PortalUser__c.SObjectType;
    public static final List<PortalUser__c> EMPTY_LIST = new List<PortalUser__c>();

    /* Generic tests all selectors have */
  @IsTest
  static void shouldReturnRecordSObjectType() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    System.assertEquals(
      SOBJECT_TYPE,
      selector.getSObjectType(),
      'Expected object type returned correctly'
    );
  }
 
  @IsTest
  static void shouldReturnQueryFactory() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    System.assertNotEquals(
      null,
      selector.getQueryFactory(),
      'Expected a query factory returned'
    );
  }
 
  @IsTest
  static void shouldReturnObjectFieldList() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    System.assertNotEquals(
      null,
      selector.getSObjectFieldList(),
      'Expected field list returned'
    );
  }
 
  @IsTest
  static void shouldSetAndGetSObjectFieldListWithRelatedFields() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    selector.setSObjectFieldListWithRelatedFields(new List<String>{ 'test' });
    List<String> result = selector.getSObjectFieldListWithRelatedFields();
    System.assert(!result.isEmpty());
  }
 
  @IsTest
  static void shouldNotGetErrorsOnGettingAdditionalFieldsList() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    selector.getAdditionalSObjectFieldList();
    System.assert(true, 'Expected no errors');
  }
 
  @IsTest
  static void shouldReturnEmptyListWhenSelectByIdHasEmptySetParameterVal() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    System.assertEquals(
      EMPTY_LIST,
      selector.selectById(new Set<Id>()),
      'Expected empty list because there is no id values in the Set'
    );
  }
 
  @IsTest
  static void shouldReturnEmptyListWhenSelectByIdSetDoesNotExist() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    System.assertEquals(
      EMPTY_LIST,
      selector.selectById(
        new Set<Id>{ fflib_IDGenerator.generate(SOBJECT_TYPE) }
      ),
      'Expected empty list because record id value does not exist'
    );
  }
 
  @IsTest
  static void shouldReturnEmptyListWhenSelectByIdDoesNotExist() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    System.assertEquals(
      null,
      selector.selectById(fflib_IDGenerator.generate(SOBJECT_TYPE)),
      'Expected null because record id value does not exist'
    );
  }
 
  @IsTest
  static void shouldReturnEmptyListWhenSelectSObjectsByIdSetDoesNotExist() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    System.assertEquals(
      new List<SObject>(),
      selector.selectSObjectsById(
        new Set<Id>{ fflib_IDGenerator.generate(SOBJECT_TYPE) }
      ),
      'Expected empty list because record id value does not exist'
    );
  }
 
  /* Selector specific tests */
  @IsTest
  static void testSelectAll() {
    PortalUserSelector selector = PortalUserSelector.newInstance();
    System.assertEquals(
      EMPTY_LIST,
      selector.selectAll(),
      'Expected empty list because there have been no test records inserted'
    );
  }
}