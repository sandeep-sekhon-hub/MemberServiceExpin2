@isTest
public class RESTMemberService_Test {

    @isTest
    static void testUpsertPersonSucess(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{'+
                                '  "data": {'+
                                '    "type": "member",'+
                                '    "id": "12345",'+
                                '    "attributes": {'+
                                '      "title": "Mr",'+
                                '      "firstName": "Ski",'+
                                '      "lastName": "Test",'+
                                '      "dateOfBirth": "2022-04-11",'+
                                '      "nickname": "Ski",'+
                                '      "sex": "PREFERNOTTOSAY",'+
                                '      "status": "ACTIVE",'+
                                '      "contactDetails": {'+
                                '        "emailAddress": "test\'1@test.com",'+
                                '        "address": {'+
                                '          "line1": "1 Ski Street",'+
                                '          "line2": "Ski Road",'+
                                '          "line3": "Ski",'+
                                '          "town": "Ski Town",'+
                                '          "county": "Ski",'+
                                '          "postcode": "SP10 1DE",'+
                                '          "country": "UK"'+
                                '        },'+
                                '        "telephoneNumbers": {'+
                                '          "home": "123456789",'+
                                '          "mobile": "987654321",'+
                                '          "other": ""'+
                                '        }'+
                                '      },'+
                                '      "preferences": {'+
                                '        "marketing": {'+
                                '          "email": true,'+
                                '          "post": true,'+
                                '          "telephone": true,'+
                                '          "text": true'+
                                '        },'+
                                '        "servicing": {'+
                                '          "email": true,'+
                                '          "post": true,'+
                                '          "telephone": true,'+
                                '          "text": true,'+
                                '          "online": true'+
                                '        }'+
                                '      }'+
                                '    }'+
                                '  },'+
                                '  "meta": {'+
                                '    "source": {'+
                                '      "system": "Ski",'+
                                '      "type": "PERSON"'+
                                '    }'+
                                '  }'+
                                '}';            
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response = res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_NO_CONTENT, RestContext.response.statusCode);
    }

    @isTest
    static void testUpsertCustomerSucess(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{'+
                                '  "data": {'+
                                '    "type": "member",'+
                                '    "id": "12345",'+
                                '    "attributes": {'+
                                '      "title": "Mr",'+
                                '      "firstName": "Ski",'+
                                '      "lastName": "Test",'+
                                '      "dateOfBirth": "2022-04-11",'+
                                '      "nickname": "Ski",'+
                                '      "status": "ACTIVE",'+
                                '      "contactDetails": {'+
                                '        "emailAddress": "test@test.com",'+
                                '        "address": {'+
                                '          "line1": "1 Ski Street",'+
                                '          "line2": "Ski Road",'+
                                '          "line3": "",'+
                                '          "town": "Ski Town",'+
                                '          "county": "Ski",'+
                                '          "postcode": "SP10 1DE",'+
                                '          "country": "UK"'+
                                '        },'+
                                '        "telephoneNumbers": {'+
                                '          "home": "123456789",'+
                                '          "mobile": "987654321",'+
                                '          "other": ""'+
                                '        }'+
                                '      },'+
                                '      "preferences": {'+
                                '        "marketing": {'+
                                '          "email":false,'+
                                '          "post": false,'+
                                '          "telephone": false,'+
                                '          "text": false'+
                                '        },'+
                                '        "servicing": {'+
                                '          "email": false,'+
                                '          "post": false,'+
                                '          "telephone": false,'+
                                '          "text": false,'+
                                '          "online": false'+
                                '        }'+
                                '      }'+
                                '    }'+
                                '  },'+
                                '  "meta": {'+
                                '    "source": {'+
                                '      "system": "Ski",'+
                                '      "type": "Customer"'+
                                '    }'+
                                '  }'+
                                '}';            
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response= res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_NO_CONTENT, RestContext.response.statusCode);        
    }    
    
    @isTest
    static void testUpsertMemberFailure(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{'+
                                '  "data": {'+
                                '    "type": "mem",'+
                                '    "id": "",'+
                                '    "attributes": {'+
                                '      "title": "",'+
                                '      "firstName": "",'+
                                '      "lastName": "",'+
                                '      "dateOfBirth": "2022-15-99",'+
                                '      "nickname": "",'+
                                '      "sex": "NA",'+                                
                                '      "status": "ACTIV",'+
                                '      "contactDetails": {'+
                                '        "emailAddress": "www.test.com",'+
                                '        "address": {'+
                                '          "line1": "1 Ski Street",'+
                                '          "line2": "Ski Road",'+
                                '          "line3": "",'+
                                '          "town": "Ski Town",'+
                                '          "county": "Ski",'+
                                '          "postcode": "SP10#1DE",'+
                                '          "country": "UK"'+
                                '        },'+
                                '        "telephoneNumbers": {'+
                                '          "home": "123456789 Call Ext 123",'+
                                '          "mobile": "mobile:7876 54321",'+
                                '          "other": "Home"'+
                                '        }'+
                                '      },'+
                                '      "preferences": {'+
                                '        "marketing": {'+
                                '          "email": null,'+
                                '          "post": null,'+
                                '          "telephone": null,'+
                                '          "text": null'+
                                '        },'+
                                '        "servicing": {'+
                                '          "email":null,'+
                                '          "post": null,'+
                                '          "telephone": null,'+
                                '          "text": null,'+
                                '          "online": null'+
                                '        }'+
                                '      }'+
                                '    }'+
                                '  },'+
                                '  "meta": {'+
                                '    "source": {'+
                                '      "system": "SkiSystem",'+
                                '      "type": "Dependant"'+
                                '    }'+
                                '  }'+
                                '}';            
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response= res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_BAD, RestContext.response.statusCode);       
    }
    
    @isTest
    static void testUpsertMemberException(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{'+
                                '  "data": {'+
                                '    "type": "mem",'+
                                '    "id": "",'+
                                '    "attributes": {'+
                                '      "title": "",'+
                                '      "firstName": "",'+
                                '      "lastName": "",'+
                                '      "dateOfBirth": "2099-15-09",'+
                                '      "nickname": "",'+
                                '      "status": "ACTIV",'+
                                '      "contactDetails": {'+
                                '        "emailAddress": "test@test.com",'+
                                '        "address": {'+
                                '          "line1": "1 Ski Street",'+
                                '          "line2": "Ski Road",'+
                                '          "line3": "",'+
                                '          "town": "Ski Town",'+
                                '          "county": "Ski",'+
                                '          "postcode": "SP10#1DE",'+
                                '          "country": "UK"'+
                                '        },'+
                                '        "telephoneNumbers": {'+
                                '          "home": "123456789 Ext 123",'+
                                '          "mobile": "9876 54321",'+
                                '          "other": ""'+
                                '        }'+
                                '      },'+
                                '      "preferences": {'+
                                '        "marketing": {'+
                                '          "email": No,'+
                                '          "post": No,'+
                                '          "telephone": No,'+
                                '          "text": No'+
                                '        },'+
                                '        "servicing": {'+
                                '          "email": false,'+
                                '          "post": false,'+
                                '          "telephone": false,'+
                                '          "text": false,'+
                                '          "online": false'+
                                '        }'+
                                '      }'+
                                '    }'+
                                '  },'+
                                '  "meta": {'+
                                '    "source": {'+
                                '      "system": "Ski",'+
                                '      "type": "PERSON"'+
                                '    }'+
                                '  }'+
                                '}';            
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response= res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_BAD, RestContext.response.statusCode);       
    }    

    @isTest
    static void testEmptyJSON(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{}';
     
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response= res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_BAD, RestContext.response.statusCode);   
        System.assert(RestContext.response.responseBody.toString().contains(RESTResponseMessages.DETAIL_DATA_MISSING));    
    }
    
    @isTest
    static void testNoJSON(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr = '';
     
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response= res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(400, RestContext.response.statusCode);       
    }    

    @isTest
    static void testMissingAttributes(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{'+
                                '  "data": {'+
                                '    "type": "mem",'+
                                '    "id": ""'+
                                '  }'+
                                '}';            
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response= res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_BAD, RestContext.response.statusCode);       
        System.assert(RestContext.response.responseBody.toString().contains(RESTResponseMessages.DETAIL_ATTRIBUTES_MISSING));
    }   

    @isTest
    static void testMissingMany(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{'+
                                '  "data": {'+
                                '    "type": "member",'+
                                '    "id": "12345",'+
                                '    "attributes": {'+
                                '      "title": "Mr",'+
                                '      "firstName": "Ski",'+
                                '      "lastName": "Test",'+
                                '      "dateOfBirth": "2199-04-11",'+
                                '      "nickname": "Ski",'+
                                '      "sex": "Male",'+
                                '      "status": "ACTIVE",'+
                                '        "telephoneNumbers": {'+
                                '          "home": "123456789",'+
                                '          "mobile": "987654321",'+
                                '          "other": ""'+
                                '        }'+
                                '      },'+
                                '      "preferences": {'+
                                '        "marketing": {'+
                                '          "email": true,'+
                                '          "post": true,'+
                                '          "telephone": true,'+
                                '          "text": true'+
                                '        },'+
                                '        "servicing": {'+
                                '          "email": true,'+
                                '          "post": true,'+
                                '          "telephone": true,'+
                                '          "text": true,'+
                                '          "online": true'+
                                '        }'+
                                '      }'+
                                '    }'+
                                '  }'+
                                '}';            
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response = res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_BAD, RestContext.response.statusCode);
        System.assert(RestContext.response.responseBody.toString().contains(RESTResponseMessages.DETAIL_CONTDETAIL_MISSING));
        System.assert(RestContext.response.responseBody.toString().contains(RESTResponseMessages.DETAIL_META_MISSING));
    }    

    @isTest
    static void testMissingAddress(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{'+
                                '  "data": {'+
                                '    "type": "member",'+
                                '    "id": "12345",'+
                                '    "attributes": {'+
                                '      "title": "Mr",'+
                                '      "firstName": "Ski",'+
                                '      "lastName": "Test",'+
                                '      "dateOfBirth": "2022-04-11",'+
                                '      "nickname": "Ski",'+
                                '      "status": "ACTIVE",'+
                                '      "contactDetails": {'+
                                '        "emailAddress": "test@test.com",'+
                                '        "telephoneNumbers": {'+
                                '          "home": "123456789",'+
                                '          "mobile": "987654321",'+
                                '          "other": ""'+
                                '        }'+
                                '      },'+
                                '      "preferences": {'+
                                '        "marketing": {'+
                                '          "email":false,'+
                                '          "post": false,'+
                                '          "telephone": false,'+
                                '          "text": false'+
                                '        },'+
                                '        "servicing": {'+
                                '          "email": false,'+
                                '          "post": false,'+
                                '          "telephone": false,'+
                                '          "text": false,'+
                                '          "online": false'+
                                '        }'+
                                '      }'+
                                '    }'+
                                '  },'+
                                '  "meta": {'+
                                '    "source": {'+
                                '      "system": "Ski",'+
                                '      "type": "Customer"'+
                                '    }'+
                                '  }'+
                                '}';            
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response= res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_BAD, RestContext.response.statusCode);    
        System.assert(RestContext.response.responseBody.toString().contains(RESTResponseMessages.DETAIL_ADDRESS_MISSING));            
    }   

    @isTest
    static void customerAddressCheck(){

        Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse(); 
            req.requestURI = '/services/apexrest/members';  
            req.httpMethod = 'POST';  
            String jsonStr =    '{'+
                                '  "data": {'+
                                '    "type": "member",'+
                                '    "id": "12345",'+
                                '    "attributes": {'+
                                '      "title": "Mr",'+
                                '      "firstName": "Ski",'+
                                '      "lastName": "Test",'+
                                '      "dateOfBirth": "2022-04-11",'+
                                '      "nickname": "Ski",'+
                                '      "status": "ACTIVE",'+
                                '      "contactDetails": {'+
                                '        "emailAddress": "test@test.com",'+
                                '        "address": {'+
                                '          "line1": "",'+
                                '          "line2": null,'+
                                '          "town": "Ski Town",'+
                                '          "county": "Ski",'+
                                '          "country": "UK"'+
                                '        },'+
                                '        "telephoneNumbers": {'+
                                '          "home": "123456789",'+
                                '          "mobile": "987654321",'+
                                '          "other": ""'+
                                '        }'+
                                '      },'+
                                '      "preferences": {'+
                                '        "marketing": {'+
                                '          "email":false,'+
                                '          "post": false,'+
                                '          "telephone": false,'+
                                '          "text": false'+
                                '        },'+
                                '        "servicing": {'+
                                '          "email": false,'+
                                '          "post": false,'+
                                '          "telephone": false,'+
                                '          "text": false,'+
                                '          "online": false'+
                                '        }'+
                                '      }'+
                                '    }'+
                                '  },'+
                                '  "meta": {'+
                                '    "source": {'+
                                '      "system": "Ski",'+
                                '      "type": "Customer"'+
                                '    }'+
                                '  }'+
                                '}';            
            req.requestBody =  Blob.valueof(jsonStr);
            RestContext.request = req;
            RestContext.response= res; 
            RESTMemberService.upsertMember();                    
        Test.stopTest();

        System.assertEquals(RESTResponseMessages.STATUS_BAD, RestContext.response.statusCode);        
    }        

}