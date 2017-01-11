public class AccountsController {
    @AuraEnabled
    public static list<Account> getAccounts(){
        return [select Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone, BillingStreet, BillingCity, BillingState, BillingPostalCode FROM Account ORDER BY createdDate ASC];
    }

}