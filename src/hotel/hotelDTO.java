package hotel;

public class hotelDTO {

	String name = null;		//예약자 전체 이름
	String name1 = null;	//스탠다드 룸 예약자 이름
	String name2 = null;	//스위트 룸 예약자 이름 
	String name3 = null;	//로얄 룸 예약자 이름
	String resv_date = null;	//전체 예약일
	String check_in = null;		//체크 인
	String check_out = null;	//체크 아웃
	String year = null;			//예약 연도
	String month = null;		//예약 달
	String day = null;			//예약 일
	String room = null;			//예약 방
	String addr = null;			//주소
	String tell_num = null;		//전화번호
	String in_name = null;		//
	String comment = null;		//코맨트
	String write_date = null;	//예약자가 예약한 날짜
	int processing = 0;		//진행 상황
	int st = 0;			//스탠다드 룸 예약 상태
	int su = 0;			//스위트 룸 예약 상태
	int ro = 0;			//로얄 룸 예약 상태
	
	
	public hotelDTO(){
		
	}
	
	
	public hotelDTO(String year, String month, String day, int st, int su, int ro) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.st = st;
		this.su = su;
		this.ro = ro;
	}
	
	public hotelDTO(String resv_date, String name1, String name2, String name3) {
		super();
		this.resv_date = resv_date;
		this.name1 = name1;
		this.name2 = name2;
		this.name3 = name3;
	}
	
	
	
	public hotelDTO(String name, String check_in, String check_out, String room, String tell_num, int processing) {
		super();
		this.name = name;
		this.check_in = check_in;
		this.check_out = check_out;
		this.room = room;
		this.tell_num = tell_num;
		this.processing = processing;
	}
	public hotelDTO(String year, String month, String day, String name, String room) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.name = name;
		this.room = room;
	}
	
	public hotelDTO(String name, String resv_date, String room, String addr, String tell_num, String in_name,
			String comment, String write_date, int processing) {
		super();
		this.name = name;
		this.resv_date = resv_date;
		this.room = room;
		this.addr = addr;
		this.tell_num = tell_num;
		this.in_name = in_name;
		this.comment = comment;
		this.write_date = write_date;
		this.processing = processing;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getResv_date() {
		return resv_date;
	}

	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTell_num() {
		return tell_num;
	}

	public void setTell_num(String tell_num) {
		this.tell_num = tell_num;
	}

	public String getIn_name() {
		return in_name;
	}

	public void setIn_name(String in_name) {
		this.in_name = in_name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public int getProcessing() {
		return processing;
	}

	public void setProcessing(int processing) {
		this.processing = processing;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public String getMonth() {
		return month;
	}


	public void setMonth(String month) {
		this.month = month;
	}


	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}




	public int getSt() {
		return st;
	}




	public void setSt(int st) {
		this.st = st;
	}




	public int getSu() {
		return su;
	}




	public void setSu(int su) {
		this.su = su;
	}




	public int getRo() {
		return ro;
	}




	public void setRo(int ro) {
		this.ro = ro;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getName3() {
		return name3;
	}
	public void setName3(String name3) {
		this.name3 = name3;
	}
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	
	
	
	
	

	
	
}
