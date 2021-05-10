@isTest
private class UsernameCheckTrigger_Test {
	@isTest
    private static void UserCheckTest(){
        List<Viewer__c> aViewr = new List<Viewer__c>(); 
        aViewr.add(new Viewer__c(Name='Viewer001'));
        aViewr.add(new Viewer__c(Name='holisticViewer002'));
        aViewr.add(new Viewer__c(Name='Viewer003'));
        Test.startTest();
        insert aViewr;
        Test.stopTest();
    }
    @isTest
    private static void UserCheckTestFail(){
        List<Viewer__c> aViewr = new List<Viewer__c>(); 
        aViewr.add(new Viewer__c(Name='WholisticViewer001'));
        aViewr.add(new Viewer__c(Name='holisticViewer002'));
        aViewr.add(new Viewer__c(Name='Viewer003'));
        Test.startTest();
        try{
            insert aViewr;
        }catch(DMLException e){
            System.debug(e.getMessage());
			 System.assert(e.getMessage().contains('profanity'));
        }
        
       	Test.stopTest();
    }
}