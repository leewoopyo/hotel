package hotel;

public class BoardDTO {
	
	int id;
	String title;
	String date;
	String content;
	int rootid;
	int relevel;
	int recnt;
	int viewcnt;
	int isdelete;
	
	public BoardDTO(int id, String title, String date, String content, int rootid, int relevel, int recnt, int viewcnt,int isdelete) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
		this.content = content;
		this.rootid = rootid;
		this.relevel = relevel;
		this.recnt = recnt;
		this.viewcnt = viewcnt;
		this.isdelete = isdelete;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	
	
	
	

}
