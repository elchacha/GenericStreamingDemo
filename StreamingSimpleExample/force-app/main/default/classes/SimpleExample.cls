public class SimpleExample {
    
    @AuraEnabled
    public static void doAction1(){
    }

    @AuraEnabled
    public static void doAction2(){
    }
    
    
    @future
    private static void simulateFutureAction(String actionType){
        ApiRestUtil.sendGenericStreamingForCurrentUser('',actionType);
    }


}