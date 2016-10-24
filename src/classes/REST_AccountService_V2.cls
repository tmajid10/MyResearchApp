/****************************************************************************************************
 * Description - Sample Apex REST service with GET method
 * Author - Tarique Majid
 ****************************************************************************************************/

@RestResource(urlMapping='/v2/accounts/*')
global with sharing class REST_AccountService_V2
{
    @HttpGet
    global static AccountWrapper doGet()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        AccountWrapper response = new AccountWrapper();
        
        string accountNum = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        List<Account> result = [Select Id, Name, Phone, Website, BillingState, BillingCountry From Account Where AccountNumber = :accountNum];
        
        if(result != null && result.size() > 0)
        {
            response.acct = result[0];
            response.status = 'Success';
        }
        else
        {
            response.acct = null;
            response.status = 'Error';
            response.message = 'This account could not be found. Please try again.';
            //res.StatusCode = 404;
        }
        
        return response;
    }
    
    global class AccountWrapper
    {
        public Account acct;
        public string status;
        public string message;
        
        public AccountWrapper()
        {
        
        }
    }
}