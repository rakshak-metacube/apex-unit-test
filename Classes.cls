public class Classes extends fflib_SObjectDomain{
	public Classes(List<class__c> sObjectList) {
        super(sObjectList);
    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Classes(sObjectList);
        }
    }
    public override void onBeforeDelete(){
        system.debug('beforeDelete');
        Map<Id,Integer>count=new ClassSelector().selectClassIdWithFemaleStudent();
        Set<Id> classId=count.keySet();
        for(Class__c cl:(List<Class__C>) Records){
            if(classId.contains(cl.id)){
                if(count.get(cl.id)>1){
                    cl.addError('You can not delete this class because this class contain female student');
                }
            }
    	}
	}
         public void updateMyCount(fflib_SObjectUnitOfWork uow,Map<Id,Integer> count){
        for(Class__c cl:(List<Class__C>) Records){
          	cl.My_Count__c=cl.My_Count__c+count.get(cl.id);
            uow.registerDirty(cl);
        }
    }
       public override void onAfterUpdate(Map<Id,SObject> updatedClass){
        List<Id> classId=new List<Id>();
        for(Class__c cl:(List<Class__C>) Records){
            if(cl.custom_status__c=='Reset'){
                classId.add(cl.id);
            }
        }
        StudentDomain st=new studentDomain([select id from student__c where class__c in :classId]);
        st.deleteStudent(); 
    }


}