trigger UsernameCheckTrigger on Viewer__c (before insert) {
    for(Viewer__c v : Trigger.New){
        	System.debug('Running '+v.name);
            if(!UsernameCheck.checker(v.Name)){
                v.addError('Username contains profanity!');
                System.debug('Hey');
            }
    }
}