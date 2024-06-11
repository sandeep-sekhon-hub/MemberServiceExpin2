public class MemberServicehelper {

    public static String validateRequest(MemberReqModel memReq, String corrId){

        String errResStr;
        List<RESTErrorResponseModel.Error> errors = new List<RESTErrorResponseModel.Error>();

        if (memReq.data == null){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_DATA_MISSING, 
                                                                                  src);
            errors.add(error);
            RESTErrorResponseModel.Meta meta = new RESTErrorResponseModel.Meta(String.valueOf(RESTResponseMessages.STATUS_BAD), 
                                                                               String.valueOf(Datetime.now()), 
                                                                               corrId);
            errResStr = RESTAPIHelper.getErrorResponseJSON(errors, meta);    
            return errResStr;        
        }  

        if (memReq.data.attributes == null){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_ATTRIBUTES_MISSING, 
                                                                                  src);
            errors.add(error);
            RESTErrorResponseModel.Meta meta = new RESTErrorResponseModel.Meta(String.valueOf(RESTResponseMessages.STATUS_BAD), 
                                                                               String.valueOf(Datetime.now()), 
                                                                               corrId);
            errResStr = RESTAPIHelper.getErrorResponseJSON(errors, meta);    
            return errResStr;        
        }      

        if (memReq.data.type != 'member'){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/type');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                  src);
            errors.add(error);
        }

        if (String.isBlank(memReq.data.id)){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/id');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                  src);
            errors.add(error);
            
        } 

        if (String.isBlank(memReq.data.attributes.firstName)){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/firstName');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                  src);
            errors.add(error);
            
        }   
        
        if (String.isBlank(memReq.data.attributes.lastName)){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/lastName');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                  src);
            errors.add(error);
        }   

        if (String.isBlank(memReq.data.attributes.dateOfBirth) || !Utilities.isDateValid(memReq.data.attributes.dateOfBirth)){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/dateOfBirth');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                  src);
            errors.add(error);            
        }else{
            if (Date.valueOf(memReq.data.attributes.dateOfBirth) >= Date.today()){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/dateOfBirth');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);
                errors.add(error);            
            }
        }   

        if (String.isBlank(memReq.data.attributes.status) ||
            !Utilities.getPicklistValues('Account_Directory_Person__c', 'Status__c').contains(memReq.data.attributes.status.toUpperCase())){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/status');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                  src);
            errors.add(error);
        }        
        
        if (memReq.data.attributes.sex == 'PreferNotToSay'){
            memReq.data.attributes.sex = 'Prefer Not To Say';
        }        

        if (String.isNotBlank(memReq.data.attributes.sex) &&
            !Utilities.getPicklistValues('Account_Directory_Person__c', 'Sex__c').contains(memReq.data.attributes.sex.toUpperCase())){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/sex');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                  src);
            errors.add(error);
        }               

        if (memReq.data.attributes.contactDetails == null){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_CONTDETAIL_MISSING, 
                                                                                  src);
            errors.add(error);
        }else{
            if (String.isNotBlank(memReq.data.attributes.contactDetails.emailAddress) &&
                !Utilities.isEmailAddressValid(memReq.data.attributes.contactDetails.emailAddress)){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails/emailAddress');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);
                errors.add(error);            
            }        
            
            if (memReq.meta.source.type == 'Customer'){
                if (memReq.data.attributes.contactDetails.address == null){
                    RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails/address/');
                    RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                          RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                          RESTResponseMessages.DETAIL_ADDRESS_MISSING, 
                                                                                          src);            
                    errors.add(error);                                                                                                                                                                    
                }else{
                    if (String.isBlank(memReq.data.attributes.contactDetails.address.line1) &&
                        String.isBlank(memReq.data.attributes.contactDetails.address.line2) &&
                        String.isBlank(memReq.data.attributes.contactDetails.address.line3)){
                        RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails/address/line1');
                        RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                              RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                              RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                              src);            
                        errors.add(error);                                                                    
                    }
                    if (String.isBlank(memReq.data.attributes.contactDetails.address.postcode)){
                        RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails/address/postcode');
                        RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                              RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                              RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                              src);            
                        errors.add(error);                                                                    
                    }                    
                }     
            }
            
            if (memReq.data.attributes.contactDetails.address != null && 
                String.isNotBlank(memReq.data.attributes.contactDetails.address.postcode) && 
                !Utilities.isPostCodeValid(memReq.data.attributes.contactDetails.address.postcode)){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails/address/postcode');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);            
                errors.add(error);                                                                                                                                                                    
            }        
            
            if (memReq.data.attributes.contactDetails.telephoneNumbers != null){
                
                if (String.isNotBlank(memReq.data.attributes.contactDetails.telephoneNumbers.home) &&
                    !Utilities.isPhoneNoValid(memReq.data.attributes.contactDetails.telephoneNumbers.home)){
                    RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails/telephoneNumbers/home');
                    RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                          RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                          RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                          src);                        
                    errors.add(error);                                                                                                                                                                      
                }
            
                if (String.isNotBlank(memReq.data.attributes.contactDetails.telephoneNumbers.mobile) &&
                    !Utilities.isPhoneNoValid(memReq.data.attributes.contactDetails.telephoneNumbers.mobile)){
                    RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails/telephoneNumbers/mobile');
                    RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                          RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                          RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                          src);                        
                    errors.add(error);                                                                                                                                                                                                                                                          
                }

                if (String.isNotBlank(memReq.data.attributes.contactDetails.telephoneNumbers.other) &&
                    !Utilities.isPhoneNoValid(memReq.data.attributes.contactDetails.telephoneNumbers.other)){
                    RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/contactDetails/telephoneNumbers/other');
                    RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                          RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                          RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                          src);                        
                    errors.add(error);                                                                                                                                                                                                                                                                                                                                              
                }     

            }
        } 
        
        if (memReq.data.attributes.preferences != null && memReq.data.attributes.preferences.marketing != null){
            if (memReq.data.attributes.preferences.marketing.email != true && memReq.data.attributes.preferences.marketing.email != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/marketing/email');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);     
                errors.add(error);                                                                                                                                                                                                                                                                                                                                                                 
            }         

            if (memReq.data.attributes.preferences.marketing.post != true && memReq.data.attributes.preferences.marketing.post != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/marketing/post');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);      
                errors.add(error);                                                                                                                                                                                                                                                                                                                                                                
            }                 

            if (memReq.data.attributes.preferences.marketing.telephone != true && memReq.data.attributes.preferences.marketing.telephone != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/marketing/telephone');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);    
                errors.add(error);                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
            }        
            
            if (memReq.data.attributes.preferences.marketing.text != true && memReq.data.attributes.preferences.marketing.text != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/marketing/text');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);                        
                errors.add(error);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
            }        

        }

        if (memReq.data.attributes.preferences != null && memReq.data.attributes.preferences.servicing != null){
            if (memReq.data.attributes.preferences.servicing.email != true && memReq.data.attributes.preferences.servicing.email != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/servicing/email');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);                        
                errors.add(error);                                                                                                                                                                                                                                                                
            }        

            if (memReq.data.attributes.preferences.servicing.post != true && memReq.data.attributes.preferences.servicing.post != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/servicing/post');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);                        
                errors.add(error);                                                                                                                                                                        
            }        
            
            if (memReq.data.attributes.preferences.servicing.telephone != true && memReq.data.attributes.preferences.servicing.telephone != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/servicing/telephone');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);
                errors.add(error);                                                                                                        
            }        

            if (memReq.data.attributes.preferences.servicing.text != true && memReq.data.attributes.preferences.servicing.text != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/servicing/text');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);                        
                errors.add(error);                                                                                
            }

            if (memReq.data.attributes.preferences.servicing.online != true && memReq.data.attributes.preferences.servicing.online != false){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/data/attributes/preferences/servicing/online');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);                        
                errors.add(error);                                                                                                                                                                                                                                                                                                                                          
                } 
        }

        if (memReq.meta == null || memReq.meta.source == null){
            RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/meta/');
            RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                  RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                  RESTResponseMessages.DETAIL_META_MISSING, 
                                                                                  src);
            errors.add(error);
        }else{
            if (String.isBlank(memReq.meta.source.type) ||
                !Utilities.getPicklistValues('Account_Directory_Person__c', 'Ski_Entity__c').contains(memReq.meta.source.type.toUpperCase())){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/meta/source/type');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);                        
                errors.add(error);                                                                                                                                                                                                                                                                                                                                          
            }
            
            if (String.isBlank(memReq.meta.source.sourceSys) ||
                !Utilities.getPicklistValues('Account_Directory_Person__c', 'External_System__c').contains(memReq.meta.source.sourceSys.toUpperCase())){
                RESTErrorResponseModel.Source src = new RESTErrorResponseModel.Source('/meta/source/system');
                RESTErrorResponseModel.Error error = new RESTErrorResponseModel.Error(RESTResponseMessages.CODE_VALIDATION_ERROR, 
                                                                                      RESTResponseMessages.TITLE_REQUEST_NOT_VALID,
                                                                                      RESTResponseMessages.DETAIL_FIELD_NOT_VALID, 
                                                                                      src);    
                errors.add(error);                                                                                                                                                                                                                                                                                                                                                              
            }  
        }                  

        if(errors.size()>0){
            RESTErrorResponseModel.Meta meta = new RESTErrorResponseModel.Meta(String.valueOf(RESTResponseMessages.STATUS_BAD), 
                                                                               String.valueOf(Datetime.now()), 
                                                                               corrId);
            errResStr = RESTAPIHelper.getErrorResponseJSON(errors, meta);
        }

        return errResStr;
    }

    public static Account_Directory_Person__c setAccDirPerDetails(MemberReqModel memReq){
        
        Account_Directory_Person__c accDirPer = new Account_Directory_Person__c();
        
        if (memReq.data.attributes.title != null){
            accDirPer.Salutation__c = memReq.data.attributes.title;
        }
        if (memReq.data.attributes.nickname != null ){
            accDirPer.Known_As__c = memReq.data.attributes.nickname;
        }
        accDirPer.First_Name__c = memReq.data.attributes.firstName;
        accDirPer.Last_Name__c = memReq.data.attributes.lastName;
        accDirPer.Date_of_Birth__c = Date.valueOf(memReq.data.attributes.dateOfBirth);
        accDirPer.Status__c = memReq.data.attributes.status;
        accDirPer.Sex__c = memReq.data.attributes.sex;
        accDirPer.Email__c = memReq.data.attributes.contactDetails.emailAddress;

        if (memReq.data.attributes.contactDetails.address != null){
            accDirPer.Address_Line_1__c = memReq.data.attributes.contactDetails.address.line1;
        
            if (String.isNotBlank(memReq.data.attributes.contactDetails.address.line2)){
                accDirPer.Address_Line_1__c += ', ' + memReq.data.attributes.contactDetails.address.line2;  
            }
            
            if (String.isNotBlank(memReq.data.attributes.contactDetails.address.line3)){
                accDirPer.Address_Line_1__c += ', ' + memReq.data.attributes.contactDetails.address.line3;  
            }        
            accDirPer.City__c = memReq.data.attributes.contactDetails.address.town;
            accDirPer.Post_Code__c = memReq.data.attributes.contactDetails.address.postcode;
            accDirPer.State__c = memReq.data.attributes.contactDetails.address.county;
            accDirPer.Country__c = memReq.data.attributes.contactDetails.address.country;
        }

        if (memReq.data.attributes.contactDetails.telephoneNumbers != null){
            accDirPer.Phone_Number__c = memReq.data.attributes.contactDetails.telephoneNumbers.home;
            accDirPer.Mobile_Phone_Number__c = memReq.data.attributes.contactDetails.telephoneNumbers.mobile;
            accDirPer.Other_Phone_Number__c = memReq.data.attributes.contactDetails.telephoneNumbers.other;            
        }

        if (memReq.data.attributes.preferences != null ){
            if (memReq.data.attributes.preferences.marketing != null){
                accDirPer.Mkt_Pref_Confirm_Date__c = Date.today();
                accDirPer.Mkt_Pref_Confirmed_In_System__c = memReq.meta.source.sourceSys;
                if (memReq.data.attributes.preferences.marketing.email){
                    accDirPer.Mkt_Pref_Email__c = 'Yes';
                }else{
                    accDirPer.Mkt_Pref_Email__c = 'No';
                }
                
                if (memReq.data.attributes.preferences.marketing.post){
                    accDirPer.Mkt_Pref_Post__c = 'Yes';
                }else{
                    accDirPer.Mkt_Pref_Post__c = 'No';
                }
                
                if (memReq.data.attributes.preferences.marketing.telephone){
                    accDirPer.Mkt_Pref_Phone__c = 'Yes';
                }else{
                    accDirPer.Mkt_Pref_Phone__c = 'No';
                }
                
                if (memReq.data.attributes.preferences.marketing.text){
                    accDirPer.Mkt_Pref_Sms__c = 'Yes';
                }else{
                    accDirPer.Mkt_Pref_Sms__c = 'No';
                }
            }
    
            if (memReq.data.attributes.preferences.servicing != null){
                accDirPer.Srv_Pref_Confirm_Date__c = Date.today();
                accDirPer.Srv_Pref_Confirmed_In_System__c = memReq.meta.source.sourceSys;            
                if (memReq.data.attributes.preferences.servicing.email){
                    accDirPer.Srv_Pref_Email__c = 'Yes';
                }else{
                    accDirPer.Srv_Pref_Email__c = 'No';
                }
                
                if (memReq.data.attributes.preferences.servicing.post){
                    accDirPer.Srv_Pref_Post__c = 'Yes';
                }else{
                    accDirPer.Srv_Pref_Post__c = 'No';
                }
                
                if (memReq.data.attributes.preferences.servicing.telephone){
                    accDirPer.Srv_Pref_Phone__c = 'Yes';
                }else{
                    accDirPer.Srv_Pref_Phone__c = 'No';
                }
        
                if (memReq.data.attributes.preferences.servicing.text){
                    accDirPer.Srv_Pref_Sms__c = 'Yes';
                }else{
                    accDirPer.Srv_Pref_Sms__c = 'No';
                }
        
                if (memReq.data.attributes.preferences.servicing.online){
                     accDirPer.Srv_Pref_Online__c = 'Yes';
                }else{
                    accDirPer.Srv_Pref_Online__c = 'No';
                }
            }
        }

        accDirPer.External_System__c = memReq.meta.source.sourceSys;
        accDirPer.Ski_Entity__c = memReq.meta.source.type;

        if (accDirPer.External_System__c == 'Ski'){
            if (accDirPer.Ski_Entity__c == 'Person'){
                accDirPer.External_System_Id__c = 'SP_' + memReq.data.id;
            }else if (accDirPer.Ski_Entity__c == 'Customer'){
                accDirPer.External_System_Id__c = 'SC_' + memReq.data.id;
            }

        }

        return accDirPer;

    }
    
}