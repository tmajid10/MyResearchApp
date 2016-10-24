trigger AccountTrigger on Account (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) 
{
    AccountTriggerHandler handler = new AccountTriggerHandler();
    
    if(Trigger.isInsert && Trigger.isBefore)
    {
        handler.OnBeforeInsert(Trigger.new);
    }
    else if(Trigger.isInsert && Trigger.isAfter)
    {
        handler.OnAfterInsert(Trigger.new);
    }
    
    else if(Trigger.isUpdate && Trigger.isBefore)
    {
        handler.OnBeforeUpdate(Trigger.old, Trigger.new, Trigger.newMap);
    }
    else if(Trigger.isUpdate && Trigger.isAfter)
    {
        handler.OnAfterUpdate(Trigger.old, Trigger.new, Trigger.newMap);
    }
    
    else if(Trigger.isDelete && Trigger.isBefore)
    {
        handler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
    }
    else if(Trigger.isDelete && Trigger.isAfter)
    {
        handler.OnAfterDelete(Trigger.old, Trigger.oldMap);
    }
    
    else if(Trigger.isUnDelete)
    {
        handler.OnUndelete(Trigger.new);    
    }
}