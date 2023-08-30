package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

// DB연결을 위한 클래스 생성
public class JDBConnect{	//멤버변수
		// 멤버변수 : 연결, 쿼리문 실행 및 전송 , 결과셋 반환
		public Connection con;	// 데이터 베이스와 연결을 담당
		public Statement stmt;	// 인파라미터가 없는 정적 쿼리문을 실행할 때 사용
		public PreparedStatement psmt;	// 인파라미터가 있는 동적 쿼리문을 실행할 때 사용
		public ResultSet rs;	// select 쿼리문의 결과를 저장
		
		// 기본 생성자 : 매개변수가 없는 생성자
		//객체를 만들 때 반드시 필요하기 때문에 생성
		public JDBConnect(){	//매개변수

		try {
			// 오라클 드라이브 로드
			Class.forName("oracle.jdbc.OracleDriver");
			// 커넥션 URL, 계정 아이디와 패스워드 기술
			String url = "jdbc:oracle:thin:@localhost:1521:xe"; //SID 지정이 xe(맞춰줘야함)
			String id ="musthave";
			String pwd = "1234";
			// 오라클 DB 연결
			con = DriverManager.getConnection(url, id, pwd);
			// 연결 성공시 콘솔에서 로그 확인
		
			System.out.println("DB 연결 성공(기본생성자)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
		// 인수 생성자 : DB연결에 필요한 모든 정보를 매개변수로 받음.
		public JDBConnect(String driver, String url, String id, String pwd)
		{
			try {
				// JDBC 드라이버 로드
				Class.forName(driver);
				// DB에 연결
				con = DriverManager.getConnection(url, id, pwd);
				System.out.println("DB 연결 성공(인수 생성자 1)"); //로그 하는 것 확인하고 삭제하는 것
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 인수생성자2 : application 내장객체 사용을 위한 매개변수 선언
		public JDBConnect(ServletContext application) {
			/*
			 	JSP의 내장객체는 메서드에서는 즉시 사용할 수 없고 반드시 매개변수로
			 	참조값을 받은 후 사용해야 한다.
			 */
			try {
				// web.xmp에 정의된 컨테스트 초기화 파라미터를 직접 얻어와서 드라이버
				// 로드 및 연결을 진행한다. 
				String driver = application.getInitParameter("OracleDriver");
				Class.forName(driver);
				String url = application.getInitParameter("OracleURL");
				String id = application.getInitParameter("OracleId");
				String pwd = application.getInitParameter("OraclePwd");
				con = DriverManager.getConnection(url, id, pwd);
				System.out.println("DB 연결 성공(인수 생성자 2)"); //로그
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	// 자원 해제를 위한 메서드 : 자원을 절약하기 위해
		//선언한 것을 다 닫아줌
	public void close()
	{
		try { //if문으로 사용한 것만 닫아(해제)해줌
			if(rs !=null) rs.close();
			if(stmt !=null) stmt.close();
			if(psmt !=null) psmt.close();
			if(con !=null) con.close();
			
			System.out.println("JDBC 자원해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
