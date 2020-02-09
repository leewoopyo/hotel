package hotel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class hotelDAO {
	
		//커넥터 연결에 필요한 변수
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null; 
		
		//인스턴스 변수
		private static hotelDAO instance;
		
		private hotelDAO() {
		}
		
		//싱글턴 패턴으로 메소드화
		public static synchronized hotelDAO getInstance() {
			if (instance == null) {
				instance = new hotelDAO();
			}
			return instance;
		}
		//커넥터 연결하는 메소드 
		public void getConnection() {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "kopo15", "Life1030!!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		//커넥터 닫는 메소드
		public void connectionClose() {
			try {
				
				if (rset != null) {
					rset.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/**
		 * 레코드 삽입하는 메소드(본문의 삽입)
		 * 데이터 삽입 시 체크인 체크 아웃이 있으면 해당하는 일자만큼 BD에 쭉 저장이 되야한다.
		 * @param name : 이름
		 * @param date1	: 체크인
		 * @param room : 방
		 * @param call : 전화 번호
		 * @param diffDays : 체크인과 체크아웃 두 날짜 사이 
		 */
		public void addrecord(String name,String date1,String room,String call,long diffDays) {
			String sql = null;
			getConnection();
			try {
				//데이터를 넣을 때 해당 날짜들을 모두 넣을 것이기 때문에 해당 날짜 차이만큼 반복을 돌린다.
				for(int i=0;i<=diffDays;i++){
					if(room.equals("Standard Room")) {
						//반목문 수만큼 insert를 돌린다, 순차적인 날짜의 삽입은 date_add를 사용하면 된다.
						sql = "insert into hotel (name,resv_date,room,tell_num,standard_room) values (?,DATE_ADD(?, INTERVAL "+i+" DAY),?,?,1);";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,name);
						pstmt.setString(2,date1);
						pstmt.setString(3,room);
						pstmt.setString(4,call);
						pstmt.executeUpdate();						
					}else if(room.equals("Suite Room")) {
						//반목문 수만큼 insert를 돌린다, 순차적인 날짜의 삽입은 date_add를 사용하면 된다.
						sql = "insert into hotel (name,resv_date,room,tell_num,suite_room) values (?,DATE_ADD(?, INTERVAL "+i+" DAY),?,?,1);";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,name);
						pstmt.setString(2,date1);
						pstmt.setString(3,room);
						pstmt.setString(4,call);
						pstmt.executeUpdate();						
					}else if(room.equals("Royal Room")) {
						//반목문 수만큼 insert를 돌린다, 순차적인 날짜의 삽입은 date_add를 사용하면 된다.
						sql = "insert into hotel (name,resv_date,room,tell_num,royal_room) values (?,DATE_ADD(?, INTERVAL "+i+" DAY),?,?,1);";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,name);
						pstmt.setString(2,date1);
						pstmt.setString(3,room);
						pstmt.setString(4,call);
						pstmt.executeUpdate();						
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				connectionClose();			
			}
		}
		
		/**
		 * 전체 리스트 가져오기
		 * @param date1
		 * @param room
		 * @return 전체 리스트가 담긴 list
		 */
		public List<hotelDTO> getlist(){
			List<hotelDTO> list = new ArrayList<hotelDTO>();
			String sql = null;
			String year = null; 
			String month = null; 
			String day = null; 
			String name = null; 
			String room = null; 
			 
			getConnection();
			try {
				sql = "SELECT SUBSTRING(resv_date,1,4),SUBSTRING(resv_date,6,2),SUBSTRING(resv_date,9,2),NAME,room FROM hotel;";
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					year = rset.getString(1);
					month = rset.getString(2);
					day = rset.getString(3);
					name = rset.getString(4);
					room = rset.getString(5);
					
					//hotelDTO hoteldto = new hotelDTO(year,month,day,name,room);
					list.add(new hotelDTO(year,month,day,name,room));
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				connectionClose();
			}
			return list;
		}
		
	/**
	 * 날짜 중복체크를 위한 데이터 가져오기	
	 * @param date1 : 체크인 
	 * @param date2 : 체크 아웃
	 * @param room : 방 종류
	 * @return 0 혹은 그 위의 수가 나온다(0일땐, 해당 날짜범위에 중복 없음. 1이상이면 중복 됨)
	 */
	public int getrecord(String date1,String date2, String room) {
		int cnt = 0;
		String sql = null;
		getConnection();
		try {
			sql = "SELECT COUNT(*) FROM hotel WHERE resv_date > ? AND resv_date < ? AND room = ?;";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, date1);
			pstmt.setString(2, date2);
			pstmt.setString(3, room);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				cnt = rset.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return cnt;
	}
	
	
	//게시판 관련 메소드
	public List<BoardDTO> getlist(int from, int cnt){
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from gongji order by rootid desc, recnt asc limit ?,?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,from);
			pstmt.setInt(2,cnt);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardDTO boarddto = new BoardDTO(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getInt(5),rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getInt(9));
				boardlist.add(boarddto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return boardlist;
	}
	
	//데이터 갯수 리턴하는 메소드 
	public int maxcount() {
		int maxcount = 0;
		String sql = null;
		getConnection();
		try {
			sql = "select count(*) from gongji;";
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				maxcount = rset.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return maxcount;
	}
	
	//아래단계 댓글이 있나 확인
	public int checkdelete(int rootid,int relevel, int recnt){
		int checkdelete=0;
		String sql = null;
		getConnection();
		try {
			sql = "SELECT COUNT(*) FROM gongji where rootid = ? and relevel > ? and recnt > ? ORDER BY rootid DESC, recnt ASC;";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rootid);
			pstmt.setInt(2, relevel);
			pstmt.setInt(3, recnt);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				checkdelete = rset.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		
		if(checkdelete > 0) {
			checkdelete = 1;
		}else {
			checkdelete = 0;
		}
		
		return checkdelete;
	}
	
	
	//방문시마다 조회수가 1씩 올라가는 메소드
	public void updateviewcntrecord(int id, int viewcnt) {
		viewcnt++;
		String sql = null;
		getConnection();
		try {
			sql = "update gongji set viewcnt=? where id=?;";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);
			pstmt.setInt(2, viewcnt++);

			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
	}
	
	//특정 id만 출력하는 list를 리턴하는 메소드
	public List<BoardDTO> getonelist(int id){
		List<BoardDTO> onelist = new ArrayList<BoardDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from gongji where id=?;";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardDTO boardvo = new BoardDTO(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getInt(5),rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getInt(9));
				onelist.add(boardvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return onelist;
	}
	//그날 예약이 전부 안되있으면 표시 안되는 sql가 있는 메소드
	public List<hotelDTO> getresvlist(){
		List<hotelDTO> getresvlist = new ArrayList<hotelDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "SELECT SUBSTRING(resv_date,1,4),SUBSTRING(resv_date,6,2),SUBSTRING(resv_date,9,2),count(standard_room),count(suite_room),count(royal_room) FROM hotel GROUP BY resv_date;";
			
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				getresvlist.add(new hotelDTO(rset.getString(1),rset.getString(2),rset.getString(3),rset.getInt(4),rset.getInt(5),rset.getInt(6)));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return getresvlist;
	}
	/**
	 * 날짜, 각 룸의 예약자 이름들이 표시 돼 있는 메소드
	 * 관리자 페이지 전체 예약자 출력에서 사용
	 * @return list반환
	 */
	public List<hotelDTO> getnamelist(){
		List<hotelDTO> getnamelist = new ArrayList<hotelDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select e.resv_date,ifnull(e.name1,''),ifnull(e.name2,''),ifnull(f.name,'') AS NAME3 from (select c.resv_date,c.name as NAME1,d.name as NAME2 from (select a.resv_date,b.name from (select resv_date from hotel group by resv_date) as a left outer join (select resv_date,name from hotel where room = 'Standard Room') as b on a.resv_date = b.resv_date) as c left outer join (select resv_date,name from hotel where room = 'Suite Room') as d on c.resv_date = d.resv_date) as e left outer join (select resv_date,name from hotel where room = 'Royal Room') as f on e.resv_date = f.resv_date ;";
			
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				getnamelist.add(new hotelDTO(rset.getString(1),rset.getString(2),rset.getString(3),rset.getString(4)));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return getnamelist;
	}
	
	/**
	 * 매개변수를 넣어서 해당하는 정보를 가진 데이터를 추출
	 * @param name : 예약자 이름
	 * @return 해당 정보
	 */
	public hotelDTO getoneview_name(String name){
		hotelDTO getname = null;
		String sql = null;
		getConnection();
		try {
			sql = "SELECT name,Min(resv_date),Max(resv_date),room,tell_num FROM hotel WHERE NAME = ? GROUP BY name,room,tell_num;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				getname = new hotelDTO(rset.getString(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getString(5),1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return getname;
	}
	
	/**
	 * 매개변수를 넣어서 해당하는 정보를 가진 데이터를 추출
	 * @param name : 예약자 이름
	 * @return 해당 정보
	 */
	public hotelDTO getoneview_room(String room){
		hotelDTO getname = null;
		String sql = null;
		getConnection();
		try {
			sql = "SELECT name,Min(resv_date),Max(resv_date),room,tell_num FROM hotel WHERE room = ? GROUP BY name,room,tell_num;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, room);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				getname = new hotelDTO(rset.getString(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getString(5),1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return getname;
	}
	
	/**
	 * 유저 정보 입력(회원가입)
	 * @param id
	 * @param passwd
	 */
	public void create_user_info(String id, String passwd) {
		String sql = null;
		getConnection();
		try {
			sql = "insert into user_info (id,passwd) values (?,?);";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
	}
	public UserDTO get_user_info(String id,String passwd) {
		UserDTO userdto = null;
		String sql = null;
		getConnection();
		try {
			sql = "select * from user_info where id = ? and passwd = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				userdto = new UserDTO(rset.getString(1), rset.getString(2));
			}
		}catch(Exception e) {
			userdto = new UserDTO("error","error");
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return userdto;
	}
	
	
	
	
	
	
	
		
//테스트		
public static void main(String[] args) {
	//테스트
	hotelDAO a = new hotelDAO();
	List<hotelDTO> dto = new ArrayList<hotelDTO>();
	dto = a.getlist();
	System.out.println(dto.size());
}		
		
		

		
/*
 예약 정보 테이블 생성
 create table hotel( name varchar(20), 
 resv_date date, room varchar(50), 
 addr varchar(100), 
 tell_num varchar(50), 
 in_name varchar(20), 
 comment text,
 write_date date, 
 processing int, 
 standard_room int,
 suite_room int,
 royal_room int,
 primary key(resv_date,room)) 
 default charset=utf8;
 */

/*유저 정보 테이블 생성
 create table user_info(id varchar(20) primary key, passwd varchar(20) not null) default charset=utf8;
 */

/* 조인
select e.resv_date,e.name1,e.name2,f.name AS NAME3 from (select c.resv_date,c.name as NAME1,d.name as NAME2 from (select a.resv_date,b.name from (select resv_date from hotel group by resv_date) as a left outer join (select resv_date,name from hotel where room = 'Standard Room') as b on a.resv_date = b.resv_date) as c left outer join (select resv_date,name from hotel where room = 'Suite Room') as d on c.resv_date = d.resv_date) as e left outer join (select resv_date,name from hotel where room = 'Royal Room') as f on e.resv_date = f.resv_date ;
*/

}
