@isTest
private class ViewerCheck_Test {
    @testSetup
    private static void Setup(){
        Streamer__c aStreamer = new Streamer__c(Name='StreamerDude');
        insert aStreamer;
        
        Date myDate = date.newInstance(2021, 5, 1);
        Date myDate2 = date.newInstance(2021, 6, 14);
        List<Viewer__c> aViewr = new List<Viewer__c>(); 
        aViewr.add(new Viewer__c(Name='Viewer001',Subscribed__c=true,Subscribe_Date__c=myDate));
        aViewr.add(new Viewer__c(Name='Viewer002',Subscribed__c=false,Subscribe_Date__c=myDate));
        aViewr.add(new Viewer__c(Name='Viewer003',Subscribed__c=true,Subscribe_Date__c=myDate2));
        aViewr.add(new Viewer__c(Name='Viewer004',Subscribed__c=false,Subscribe_Date__c=myDate2));
        insert aViewr;
    }
    @isTest
    private static void ViewerCheck_Test(){
        Streamer__c aStreamer = [SELECT Name from Streamer__c];
        Stream__c aStream = new Stream__c(Name='6/1/21',Streamer_del__c = aStreamer.ID,Date_Streamed__c=Date.today());
        insert aStream;
       
 		Test.startTest();
        List<View__c> views = [Select Name From View__c];
        System.assertEquals(1,views.size());
     	Test.stopTest();
    }
}