public class MyExceptionTest123 {
    

   
    
        public class MyException extends Exception{}

        
        public void hello (){
            
             try{
             integer a;
             a=1/0;
        
             } catch (exception e){
        
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

       // String emailAddr = [select Email from User where Id = :trigger.old[0].OwnerId].Email;
        //String newOwnerName = [select Name from User where Id = :trigger.new[0].OwnerId].Name;

        String[] toAddresses = new String[] {'suresh83kumar@gmail.com'};
        mail.setToAddresses(toAddresses);

        mail.setSubject('Owner Changed for Account : ');

        mail.setPlainTextBody('Owner of Account: 1' +e);
        mail.setHtmlBody('Owner of Account: 2' + e);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        //throw new MyException('something bad happened!');
        //trigger[0].addError('------hello---------');
             
            }
            }
}