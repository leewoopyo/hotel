package hotel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class hotelDAO {

	// 커넥터 연결에 필요한 변수
	Connection conn = null;
	Statement stmt = null;
	ResultSet rset = null;
	PreparedStatement pstmt = null;

	// 인스턴스 변수
	private static hotelDAO instance;

	private hotelDAO() {
	}

	// 싱글턴 패턴으로 메소드화
	public static synchronized hotelDAO getInstance() {
		if (instance == null) {
			instance = new hotelDAO();
		}
		return instance;
	}

	// 커넥터 연결하는 메소드
	public void getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection("jdbc:mysql://192.168.23.89:3306/mysql", "kopo15", "Qwer1234!!");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 커넥터 닫는 메소드
	public void connectionClose() {
		try {

			if (rset != null) {
				rset.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 레코드 삽입하는 메소드(본문의 삽입) 데이터 삽입 시 체크인 체크 아웃이 있으면 해당하는 일자만큼 BD에 쭉 저장이 되야한다.
	 * 
	 * @param name     : 이름
	 * @param date1    : 체크인
	 * @param room     : 방
	 * @param call     : 전화 번호
	 * @param diffDays : 체크인과 체크아웃 두 날짜 사이
	 */
	public void addrecord(String name, String date1, String room, String call, long diffDays) {
		String sql = null;
		getConnection();
		try {
			// 데이터를 넣을 때 해당 날짜들을 모두 넣을 것이기 때문에 해당 날짜 차이만큼 반복을 돌린다.
			for (int i = 0; i <= diffDays; i++) {
				if (room.equals("Standard Room")) {
					// 반목문 수만큼 insert를 돌린다, 순차적인 날짜의 삽입은 date_add를 사용하면 된다.
					sql = "insert into hotel (name,resv_date,room,tell_num,standard_room) values (?,DATE_ADD(?, INTERVAL "
							+ i + " DAY),?,?,1);";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, date1);
					pstmt.setString(3, room);
					pstmt.setString(4, call);
					pstmt.executeUpdate();
				} else if (room.equals("Suite Room")) {
					// 반목문 수만큼 insert를 돌린다, 순차적인 날짜의 삽입은 date_add를 사용하면 된다.
					sql = "insert into hotel (name,resv_date,room,tell_num,suite_room) values (?,DATE_ADD(?, INTERVAL "
							+ i + " DAY),?,?,1);";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, date1);
					pstmt.setString(3, room);
					pstmt.setString(4, call);
					pstmt.executeUpdate();
				} else if (room.equals("Royal Room")) {
					// 반목문 수만큼 insert를 돌린다, 순차적인 날짜의 삽입은 date_add를 사용하면 된다.
					sql = "insert into hotel (name,resv_date,room,tell_num,royal_room) values (?,DATE_ADD(?, INTERVAL "
							+ i + " DAY),?,?,1);";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, date1);
					pstmt.setString(3, room);
					pstmt.setString(4, call);
					pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}

	/**
	 * 전체 리스트 가져오기
	 * 
	 * @param date1
	 * @param room
	 * @return 전체 리스트가 담긴 list
	 */
	public List<hotelDTO> getlist() {
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
			while (rset.next()) {
				year = rset.getString(1);
				month = rset.getString(2);
				day = rset.getString(3);
				name = rset.getString(4);
				room = rset.getString(5);

				// hotelDTO hoteldto = new hotelDTO(year,month,day,name,room);
				list.add(new hotelDTO(year, month, day, name, room));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return list;
	}

	/**
	 * 날짜 중복체크를 위한 데이터 가져오기
	 * 
	 * @param date1 : 체크인
	 * @param date2 : 체크 아웃
	 * @param room  : 방 종류
	 * @return 0 혹은 그 위의 수가 나온다(0일땐, 해당 날짜범위에 중복 없음. 1이상이면 중복 됨)
	 */
	public int getrecord(String date1, String date2, String room) {
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

	// 게시판 관련 메소드
	public List<BoardDTO> getlist(int from, int cnt) {
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from gongji order by rootid desc, recnt asc limit ?,?;";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, from);
			pstmt.setInt(2, cnt);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				BoardDTO boarddto = new BoardDTO(rset.getInt(1), rset.getString(2), rset.getString(3),
						rset.getString(4), rset.getInt(5), rset.getInt(6), rset.getInt(7), rset.getInt(8),
						rset.getInt(9));
				boardlist.add(boarddto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return boardlist;
	}

	/**
	 *  리뷰 테이블에 담긴 전체 데이터 갯수 리턴하는 메소드
	 *  @return 전체 갯수
	 */
	public int maxcount() {
		int maxcount = 0;
		String sql = null;
		getConnection();
		try {
			sql = "select count(*) from review;";
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				maxcount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return maxcount;
	}

	// 아래단계 댓글이 있나 확인
	public int checkdelete(int rootid, int relevel, int recnt) {
		int checkdelete = 0;
		String sql = null;
		getConnection();
		try {
			sql = "SELECT COUNT(*) FROM gongji where rootid = ? and relevel > ? and recnt > ? ORDER BY rootid DESC, recnt ASC;";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rootid);
			pstmt.setInt(2, relevel);
			pstmt.setInt(3, recnt);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				checkdelete = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}

		if (checkdelete > 0) {
			checkdelete = 1;
		} else {
			checkdelete = 0;
		}

		return checkdelete;
	}

	/**
	 *  방문시마다 조회수가 1씩 올라가는 메소드(review)
	 * @param viewcnt
	 * @param id
	 */
	public void updateviewcnt_review(int viewcnt,int id) {
		String sql = null;
		getConnection();
		try {
			sql = "update review set view_cnt=? where id=?;";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, viewcnt);
			pstmt.setInt(2, id);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	/**
	 *  방문시마다 조회수가 1씩 올라가는 메소드(notice)
	 * @param viewcnt
	 * @param id
	 */
	public void updateviewcnt_notice(int viewcnt,int id) {
		String sql = null;
		getConnection();
		try {
			sql = "update notice set view_cnt=? where id=?;";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, viewcnt);
			pstmt.setInt(2, id);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	
	

	/**
	 * 특정 id만 출력하는 list를 리턴하는 메소드(review)
	 * @param id : 글 번호
	 * @return 특정 아이디로 조건을 줘서 나온 데이터
	 */
	public List<BoardDTO> getonelist_review(int id) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from review where id=?;";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				BoardDTO boardvo = new BoardDTO(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),rset.getString(5), rset.getInt(6), rset.getInt(7));
				list.add(boardvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return list;
	}
	/**
	 * 특정 id만 출력하는 list를 리턴하는 메소드(notice)
	 * @param id : 글 번호
	 * @return 특정 아이디로 조건을 줘서 나온 데이터
	 */
	public List<BoardDTO> getonelist_notice(int id) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from notice where id=?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, id);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				BoardDTO boardvo = new BoardDTO(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),rset.getString(5), rset.getInt(6), rset.getInt(7));
				list.add(boardvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return list;
	}

	// 그날 예약이 전부 안되있으면 표시 안되는 sql가 있는 메소드
	public List<hotelDTO> getresvlist() {
		List<hotelDTO> getresvlist = new ArrayList<hotelDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "SELECT SUBSTRING(resv_date,1,4),SUBSTRING(resv_date,6,2),SUBSTRING(resv_date,9,2),count(standard_room),count(suite_room),count(royal_room) FROM hotel GROUP BY resv_date;";

			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				getresvlist.add(new hotelDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getInt(4),
						rset.getInt(5), rset.getInt(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return getresvlist;
	}

	/**
	 * 날짜, 각 룸의 예약자 이름들이 표시 돼 있는 메소드 관리자 페이지 전체 예약자 출력에서 사용
	 * 
	 * @return list반환
	 */
	public List<hotelDTO> getnamelist(String where) {
		List<hotelDTO> getnamelist = new ArrayList<hotelDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select e.resv_date,ifnull(e.name1,''),ifnull(e.name2,''),ifnull(f.name,'') AS NAME3 from (select c.resv_date,c.name as NAME1,d.name as NAME2 from (select a.resv_date,b.name from (select resv_date from hotel group by resv_date) as a left outer join (select resv_date,name from hotel where room = 'Standard Room') as b on a.resv_date = b.resv_date) as c left outer join (select resv_date,name from hotel where room = 'Suite Room') as d on c.resv_date = d.resv_date) as e left outer join (select resv_date,name from hotel where room = 'Royal Room') as f on e.resv_date = f.resv_date "
					+ where + " ;";
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				getnamelist
						.add(new hotelDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return getnamelist;
	}

	/**
	 * 매개변수를 넣어서 해당하는 정보를 가진 데이터를 추출(해당 이름과 방정보를 가진 예약 표시)
	 * @param name : 예약자 이름
	 * @return 해당 정보
	 */
	public List<hotelDTO> getoneview_name(String name) {
		List<hotelDTO> getname = new ArrayList<hotelDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "SELECT name,Min(resv_date),Max(resv_date),room,tell_num FROM hotel WHERE NAME = ? GROUP BY name,room,tell_num;";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				getname.add(new hotelDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), 1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return getname;
	}

	/**
	 * 매개변수를 넣어서 해당하는 정보를 가진 데이터를 추출
	 * 
	 * @param name : 예약자 이름
	 * @return 해당 정보
	 */
	public hotelDTO getoneview_room(String room) {
		hotelDTO getname = null;
		String sql = null;
		getConnection();
		try {
			sql = "SELECT name,Min(resv_date),Max(resv_date),room,tell_num FROM hotel WHERE room = ? GROUP BY name,room,tell_num;";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, room);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				getname = new hotelDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return getname;
	}

	/**
	 * 유저 정보 입력(회원가입)
	 * 
	 * @param id
	 * @param passwd
	 */
	public void create_user_info(String id, String passwd,String name,String tell,String addr,String mail) {
		String sql = null;
		getConnection();
		try {
			sql = "insert into user_info (userid,passwd,name,tell,addr,mail) values (?,?,?,?,?,?);";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, name);
			pstmt.setString(4, tell);
			pstmt.setString(5, addr);
			pstmt.setString(6, mail);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	/**
	 * 해당 유저 정보를 가져오기 (로그인 시 일치하는지 확인하기 위해서)
	 * @param id
	 * @param passwd
	 * @return
	 */
	public UserDTO get_user_info(String id, String passwd) {
		UserDTO userdto = null;
		String sql = null;
		getConnection();
		try {
			sql = "select * from user_info where userid = ? and passwd = ?;";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, passwd);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				userdto = new UserDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5),rset.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return userdto;
	}
	/**
	 * 해당 유저 정보를 가져오기 (예약폼 자동 입력을 위해서)
	 * @param id
	 * @return
	 */
	public UserDTO get_user_info(String id) {
		UserDTO userdto = null;
		String sql = null;
		getConnection();
		try {
			sql = "select * from user_info where userid = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				userdto = new UserDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5),rset.getString(6));
			}
		} catch (Exception e) {
			userdto = new UserDTO("error", "error");
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return userdto;
	}
	
	/**
	 * review 테이블에 새글 넣는 메소드
	 * @param title : 제목 
	 * @param content : 내용
	 * @param userid : 작성자 id
	 * @param date : 작성일 
	 */
	public void insert_review(String title, String content, String userid, String date) {

		String sql = null;
		getConnection();
		try {
			sql = "insert into review (title,content,userid,date,view_cnt,totalrecnt) values (?,?,?,?,0,0);";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, userid);
			pstmt.setString(4, date);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	/**
	 * notice 테이블에 새글 넣는 메소드
	 * @param title : 제목 
	 * @param content : 내용
	 * @param userid : 작성자 id
	 * @param date : 작성일 
	 */
	public void insert_notice(String title, String content, String userid, String date) {
		
		String sql = null;
		getConnection();
		try {
			sql = "insert into notice (title,content,userid,date,view_cnt,totalrecnt) values (?,?,?,?,0,0);";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, userid);
			pstmt.setString(4, date);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	/**
	 * 전체 리뷰를 리스트에 담아서 리턴함
	 * @param from
	 * @param cnt
	 * @return
	 */
	public List<BoardDTO> get_review_list(int from,int cnt) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from review order by id desc limit ?,?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, from);
			pstmt.setInt(2, cnt);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardDTO(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getString(5),rset.getInt(6), rset.getInt(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return list;
	}
	/**
	 * 전체 공지 리스트를 담아서 리턴함
	 * @param from
	 * @param cnt
	 * @return
	 */
	public List<BoardDTO> get_notice_list(int from,int cnt) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from notice order by id desc limit ?,?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, from);
			pstmt.setInt(2, cnt);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardDTO(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getString(5),rset.getInt(6), rset.getInt(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return list;
	}
	/**
	 * 전체 유저 정보 데이터를 리스트에 담아서 리턴함
	 * @param from
	 * @param cnt
	 * @return
	 */
	public List<UserDTO> get_user_list() {
		List<UserDTO> list = new ArrayList<UserDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from user_info;";
			
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new UserDTO(rset.getString(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getString(5),rset.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return list;
	}
	
	/**
	 * 리뷰 업데이트
	 * @param id
	 * @param title
	 * @param content
	 */
	public void update_review(int id, String title, String content) {
		content = "<p>" + content + "</p>";
		String sql = null;
		getConnection();
		try {
			sql = "UPDATE review SET title=?, content = ? WHERE id = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	/**
	 * 공지 업데이트
	 * @param id
	 * @param title
	 * @param content
	 */
	public void update_notice(int id, String title, String content) {
		content = "<p>" + content + "</p>";
		String sql = null;
		getConnection();
		try {
			sql = "UPDATE notice SET title=?, content = ? WHERE id = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	/**
	 * 예약 수정 시 중복 체크
	 * 아래 매개변수를 조건으로 중복이 있는지 검사함
	 * @param check_in
	 * @param check_out
	 * @param room
	 */
	public int overlap_check(String check_in,String check_out,String room) {
		String sql = null;
		int cnt = 0;
		getConnection();
		try {
			sql = "SELECT COUNT(*) FROM hotel WHERE resv_date BETWEEN ? AND ? and room = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, check_in);
			pstmt.setString(2, check_out);
			pstmt.setString(3, room);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				cnt = rset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return cnt;
	}
	/**
	 * 해당 예약 정보  지우기 
	 * @param name
	 * @param check_in
	 * @param check_out
	 * @param room
	 */
	public void delete_resv(String name,String check_in,String check_out,String room) {
		String sql = null;
		getConnection();
		try {
			sql = "delete from hotel where name = ? and resv_date between ? and ? and room = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, check_in);
			pstmt.setString(3, check_out);
			pstmt.setString(4, room);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	/**
	 * 레코드 삽입하는 메소드(최상위 댓글)
	 * @param masterid
	 * @param date
	 * @param content
	 * @param rootid
	 */
	public void insert_recomment(String masterid,String date, String content, int rootid) {
		
		String sql = null;
		getConnection();
		try {
			sql = "insert into recomment(masterid,date,content,rootid,relevel,recnt,isdelete) values (?,?,?,?,0,0,0);";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, masterid);
			pstmt.setString(2, date);
			pstmt.setString(3, content);
			pstmt.setInt(4, rootid);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	/**
	 * 가장 최근 id 가져오기
	 * @return 가장 최근 아이디
	 */
	public int getmaxid() {
		String sql = null;
		int maxid = 0;
		getConnection();
		try {
			sql = "select max(id) from recomment;";
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				maxid = rset.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connectionClose();			
		}
		return maxid;
	}
	
	/**
	 * 해당 본문글의 댓글들을 가져오기
	 * @param masterid
	 * @return
	 */
	public List<recommentDTO> getlist_recomment(String masterid){
		List<recommentDTO> list = new ArrayList<recommentDTO>();
		String sql = null;
		getConnection();
		try {
			sql = "select * from recomment where masterid = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, masterid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new recommentDTO(rset.getInt(1),rset.getInt(2),rset.getString(3),rset.getString(4),rset.getInt(5),rset.getInt(6),rset.getInt(7),rset.getInt(8)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return list;
	}
	
	/**
	 * review 삭제 메소드
	 * @param id :글 번호
	 */
	public void delete_review(int id) {
		String sql = null;
		getConnection();
		try {
			sql = "delete from review where id = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	
	/**
	 * review 삭제 메소드
	 * @param id :글 번호
	 */
	public void delete_notice(int id) {
		String sql = null;
		getConnection();
		try {
			sql = "delete from notice where id = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	/**
	 * 회원가입시 아이디 중복 체크하는지 확인하기 위한 메소드
	 * @param userid  : 해당 아이디
	 * @return 위 조건으로 출력된 갯수 0이면 중복 없음 1이면 중복 있음
	 */
	public int  get_usercnt(String userid) {
		int usercnt = 0;
		String sql = null;
		getConnection();
		try {
			sql = "select count(*) from user_info where userid = ?;";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				usercnt = rset.getInt(1); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return usercnt;
	}
	
	
	
	
	
	
	
	
	
//테스트		
	public static void main(String[] args) {
		// 테스트
		hotelDAO a = new hotelDAO();
		List<hotelDTO> dto = new ArrayList<hotelDTO>();
		dto = a.getlist();
		System.out.println(dto.size());
	}

	
	
	/* 예약 정보 테이블 생성
	 * create table hotel( name varchar(20), resv_date date, room
	 * varchar(50), addr varchar(100), tell_num varchar(50), in_name varchar(20),
	 * comment text, write_date date, processing int, standard_room int, suite_room
	 * int, royal_room int, primary key(resv_date,room)) default charset=utf8;
	 */

	/* 조인
	 * select e.resv_date,e.name1,e.name2,f.name AS NAME3 from (select
	 * c.resv_date,c.name as NAME1,d.name as NAME2 from (select a.resv_date,b.name
	 * from (select resv_date from hotel group by resv_date) as a left outer join
	 * (select resv_date,name from hotel where room = 'Standard Room') as b on
	 * a.resv_date = b.resv_date) as c left outer join (select resv_date,name from
	 * hotel where room = 'Suite Room') as d on c.resv_date = d.resv_date) as e left
	 * outer join (select resv_date,name from hotel where room = 'Royal Room') as f
	 * on e.resv_date = f.resv_date ;
	 */

	/* 리뷰 테이블 생성
	  create table review(id int primary key auto_increment, title varchar(50) not
	  null, content text, userid varchar(30), date date, view_cnt int,totalrecnt int)default
	  charset=utf8;
	 */
	
	/* 공지 테이블 생성
	  create table notice(id int primary key auto_increment, title varchar(50) not
	  null, content text, userid varchar(30), date date, view_cnt int,totalrecnt int)default
	  charset=utf8;
	 */
	
	/*유저 테이블 생성
	  create table user_info(
	  userid varchar(30) primary key, 
	  passwd varchar(30) not null,
	  name varchar(30) ,
 	  tell varchar(20) ,
	  addr varchar(100) ,
	  mail varchar(50))default charset=utf8;
	 */
	
	
	/*
 	 create table recomment(
 	 masterid int, 
 	 id int primary key auto_increment,
     date date, 
     content text,
     rootid int,
     relevel int,
     recnt int,
     isdelete int)default charset=utf8;
    */

	

}
