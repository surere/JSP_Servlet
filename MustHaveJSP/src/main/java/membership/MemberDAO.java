package membership;
/*
 	DTO(Data Transfer Object) : JSP와 Java파일간에 데이터를 전달하기 위한 객체로
 		자바빈 규약에 의해 제작한다
 		자바빈 규약은 교제 114페이지를 참조한다.
 */
import javax.servlet.ServletContext;

import common.JDBConnect;
/*
 	DAO(Data Access Object) : 실제 데이터베이스에 접근하여 여러가지 
 		CRUD 작업을 하기위한 객체 
 */
public class MemberDAO extends JDBConnect{
	
	//클래스와 이름이 같으면 생성자
	
	// 생성자 메서드
	// 매개변수가 4개인 부모의 생성자를 호출하여 DB에 연결한다.
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw); //JDBConnect여기에 상속받은 것을 super로 나타낸것?
	}
	// application 내장객체만 매개변수로 전달한 후 DB에 연결한다.

	public MemberDAO(ServletContext application){
		super(application);
	}
	/*
	 	사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 select한 후 
	 	존재하는 정보인 경우 DTO객체에 그 정보를 담아 반환한다. 
	 */
	public MemberDTO getMemberDTO(String uid, String upass) {
		// 로그인을 위한 쿼리문을 실행한 후 회원정보를 저장하기 위해 생성
		MemberDTO dto = new MemberDTO();
		// 로그인 위해 인파라미터가 있는 동적 쿼리문 작성
		//아이디와 패스워드가 일치해야 로그인이 될 수 있게끔 아래와 같이 표현
		String query = "SELECT * FROM member WHERE id = ? AND pass=? ";
		//ORACLE에서 받아오지 못함-에러-FORM오타가 남 FROM으로 변경하여 다시 받아올 수 있게 변경
		
		try {
			// 쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			//위에 대입시켜서 id와 pass
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			// select 쿼리문을 실행한 후 ResultSet으로 반환받는다
			rs = psmt.executeQuery();
			
			// 반환된 ResultSet객체를 통해 회원정보가 있는지 확인한다.
			if(rs.next()) {
				// 정보가 있다면 DTO객체에 회원정보를 저장한다. 
				//DTO정보에서 받아온 것을 배열로 (공공DB) 정리해서 받는?
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		// 호출한 지점으로 DTO객체를 반환한다.
		return dto;
	}
		
}