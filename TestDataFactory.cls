public class TestDataFactory {
    public static List<Teach__c> createTeachWithHindi(Integer teachCount){
        List<Contact> teacher = new List<Contact>();
        List<Teach__c> teaches = new List<Teach__c>();
        List<Class__c> classes = new List<Class__c>();
        for(Integer i=0;i<teachCount;i++){
            Contact t = new COntact(lastName='Test '+i);
            teacher.add(t);
        }
        insert teacher;
        for(Integer i=0;i<teachCount;i++){
           Class__c c=new Class__C(Name='Class '+i,max_size__c=50,my_count__c=0);
           classes.add(c);
        }
        insert classes;
        for(Integer i=0;i<teachCount;i++){
            Teach__c teach=new Teach__c(Class__c=classes[i].id,Contact__c=teacher[i].id,Subjects__c='English;Hindi');
            teaches.add(teach);
        }
        return teaches;
    }
    
        public static List<Teach__c> updateTeachWithHindi(Integer teachCount){
        List<Contact> teacher = new List<Contact>();
        List<Teach__c> teaches = new List<Teach__c>();
        List<Class__c> classes = new List<Class__c>();
        for(Integer i=0;i<teachCount;i++){
            Contact t = new COntact(lastName='Test '+i);
            teacher.add(t);
        }
        insert teacher;
        for(Integer i=0;i<teachCount;i++){
           Class__c c=new Class__C(Name='Class '+i,max_size__c=50,my_count__c=0);
           classes.add(c);
        }
        insert classes;
        for(Integer i=0;i<teachCount;i++){
            Teach__c teach=new Teach__c(Class__c=classes[i].id,Contact__c=teacher[i].id,Subjects__c='English');
            teaches.add(teach);
        }
        insert teaches;
        for(Integer i=0;i<teachCount;i++){
            teaches[i].subjects__c='English;Hindi';
        }
        update teaches;
        return teaches;
    }
    public static List<Class__c> insertClassWithFemaleStudent(Integer count){
        List<Class__c> classes = new List<Class__c>();
        List<Student__c> students=new List<Student__c>();
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i,max_size__c=50,my_count__c=0);
           classes.add(c);
        }
        insert classes;
        for(Integer i=0;i<count;i++){
            students.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='Female',class__c=classes[i].id));
            students.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='Female',class__c=classes[i].id));
        }
        insert students;
        return classes;
    }
    public static List<Student__c> insertClassData(Integer count,Integer size){
        List<Class__c> classes = new List<Class__c>();
        List<Student__c> students=new List<Student__c>();
        List<Student__c> studentsToInsert=new List<Student__c>();
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i,max_size__c=1,my_count__c=0);
           classes.add(c);
        }
        insert classes;
        for(Integer i=0;i<count;i++){
            students.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='Female',class__c=classes[i].id));
        }
        insert students;
         for(Integer i=0;i<count;i++){
            studentsToInsert.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='Female',class__c=classes[i].id));
        }
        return studentsToInsert;
    }
    
    public static List<Opportunity> insertOpportunity(Integer count){
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Integer i=0;i<count;i++){
            opportunities.add(new Opportunity(Name='Opportunity '+i,CloseDate=Date.newInstance(2022, 10, 20),stageName='Prospecting'));
        }
        insert opportunities;
        return opportunities;
    }
    public static List<class__c> insertClassDataWithCustomStatus(Integer count){
        List<Class__c> classes=new List<Class__c>();
        List<Student__c> students=new List<Student__c>();
        for(Integer i=0;i<count;i++){
            Class__c c=new Class__C(Name='Class '+i,custom_status__c='New',max_size__c=50,my_count__c=0);
           	classes.add(c);
        }
        insert classes;
         for(Integer i=0;i<count;i++){
            students.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='Female',class__c=classes[i].id));
        }
        insert students;
        
        return classes;
    }
    public static List<Student__c> insertStudentInClass(Integer count){
        List<class__c> classes=new List<class__c>();
        List<Student__c> students=new List<Student__c>();
        for(Integer i=0;i<count;i++){
            Class__c c=new Class__C(Name='Class '+i,max_size__c=50,my_count__c=0);
           	classes.add(c);
        }
        insert classes;
        for(Integer i=0;i<count;i++){
            students.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='Female',class__c=classes[i].id));
        }
        return students;
        
    }
    
    public static List<Teach__c> createTeachNegativeData(Integer count){
        List<Contact> teacher = new List<Contact>();
        List<Teach__c> teaches = new List<Teach__c>();
        List<Class__c> classes = new List<Class__c>();
        for(Integer i=0;i<Count;i++){
            Contact t = new COntact(lastName='Test '+i);
            teacher.add(t);
        }
        insert teacher;
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i);
           classes.add(c);
        }
        insert classes;
        for(Integer i=0;i<Count;i++){
            Teach__c teach=new Teach__c(Class__c=classes[i].id,Contact__c=teacher[i].id,Subjects__c='English');
            teaches.add(teach);
        }
        return teaches;
    }
    
    public static List<Teach__c> updateTeachNegativeData(Integer count){
        List<Contact> teacher = new List<Contact>();
        List<Teach__c> teaches = new List<Teach__c>();
        List<Class__c> classes = new List<Class__c>();
        for(Integer i=0;i<Count;i++){
            Contact t = new COntact(lastName='Test '+i);
            teacher.add(t);
        }
        insert teacher;
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i);
           classes.add(c);
        }
        insert classes;
        for(Integer i=0;i<Count;i++){
            Teach__c teach=new Teach__c(Class__c=classes[i].id,Contact__c=teacher[i].id,Subjects__c='English');
            teaches.add(teach);
        }
        insert teaches;
        return teaches;
    }
        public static List<Class__c> insertClassWithOutFemaleStudent(Integer count){
        List<Class__c> classes = new List<Class__c>();
        List<Student__c> students=new List<Student__c>();
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i,max_size__c=50,my_count__c=0);
           classes.add(c);
        }
        insert classes;
        for(Integer i=0;i<count;i++){
            students.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='male',class__c=classes[i].id));
            students.add(new Student__c(Name='Student '+i,last_Name__c='Student '+i,Sex__c='male',class__c=classes[i].id));
        }
        insert students;
        return classes;
    }
}