@isTest
public class TestTeachTrigger {
    @isTest 
    static void testOnBeforeInsertOne(){
        List<Teach__c> teaches=TestDataFactory.createTeachWithHindi(100);
        Test.startTest();
        Database.SaveResult result = Database.insert(teaches[0], false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Can Not Insert',result.getErrors()[0].getMessage());
    }
    
    @isTest 
    static void testBulkOnBeforeInsert(){
		List<Teach__c> teaches=TestDataFactory.createTeachWithHindi(100);
	Test.startTest();
        Database.SaveResult[] results = Database.insert(teaches, false);
        Test.stopTest();
           for(Database.SaveResult dr : results) {
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size() > 0);
            System.assertEquals('Can Not Insert',dr.getErrors()[0].getMessage());
        }
    }

    @isTest
    static void testOnBeforeInsertNegative(){
        List<Teach__c> teaches=TestDataFactory.createTeachNegativeData(100);//Given teach data
		Test.startTest();
        insert teaches; 
		Test.stopTest();
        system.assertEquals(100, [Select id FROM Teach__c].size());
    }

    @isTest 
static void testOnBeforeUpdateOne(){
        List<Teach__c> teaches=TestDataFactory.updateTeachWithHindi(100);//Given teach data
      teaches[0].subjects__c='Hindi';
        Test.startTest();
        Database.SaveResult result = Database.update(teaches[0], false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Can not Edit',result.getErrors()[0].getMessage());
        
    }

    @isTest 
static void testBulkOnBeforeUpdate(){
        List<Teach__c> teaches=TestDataFactory.updateTeachWithHindi(100);
        for(Integer i=0;i<100;i++){
            teaches[i].subjects__c='Hindi';
        }
        Test.startTest();
        	Database.SaveResult[] results = Database.update(teaches, false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
        	System.assert(!dr.isSuccess());
        	System.assert(dr.getErrors().size() > 0);
        	System.assertEquals('Can not Edit',dr.getErrors()[0].getMessage());
        }
        
    }
    @isTest
    static void testOnBeforeUpdateNegative(){
        List<Teach__c> teaches=TestDataFactory.updateTeachNegativeData(100);
        for(Teach__c t:teaches){
            t.subjects__c='English;Maths';
        }
        Test.startTest();
        	Database.SaveResult[] results = Database.update(teaches, false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
            System.assert(dr.isSuccess());
        }
    }

}