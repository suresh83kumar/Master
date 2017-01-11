public class CustomMetaData {
    

	/**
	 * Insert the given Custom Metadata records into the orgs config
	 **/
	public static void createMetadata(List<SObject> records) {
		// Call Metadata API and handle response
		MetadataService.MetadataPort service = createService();
		List<MetadataService.SaveResult> results = 
			service.createMetadata(new List<MetadataService.Metadata> { toCustomMetadata(records[0]) });
		handleSaveResults(results[0]);
	}

	/**
	 * Update the given Custom Metadata records in the orgs config
	 **/
	public static void updateMetadata(List<SObject> records) {
		// Call Metadata API and handle response
		MetadataService.MetadataPort service = createService();
		List<MetadataService.SaveResult> results = 
			service.updateMetadata(new List<MetadataService.Metadata> { toCustomMetadata(records[0]) });
		handleSaveResults(results[0]);
	}

	/**
	 * Delete the given Custom Metadata records from the orgs config
	 **/
	public static void deleteMetadata(SObjectType qualifiedMetadataType, List<String> customMetadataFullNames) {
		MetadataService.MetadataPort service = createService();
		List<String> qualifiedFullNames = new List<String>();
		for(String customMetadataFullName : customMetadataFullNames)
			qualifiedFullNames.add(qualifiedMetadataType.getDescribe().getName() + '.' + customMetadataFullName);
		List<MetadataService.DeleteResult> results = 
			service.deleteMetadata('CustomMetadata', qualifiedFullNames);
		handleDeleteResults(results[0]);
	}

	public class CustomMetadataServiceException extends Exception {}

	/**
	 * Takes the SObject instance of the Custom Metadata Type and translates to a Metadata API Custmo Metadata Type
	 **/
	private static MetadataService.CustomMetadata toCustomMetadata(SObject customMetadataRecord) {
		MetadataService.CustomMetadata cm = new MetadataService.CustomMetadata();
		cm.values = new List<MetadataService.CustomMetadataValue>();
		SObjectType recordType = customMetadataRecord.getSObjectType();
		cm.fullName = recordType.getDescribe().getName().replace('__mdt', '') + '.' + customMetadataRecord.get('DeveloperName');
		cm.label = (String) customMetadataRecord.get('Label');
		for(SObjectField sObjectField : recordType.getDescribe().fields.getMap().values()) {
			DescribeFieldResult dsr = sObjectField.getDescribe();
			if(!dsr.isCustom())
				continue;
			Object fieldValue = customMetadataRecord.get(sObjectField);
			if(fieldValue == null)
				continue;
			MetadataService.CustomMetadataValue cmdv = new MetadataService.CustomMetadataValue();
			cmdv.field = dsr.getName();
			cmdv.value = fieldValue+''; // TODO: More work here, type conversion
			cm.values.add(cmdv);
		}
		return cm;
	}

	/** 
	 * Connect to the Metadata API 
	 **/
	private static MetadataService.MetadataPort createService()
	{ 
		MetadataService.MetadataPort service = new MetadataService.MetadataPort();
		service.SessionHeader = new MetadataService.SessionHeader_element();
		service.SessionHeader.sessionId = UserInfo.getSessionId();
		return service;		
	}

	/**
	 * Example helper method to interpret a SaveResult, throws an exception if errors are found
	 **/
	private static void handleSaveResults(MetadataService.SaveResult saveResult)
	{
		// Nothing to see?
		if(saveResult==null || saveResult.success)
			return;
		// Construct error message and throw an exception
		if(saveResult.errors!=null) 
		{
			List<String> messages = new List<String>();
			messages.add(
				(saveResult.errors.size()==1 ? 'Error ' : 'Errors ') + 
					'occured processing component ' + saveResult.fullName + '.');
			for(MetadataService.Error error : saveResult.errors)
				messages.add(
					error.message + ' (' + error.statusCode + ').' + 
					( error.fields!=null && error.fields.size()>0 ? 
						' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
			if(messages.size()>0)
				throw new CustomMetadataServiceException(String.join(messages, ' '));
		}
		if(!saveResult.success)
			throw new CustomMetadataServiceException('Request failed with no specified error.');
	}	

	/**
	 * Example helper method to interpret a SaveResult, throws an exception if errors are found
	 **/
	private static void handleDeleteResults(MetadataService.DeleteResult deleteResult)
	{
		// Nothing to see?
		if(deleteResult==null || deleteResult.success)
			return;
		// Construct error message and throw an exception
		if(deleteResult.errors!=null)
		{
			List<String> messages = new List<String>();
			messages.add(
				(deleteResult.errors.size()==1 ? 'Error ' : 'Errors ') + 
					'occured processing component ' + deleteResult.fullName + '.');
			for(MetadataService.Error error : deleteResult.errors)
				messages.add(
					error.message + ' (' + error.statusCode + ').' + 
					( error.fields!=null && error.fields.size()>0 ? 
						' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
			if(messages.size()>0)
				throw new CustomMetadataServiceException(String.join(messages, ' '));
		}
		if(!deleteResult.success)
			throw new CustomMetadataServiceException('Request failed with no specified error.');		
	}	
}