global class JavascriptRemoting {
    
    public string accountName {get; set;}
    public static Account acc {get; set;}
    public JavascriptRemoting () {
        
    }
    
    @RemoteAction
    global static Account acc(string accountName){
        acc=[select Id,Name,Phone, Type, NumberofEmployees from Account where Name=: accountName];
        return acc;
    }
}