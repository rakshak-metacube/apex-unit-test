@isTest
public class TestClassTrigger {
    @isTest 
public static void testOnBeforeDeleteOne(){
        List<Class__c> classes=TestDataFactory.insertClassWithFemaleStudent(100);
         Test.startTest();
        Database.DeleteResult result = Database.delete(classes[0], false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('You can not delete this class because this class contain female student',result.getErrors()[0].getMessage());
    }

   @isTest 
public static void testBulkOnBeforeDelete(){
        List<Class__c> classes=TestDataFactory.insertClassWithFemaleStudent(100);
         Test.startTest();
        	Database.DeleteResult[] results = Database.delete(classes, false);
        Test.stopTest();
        for(Database.DeleteResult dr:results){
        	System.assert(!dr.isSuccess(),'Class can not delete');
        	System.assert(dr.getErrors().size() > 0);
        	System.assertEquals('You can not delete this class because this class contain female student',dr.getErrors()[0].getMessage());
        }
    }

     @isTest 
   	 public static void testOnBeforeDeleteNegative(){
     	List<Class__c> classes=TestDataFactory.insertClassWithOutFemaleStudent(100);
        Test.startTest();
        	Database.DeleteResult[] results = Database.delete(classes, false);
        Test.stopTest();
        for(Database.DeleteResult dr:results){
        	System.assert(dr.isSuccess());
        }
        System.assertEquals(0, [Select id 	FROM Class__c].size());
        
     }

    
    
    @isTest public static void testOnAfterUpdateOne(){
         List<Class__c> classes=TestDataFactory.insertClassDataWithCustomStatus(100);
        classes[0].custom_status__c='Reset';
        Test.startTest();
        	update classes[0];
        Test.stopTest();
        Class__c cls=[Select Id,(Select Id FROM students__r) FROM class__c where Id=:classes[0].Id LIMIT 1];
        system.assertEquals(0, cls.students__r.size());
        
    }
    
      @isTest public static void testBulkOnAfterUpdate(){
         List<Class__c> classes=TestDataFactory.insertClassDataWithCustomStatus(100);
         List<Id> classId=new List<Id>();
          for(Class__c c:classes){
              c.custom_status__c='Reset';
              classId.add(c.id);
          }
        Test.startTest();
        	update classes;
        Test.stopTest();
        Class__c[] cls=[Select Id,(Select Id FROM students__r) FROM class__c where Id=:classId LIMIT 1];
          for(class__c c:cls){ 
        	system.assertEquals(0, c.students__r.size());
          }
        
    }
    @isTest 
    public static void testOnAfterUpdateNegative(){
         List<Class__c> classes=TestDataFactory.insertClassDataWithCustomStatus(100);
         List<Id> classId=new List<Id>();
          for(Class__c c:classes){
              c.custom_status__c='Open';
              classId.add(c.id);
          }
        Test.startTest();
        	update classes;
        Test.stopTest();
        Class__c[] cls=[Select Id,(Select Id FROM students__r) FROM class__c where Id=:classId LIMIT 1];
        for(class__c c:cls){ 
        	system.assertEquals(1, c.students__r.size());
          }
    }

}