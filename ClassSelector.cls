public class ClassSelector extends fflib_SObjectSelector {
 public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Class__c.Id,
            Class__c.Name,
            Class__c.Max_Size__c,
            Class__c.My_Count__c,
            Class__c.Number_Of_Students__c};
    }
    public Schema.SObjectType getSObjectType() {
        return Class__c.sObjectType;
    }
    public Map<Id,Integer> selectClassIdWithFemaleStudent(){
        List<Class__c> ct=[select id,(SELECT id FROM students__r WHERE sex__c='female') FROM class__c];
        Map<Id,Integer> count=new Map<Id,Integer>();
        for(class__c c:ct){
            system.debug('hello'+c.students__r.size());
            if(c.students__r!=null && c.students__r.size()!=0){
            count.put(c.id,c.students__r.size());
            }
            else{
                count.put(c.id,0);
            }
            system.debug(count.get(c.id));
        }
        return count;
    }
    public Map<Id,List<Integer> > ClassStudentCount(){
       List<Class__c> ct=[select id,Number_of_Students__c,Max_Size__c,(SELECT Id FROM students__r) FROM class__c];
       Map<Id,List<Integer> > count=new Map<Id,List<Integer>>();
        for(class__c c:ct){
            system.debug('hello'+c.students__r.size());
            if(c.students__r!=null && c.students__r.size()!=0){
                count.put(c.id,new List<Integer>{c.students__r.size(),(Integer)c.Max_Size__c});
            }
            else{
                count.put(c.id,new List<Integer>{0,(Integer)c.Max_Size__c});
            }
            system.debug(count.get(c.id));
        }
        return count; 
    }
}