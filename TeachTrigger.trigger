trigger TeachTrigger on Teach__c (after delete, after insert, after update, after undelete, before delete, before insert, before update) {
    fflib_SObjectDomain.triggerHandler(Teaches.class);
}