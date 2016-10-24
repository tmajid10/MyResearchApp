public with sharing class AccountTriggerHandler 
{    
    
    public AccountTriggerHandler()
    {
       
    }
        
    public void OnBeforeInsert(Account[] newAccounts)
    {
        
    }
    
    public void OnAfterInsert(Account[] newAccounts)
    {
        
    }
    
    public void OnBeforeUpdate(Account[] oldAccounts, Account[] updatedAccounts, Map<ID, Account> accountMap)
    {
        
    }
    
    public void OnAfterUpdate(Account[] oldAccounts, Account[] updatedAccounts, Map<ID, Account> accountMap)
    {
        AttachNotesToRelatedOpportunities(updatedAccounts);
    }
       
    public void OnBeforeDelete(Account[] accountsToDelete, Map<ID, Account> accountMap)
    {
        
    }
    
    public void OnAfterDelete(Account[] deletedAccounts, Map<ID, Account> accountMap)
    {
        
    }
  
    public void OnUndelete(Account[] restoredAccounts)
    {
        
    }
    
    private void AttachNotesToRelatedOpportunities(List<Account> newAccounts)
    {
        List<Note> listNotes = new List<Note>();
        
        Set<Id> accountIds = new Set<Id>();
        
        for(Account acct : newAccounts)
        {
            accountIds.add(acct.Id);
        }
        
        List<Opportunity> opps = [Select Id, Name, accountId from Opportunity where accountId in :accountIds];
        
        system.debug('Opp Size: ' + opps.size());      
        
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, AnnualRevenue FROM Account WHERE Id IN :accountIds]);        
        
        for(Opportunity opp : opps)
        {
            Note aNote = new Note();
            if(opp.AccountId != null)
            {
                aNote.parentId = opp.Id;            
                                
                aNote.body = string.valueof(accountMap.get(opp.accountId).AnnualRevenue);                
                aNote.isPrivate = false;
                aNote.title = 'New Note';
                
                listNotes.add(aNote);
            }
        }
        
        system.debug('lst size: ' + listNotes.size());
        if(listNotes.size() > 0)
        {
            insert listNotes;
        }
        
    }
}