public class Opportunities extends fflib_SObjectDomain {
        public Opportunities(List<Opportunity> sObjectList) {
        super(sObjectList);
    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Opportunities(sObjectList);
        }
    }
    public override void onBeforeUpdate(Map<Id,SObject> beforeOpp){
          for(Opportunity opp:(List<Opportunity>) Records){
              system.debug(opp.stageName);
            if(opp.stageName=='Closed Won' || opp.stageName=='Closed LOST'){
                opp.CloseDate=Date.today();
            }
        }
    }
}