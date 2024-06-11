public class MemberReqModel {
	public MemberData data;
	public MemberMeta meta;
    
    public class MemberData {
		public String type;	
		public String id;	
		public Attributes attributes;
	}
    
    public class Attributes {
		public String title;	
		public String firstName;
		public String lastName;	
		public String dateOfBirth;
		public String nickname;	
		public String sex;	
		public String status;	
		public ContactDetails contactDetails;
		public Preferences preferences;
	}
    
    public class ContactDetails {
		public String emailAddress;	
		public Address address;
		public TelephoneNumbers telephoneNumbers;
	}
    
    public class Address {
		public String line1;	
		public String line2;	
		public String line3;	
		public String town;	    
		public String county;	
		public String postcode;	
		public String country;	
	}
    
    public class TelephoneNumbers {
		public String home;	
		public String mobile;	
		public String other;	
	}
	public class Preferences {
		public Marketing marketing;
		public Servicing servicing;
	}
    
    public class Marketing {
		public boolean email;	
		public boolean post;	
		public boolean telephone;	
		public boolean text;	
	}
    
    public class Servicing {
		public boolean email;	
		public boolean post;	
		public boolean telephone;	
		public boolean text;	
		public boolean online;
	}
    
    public class MemberMeta {
		public Source source;
	}
    
    public class Source {
		public String sourceSys;	
		public String type;	
    }
    
	public static MemberReqModel parse(String json){
        String jsonModified = json.replace('"system":', '"sourceSys":');
		return (MemberReqModel) System.JSON.deserialize(jsonModified, MemberReqModel.class);
	}

}