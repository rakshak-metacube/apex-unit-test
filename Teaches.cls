public class Teaches extends fflib_SObjectDomain {
    public Teaches(List<Teach__c> sObjectList) {
        super(sObjectList);
    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Teaches(sObjectList);
        }
    }
    public override void onBeforeUpdate(Map<Id,SObject> beforeOpp){ 
        for(Teach__c teach:(List<Teach__C>) Records){
            if(((Teach__c)beforeOpp.get(teach.id)).subjects__c.contains('Hindi')){
                teach.addError('Can not Edit');
            }
        }
        
    }
    
    public override void onBeforeInsert(){
        for(Teach__c tc:(List<Teach__c>) Records){
            if(tc.subjects__c.contains('Hindi')){
                tc.addError('Can Not Insert');
            }
        }
    }
    
}