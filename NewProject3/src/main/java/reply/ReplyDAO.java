package reply;

import java.sql.PreparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDAO
{
	private Connection conn;
	private ResultSet rs;
	
	public ReplyDAO() {
		try {
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "cafe";
			String dbPassword = "1234";
			Class.forName(driverName);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Reply> getList(int bbsID,int pageNumber){
		String SQL="SELECT * FROM ( SELECT * FROM Reply WHERE bbsID = :1 AND ReplyAvailable = 1 ORDER BY bbsID DESC ) WHERE ROWNUM <= 10";
		ArrayList<Reply> list=new ArrayList<Reply>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reply reply=new Reply();
				reply.setUserID(rs.getString(1));
				reply.setReplyID(rs.getInt(2));
				reply.setReplyContent(rs.getString(3));
				reply.setBbsID(bbsID);
				reply.setReplyAvailable(1); 
				list.add(reply);
				System.out.println(reply.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getNext() {
		String SQL="SELECT ReplyID from Reply order by ReplyID DESC";
		try {
		
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1)); 
				return rs.getInt(1)+1;  
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(int bbsID,String replyContent,String userID) {
		String SQL="INSERT INTO REPLY VALUES(?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, replyContent);
			pstmt.setInt(4,bbsID);
			pstmt.setInt(5,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int delete(int replyno)

	{
		String SQL = "UPDATE reply SET replyAvailable = 0 WHERE replyid = ?";
		int result=-1;
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, replyno);
			result= pstmt.executeUpdate();
			System.out.println("업뎃이트 결과값:"+result);
			return result;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
}

