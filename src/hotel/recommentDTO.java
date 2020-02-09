package hotel;

public class recommentDTO {
	
	int masterid;	//원글의 번호(해당 댓글을 연결하는 용도로 쓰임)
	int id;			//댓글 번호
	String date;	//댓글 작성일
	String content;	//댓글 내용
	int rootid;		//최상위 댓글의 번호
	int relevel;	//댓글의 수준
	int recnt;		//글 순서
	int isdelete;	//삭제 여부
	
	
	public recommentDTO() {
		super();
	}

	public recommentDTO(int masterid, int id, String date, String content, int rootid, int relevel, int recnt, int isdelete) {
		super();
		this.masterid = masterid;
		this.id = id;
		this.date = date;
		this.content = content;
		this.rootid = rootid;
		this.relevel = relevel;
		this.recnt = recnt;
		this.isdelete = isdelete;
	}
	
	public int getMasterid() {
		return masterid;
	}
	public void setMasterid(int masterid) {
		this.masterid = masterid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRootid() {
		return rootid;
	}
	public void setRootid(int rootid) {
		this.rootid = rootid;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	public int getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	
	

}
