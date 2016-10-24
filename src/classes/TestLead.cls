@isTest
public class TestLead
{
    public static testMethod void newLeadTest()
    {
        PageReference pageRef = page.CreateNewLead;
        Test.setCurrentPage(pageRef);
        
        newLeadController cont = new newLeadController();
        string nextPage = cont.save().getUrl();
        
        system.assertEquals('/apex/softech__failure?error=noParams', nextPage);
        
        ApexPages.currentPage().getParameters().put('qp', 'yyyy');
        
        cont = new newLeadController();
        cont.setFirstName('Jim');
        cont.setLastName('Taylor');
        cont.setCompany('Jim Corp');
        cont.setEmail('jim@test.com');
        
        nextPage = cont.save().getUrl();
        system.assertEquals('/apex/softech__success', nextPage);
        
        Lead lead = [select id, email from Lead where company = 'Jim Corp' limit 1];
        system.assertEquals('jim@test.com', lead.email);
    }
}