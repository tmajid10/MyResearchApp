public class ContactController
{
    public List<Contact> Contacts { get; set; }        
      
    public ContactController()
    {
        Contacts = [Select Name, Phone, Email from Contact limit 10];
    }
    
    public void save()
    {
        update Contacts;
    }
}