package hotel;

public class UserDTO {
	
	String id = null;
	String passwd = null;
	String name = null;
	String tell = null;
	String addr = null;
	String mail = null;
	
	
	
	public UserDTO(String id, String passwd) {
		super();
		this.id = id;
		this.passwd = passwd;
	}
	
	
	
	
	
	public UserDTO(String id, String passwd, String name, String tell, String addr, String mail) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.tell = tell;
		this.addr = addr;
		this.mail = mail;
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





	public String getTell() {
		return tell;
	}





	public void setTell(String tell) {
		this.tell = tell;
	}





	public String getAddr() {
		return addr;
	}





	public void setAddr(String addr) {
		this.addr = addr;
	}





	public String getMail() {
		return mail;
	}





	public void setMail(String mail) {
		this.mail = mail;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
}
