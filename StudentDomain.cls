public class StudentDomain extends fflib_SObjectDomain{
	public StudentDomain(List<student__c> sObjectList) {
        super(sObjectList);
    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new StudentDomain(sObjectList);
        }
    }
    public override void onBeforeInsert(){
        system.debug('Before Insert');
        Map<Id,List<Integer> > count=new ClassSelector().ClassStudentCount();
        Set<Id> classId=count.keyset();
          for(Student__c st:(List<Student__C>) Records){
            if(count.get(st.class__c)[0]==count.get(st.class__c)[1]){
                St.addError('Can not insert student');
            }
        }
    }
    
	public override void onAfterInsert(){
     fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {
     Class__c.SObjectType   
     });
     Map<Id,Integer> count=new Map<Id,Integer>();
     for(Student__c st:(List<Student__C>) Records){
         if(count.keySet().contains(st.Class__c)){
             count.put(st.Class__c,count.get(st.class__c)+1);
         }
         else{
             count.put(st.Class__c,1);
         }
     }
     Classes cls=new Classes([SELECT Id,my_count__c FROM Class__c WHERE Id in :count.keyset()]);
     cls.updateMyCount(uow,count);   
     uow.commitWork();
    }
         public override void onAfterUpdate(Map<Id,SObject> oldRecord){
        System.debug('on After Update');
     fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {
     Class__c.SObjectType   
     });
     Map<Id,Integer> classIdForIncre =new  Map<Id,Integer>();
     Map<Id,Integer>classIdForDecre = new Map<Id,Integer>();   
     for(Student__c st:(List<Student__C>) Records){
         Student__c oldStu=(Student__c)oldRecord.get(st.id);
         if(oldStu.class__c!=st.class__c){
             if(classIdForDecre.keySet().contains(oldStu.class__c)){
                 classIdForDecre.put(oldStu.class__c,classIdForDecre.get(oldStu.class__c)-1);
             }
             else{
                 classIdForDecre.put(oldStu.class__c,-1);
             }
             if(classIdForIncre.keySet().contains(st.class__c)){
                 classIdForIncre.put(st.class__c,classIdForIncre.get(st.class__c)+1);
             }
             else{
                 classIdForIncre.put(st.class__c,1);
             }
         }

     }
        Classes cls=new Classes([SELECT Id,my_count__c FROM Class__c WHERE Id in :classIdForIncre.keySet()]);
        cls.updateMyCount(uow,classIdForIncre);
        cls=new Classes([SELECT Id,my_count__c FROM Class__c WHERE Id in :classIdForDecre.keySet()]);
        cls.updateMyCount(uow, classIdForDecre);
        uow.commitWork();
        
        
    }


    
  	public void deleteStudent(){
        delete Records;
    }

}