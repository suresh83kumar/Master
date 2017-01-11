public class UploadContentController {
    public ContentVersion contentToUpload {get;set;}
    Id memberId;
    public Blob fileContent {get;set;}
    public UploadContentController(ApexPages.StandardController controller) {
        memberId = controller.getId();
        contentToUpload = new ContentVersion();
    }
    public PageReference uploadContents() {
        //List<ContentWorkSpace> CWList = [SELECT Id, Name From ContentWorkspace WHERE Name = 'Member Files'];
        contentToUpload.VersionData = fileContent;
        //contentToUpload.Title = 'test';
        //contentToUpload.PathOnClient = 'test';
        contentToUpload.Origin = 'C';
        //contentToUpload.VersionData
        insert contentToUpload;
        
        contentToUpload = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :contentToUpload.Id];
        
        //ContentWorkspaceDoc cwd = new ContentWorkspaceDoc();
        //cwd.ContentDocumentId = contentToUpload.ContentDocumentId;
        //cwd.ContentWorkspaceId = CWList.get(0).Id;
        //insert cwd;
        
        PageReference pg = new PageReference('/' + contentToUpload.Id);
        pg.setRedirect(true);
        return pg;
    }
}