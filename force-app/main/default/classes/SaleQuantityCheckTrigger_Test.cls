@isTest
private class SaleQuantityCheckTrigger_Test {
	@testSetup
    private static void Setup(){
        Viewer__c aViewr = new Viewer__c(Name='Viewer001');
        Supplier__c aSupplier = new Supplier__c(Name='Supplier Guys');
        Streamer__c aStreamer = new Streamer__c(Name='StreamerDude');
        insert aSupplier;
        insert aViewr;
        insert aStreamer;
        Merchandise__c aMerchandise = new Merchandise__c(Name='Holy Grail of Stuff', Cost__c = 26.21, Supplier__c = aSupplier.id, Streamer__c = aStreamer.id);
        insert aMerchandise;
    } 
    @isTest
    private static void Positive(){
        Merchandise__c merch = [SELECT Name, Stock__c FROM Merchandise__c];
        Viewer__c view = [SELECT Name FROM Viewer__c];
        Sale__c sale = new Sale__c(Name='001',Merchandise__c=merch.id,Viewer__c = view.id, Quantity__c = 2);
        
        Test.startTest();
        
        insert sale;
        merch = [SELECT Name, Stock__c FROM Merchandise__c];
        System.assert(merch.Stock__c==8);
        Test.stopTest();
        
        
    }
    @isTest
    private static void Negative(){
        Merchandise__c merch = [SELECT Name, Stock__c FROM Merchandise__c];
        Viewer__c view = [SELECT Name FROM Viewer__c];
        Sale__c sale = new Sale__c(Name='001',Merchandise__c=merch.id,Viewer__c = view.id, Quantity__c = 11);
        
        Test.startTest();
        System.debug('literally doing something');
        try{
        	insert sale;
        }catch(DMLException e){
            System.debug(e.getMessage());
			 System.assert(e.getMessage().contains('to complete transaction'));
            System.assert(merch.Stock__c==10);
        }
        Test.stopTest();
    }
}