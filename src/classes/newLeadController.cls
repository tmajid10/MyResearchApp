public class newLeadController
{
    private string firstName;
    private string lastName;
    private string company;
    private string email;
    private string qp;
    
    public newLeadController()
    {
        qp = ApexPages.currentPage().getParameters().get('qp');        
    }
    
    public string getFirstName()
    {
        return firstName;
    }
    
    public void setFirstName(string fn)
    {
        firstName = fn;
    }
    
    public string getLastName()
    {
        return lastName;
    }
    
    public void setLastName(string ln)
    {
        lastName = ln;
    }
    
    public string getCompany()
    {
        return company;
    }
    
    public void setCompany(string com)
    {
        company = com;
    }
    
    public string getEmail()
    {
        return email;
    }
    
    public void setEmail(string em)
    {
        email = em;
    }
    
    public pageReference save()
    {
        pageReference p = null;
        
        if((qp == null) || (!'yyyy'.equals(qp)))
        {
            p = page.Failure;
            p.getParameters().put('error', 'noParams');
        }
        else
        {
             try
             {
                 Lead l = new Lead(FirstName = firstName, LastName = lastName, Company = company, Email = email);
                 insert l;
             }
             catch(Exception ex)
             {
                 p = page.Failure;
                 p.getParameters().put('error', 'noParams');
             }   
        }
        
        if(p == null)
        {
            p = Page.Success;
        }
        
        p.setRedirect(true);
        return p;
    }
}