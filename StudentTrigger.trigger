trigger StudentTrigger on Student__c (after delete, after insert, after update, after undelete, before delete, before insert, before update) {
    fflib_SObjectDomain.triggerHandler(StudentDomain.class);
}