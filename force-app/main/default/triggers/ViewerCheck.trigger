trigger ViewerCheck on Stream__c (after insert) {
    List<View__c> viewsToInsert = new List<View__c>();
    for(Stream__c s:Trigger.new){
        for(Viewer__c v:[Select Name, Subscribed__c, Subscribe_Date__c From Viewer__c where Subscribe_Date__c  < :s.Date_Streamed__c AND Subscribed__c = true]){
            View__c newView = new View__c(Name = 'View', Stream__c = s.id, Viewer__c = v.id);
            viewsToInsert.add(newView);
        }
    }
    insert viewsToInsert;
}