public class ApiRestUtil {
    
    public static void sendGenericStreaming(String channelName,String msg){
        sendGenericStreaming(channelName,msg,null);
    }

    public static void sendGenericStreamingForCurrentUser(String channelName,String msg){
        sendGenericStreaming(channelName,msg,new Set<String>{UserInfo.getUserId()});
    }

    public static void sendGenericStreaming(String channelName,String msg,Set<String> userIds){
        String jsonUsersIds = '';
        Id idChannel = [SELECT Id, Name, Description, IsDynamic FROM StreamingChannel where Name=:channelName][0].Id;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        request.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v51.0/sobjects/StreamingChannel/'+idChannel+'/push');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        if(userIds!=null&&userIds.size()>0)jsonUsersIds='"'+String.join(new List<String>(userIds), '","')+'"';
        request.setBody('{"pushEvents": [{ "payload": "'+msg+'", "userIds": ['+jsonUsersIds+'] }]}');
        
        
        HttpResponse response = http.send(request);
        // error should manage starting from here
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        }
    }

}