package hotel;

public class UserDTO {
	
	String id = null;
	String passwd = null;
	
	
	
	public UserDTO(String id, String passwd) {
		super();
		this.id = id;
		this.passwd = passwd;
	}
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
	
}
