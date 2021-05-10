trigger SaleQuantityCheckTrigger on Sale__c (before insert,after insert) {
        List<Merchandise__c> merch = [SELECT Name, Stock__c, (SELECT Name FROM Sales__r) From Merchandise__c Where ID IN 
                                    (SELECT Merchandise__c From Sale__c WHERE ID IN :Trigger.new)]; // Merchandise that got updated
        List<Merchandise__c> merchToUpdate = new List<Merchandise__c>();
        
        for(List<Sale__c> sale : [SELECT Id, Name, Merchandise__r.Stock__c, Quantity__c FROM Sale__c]){
            for(Sale__c s:sale){
                if(s.Merchandise__r.Stock__c-s.Quantity__c<0){
                    s.addError('Not enough items in stock to complete transaction!');
                }else{
                    for(Merchandise__c m:merch){
                        if(m.id==s.Merchandise__r.id){
                            m.Stock__c -= s.Quantity__c;
                            merchToUpdate.add(m);
                        }
                    }
                }
            }
        }
        update merchToUpdate;
    
}