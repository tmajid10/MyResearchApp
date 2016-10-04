/****************************************************************************************************
 * Description - Sample Apex REST service with GET method
 * Author - Tarique Majid
 ****************************************************************************************************/

@RestResource(urlMapping='/v1/accounts/*')
global with sharing class REST_AccountService_V1
{
    @HttpGet
    global static Account doGet()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        string accountNum = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        Account result = [Select Id, Name, Phone, Website, BillingState From Account Where AccountNumber = :accountNum];
        
        return result;
    }
}