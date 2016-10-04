public class AnimalsCallout
{
    public static HttpResponse makeGetCallout()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200)
        {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) 
            {
                System.debug(animal);
            }
        }
        
        return response;
    }
    
    public static HttpResponse makePostCallout()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 201)
        {
            system.debug(response.getBody());
        }
        else
        {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        }
        
        return response;
    }
}