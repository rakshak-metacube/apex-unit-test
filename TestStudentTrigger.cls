@isTest 
private class TestStudentTrigger {
    @isTest
    public static void testOnBeforeInsertOne(){
        List<Student__c> students=TestDataFactory.insertClassData(100,5);
        Test.startTest();
        	DataBase.SaveResult result= Database.insert(students[0],false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Can not insert student',result.getErrors()[0].getMessage());
    }
    
    @isTest
    public static void testBulkOnBeforeInsert(){
        List<Student__c> students=TestDataFactory.insertClassData(100,5);
        Test.startTest();
        	DataBase.SaveResult[] results= Database.insert(students,false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size() > 0);
            System.assertEquals('Can not insert student',dr.getErrors()[0].getMessage());
        }

    }
    @isTest
    public static void testOnBeforeInsertNegative(){
        List<Student__c> students=TestDataFactory.insertClassData(100,5);
        Test.startTest();
        	DataBase.SaveResult[] results= Database.insert(students,false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
            System.assert(dr.isSuccess());
        }
        System.assertEquals(200, [Select Id from Student__c].size());
    }   
    
    
    @isTest 
    public static void testOnAfterInsertOne(){
        List<Student__c> students=TestDataFactory.insertStudentInClass(100);
        Test.startTest();
        	insert students;
        Test.stopTest();
        class__c cls=[SELECT Id,my_count__c FROM class__c WHERE id = :students[0].class__c LIMIT 1 ];
        System.assertEquals(1, cls.My_Count__c);
        system.debug(cls);
      
    }
    @isTest 
    public static void testBulkOnAfterInsert(){
        List<Student__c> students=TestDataFactory.insertStudentInClass(100);
        Test.startTest();
        	insert students;
        Test.stopTest();
        List<Id> classIds=new List<Id>();
        for(Student__c s:students){
            classIds.add(s.class__c);
        }
        List<class__c> cls=[SELECT Id,my_count__c FROM class__c WHERE id = :classIds ];
        for(class__c c:cls){
        	System.assertEquals(1, c.My_Count__c);
        }
      
    }

    @isTest 
    public static void testOnAfterInsertNegative(){
        List<Student__c> students=TestDataFactory.insertStudentInClass(100);
        insert students;
        List<class__c> classes=[Select id FROM Class__c];
        Test.startTest();
        List<Student__c> newStu=new List<Student__c>();
        for(Integer i=0;i<100;i++){
            newStu.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='Female',class__c=classes[i].id));
        }
        insert newStu;
        Test.stopTest();
        
        List<Id> classIds=new List<Id>();
        for(Student__c s:students){
            classIds.add(s.class__c);
        }
        List<class__c> cls=[SELECT Id,my_count__c FROM class__c WHERE id = :classIds ];
        for(class__c c:cls){
        	System.assertNotEquals(1, c.My_Count__c);
        }
    }
}