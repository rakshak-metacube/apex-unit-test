@isTest
public class TestOpportunityTrigger {
	@isTest
    public static void testOnBeforeUpdateOne(){
        List<Opportunity> opp=TestDataFactory.insertOpportunity(100);
        opp[0].stageName='Closed Won';
        Test.startTest();
        	update opp[0];
        Test.stopTest();
        Opportunity op=[SELECT Id,CloseDate from Opportunity where Id=:opp[0].Id LIMIT 1];
        System.assertEquals(Date.today(), op.closeDate);
        
    }
        @isTest
    public static void testBulkOnBeforeUpdate(){
        List<Opportunity> opp=TestDataFactory.insertOpportunity(100);
        List<Id> oppId=new List<Id>();
        for(Integer i=0;i<100;i++){
        	opp[i].stageName='Closed Won';
            oppId.add(opp[i].Id);
        }
        Test.startTest();
        	update opp;
        Test.stopTest();
               List<Opportunity> op=[SELECT Id,CloseDate FROM Opportunity WHERE Id=:oppId];
        for(Opportunity o:op){
        	System.assertEquals(Date.today(), o.closeDate); 
        }

        
    }

    @isTest
    public static void testOnBeforeUpdateNegative(){
        List<Opportunity> opp=TestDataFactory.insertOpportunity(100);
        List<Id> oppId=new List<Id>();
       	for(Integer i=0;i<100;i++){
        	opp[i].stageName='Qualification';
            oppId.add(opp[i].Id);
        }
        Test.startTest();
        	update opp;
        Test.stopTest();
        List<Opportunity> op=[SELECT Id,CloseDate FROM Opportunity WHERE Id=:oppId];
        for(Opportunity o:op){
        	System.assertNotEquals(Date.today(), o.closeDate); 
        }
        
    }

}