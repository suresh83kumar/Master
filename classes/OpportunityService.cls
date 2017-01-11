public class OpportunityService
{
  	private static List<Schema.SObjectType> MY_SOBJECTS =new Schema.SObjectType[] {Opportunity.SObjectType, OpportunityLineItem.SObjectType};
    public static void applyDiscounts(Set<ID> opportunityIds, Decimal discountPercentage)
    {
        if(opportunityIds==null || opportunityIds.size()==0)
            throw new OpportunityServiceException('Opportunities not specified.');
        if(discountPercentage<0 || discountPercentage>100)
            throw new OpportunityServiceException('Invalid discount to apply.');

        // Query Opportunities and Lines
        List<Opportunity> opportunities = [select Id from Opportunity where id in:opportunityIds];
        
        SObjectUnitOfWork sou = new SObjectUnitOfWork(MY_SOBJECTS);
        SObjectUnitOfWork uow = new SObjectUnitOfWork(new Schema.SObjectType[] {Account.SObjectType});
        sou.registerDirty(opportunities[0]);
        sou.commitWork();

        // Update Opportunities and Lines (if present)
        /*List<Opportunity> oppsToUpdate = ....
        List<OpportunityLineItem> oppLinesToUpdate = ....
        for(Opportunity : opportunities)
        {
            // Apply to Opportunity Amount or Product Lines?
            // ...
        }

        // Update the database
       Savepoint sp = Database.setSavePoint();
        try
        {
            //update oppLinesToUpdate;
            update opportunities ;
        }
        catch (Exception e)
        {
            // Rollback
            Database.rollback(sp);
            // Throw exception on to caller
            throw new OpportunityServiceException('DML Issueeeeeeeeeeeeeeeee');
        }*/
    }

    public class OpportunityServiceException extends Exception
    {
        // Add members and methods here to communicate data
        // relating to exceptions
    }
    
    
}