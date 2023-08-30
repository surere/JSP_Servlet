package fileupload;
import java.util.List;
import java.util.Vector;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import common.DBConnPool;
/*
 	DBCP(Database Connection Pool)를 이용해서 오라클에 연결한다.
 	커넥션풀은 DB연결객체를 풀(Pool)에 미리 만들어 놓고 필요할 때마다
 	가져다 사용한 후 반납하는 형태로, 필요이상으로 객체를 생성 및 소멸을
 	하지 않아도 되므로 효율적인 자원관리를 할 수 있다.
 	DB연결에 필요한 정보는 Java나 JSP가 가지고 있지 않고 Tomcat(웹서버)에
 	설정하게 된다.
 */
import model2.mvcboard.MVCBoardDTO;

public class MyfileDAO extends DBConnPool
{
	public int insertFile(MyfileDTO dto)
	{
		// 새로운 게시물을 등록시 첨부파일도 함께 저장한다.
		int applyResult = 0;
		//나중에 아래에 있는 값을 받기 위해서
		try {
			/*
			 	게시물 입력을 위한 insert문 생성. 입력폼에서 등록한
			 	제목, 이름과 원본파일명, 저장된 파일명을 등록한다.
			 	일련번호의 경우 회원제 게시판에서 생성했던 시퀀스를 
			 	그대로 사용한다. 시퀀스의 목적은 중복되지 않는 일련번호를
			 	생성하는 것이므로 하나의 시퀀스를 여러개의 테이블에 
			 	사용해도 된다.
			 */
			String query = "INSERT INTO myfile( "
				+ " idx, name, title, cate, ofile, sfile) "
				+ " VALUES( "
				+ " seq_board_num.nextval, ?, ?, ?, ?, ?)";
			//이전에 만들었던 것을 불러오는 것임
			//idx는 자동으로 들어가기 때문에 상관없음
			// 인파라미터 설정 
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			// 쿼리문 실행
			applyResult = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
	// 파일 목록 구현을 위해 select 쿼리문 실행
	public List<MyfileDTO> myFileList(){
		List<MyfileDTO> fileList = new Vector<MyfileDTO>();
		
		// 일련번호를 내림차순으로 정렬한 뒤 게시물을 select한다.
		String query = "SELECT * FROM myfile ORDER BY idx DESC";
		try {
			// 쿼리문 실행
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			// 인출한 행의 갯수만큼 반복한다.
			while(rs.next()) {
				// 레코드를 DTO객체로 저장한 후 
				MyfileDTO dto = new MyfileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				// List 컬렉션에 추가한다.
				fileList.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("SELECT 시 예외 발생");
			e.printStackTrace();
		}
		return fileList;
	}
	
}
