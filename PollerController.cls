/*******************************************************************
 * Custom controller for the "Turning off an Action Poller" recipe.
 * Simulates the progression of a payment through various states.
 *******************************************************************/
public with sharing class PollerController 
{
    private integer stateIdx = 0;
    
    List<string> states = new List<string>{'Connecting to Bank', 'Authorizing', 'Authorized', 'Complete'};
    
    public string PaymentState
    {
        get
        {
            return states[stateIdx];
        }            
    }
    
    public PageReference movePayment()
    {
        if(stateIdx < states.size())
        {
            stateIdx++;
        }
        return null;
    }
}