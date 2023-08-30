package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class BbsDAO
{
	private Connection conn;
	private ResultSet rs;

	public BbsDAO()
	{
		try
		{
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "cafe";
			String dbPassword = "1234";
			Class.forName(driverName);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

//현재의 시간을 가져오는 함수
	public String getDate()
	{
		
		String SQL = "SELECT SYSDATE FROM BBS";
		

		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				return rs.getString(1);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return "";
	}

//bbsID 게시글 번호 가져오는 함수
	public int getNext()
	{
		
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";

		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				System.out.println(rs.getInt(1)); 
				return rs.getInt(1) + 1; 
			}
			return 1; // 첫번째 게시물인경우
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}

//글 작성하는 함수
	public int write(String bbsTitle, String userID, String bbsContent)
	{
		String SQL = "INSERT INTO BBS VALUES(?,?,?,?,?,?)";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();

		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1; 
	}

	public ArrayList<Bbs> getList(int pageNumber)
	{

		String SQL = "SELECT * FROM (SELECT * FROM BBS WHERE bbsID <? and bbsAvailable=1 ORDER BY bbsID DESC) WHERE ROWNUM<=10";

		
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getTimestamp(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from (select * from bbs where bbsid <? and bbsAvailable=1 order by bbsID desc) where rownum<=10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				return true;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

//	추가
	public int delete(int BbsID) {
		String SQL="UPDATE BBS SET bbsAvailable=0 WHERE BbsID=?";
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1,BbsID);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int update(int bbsID,String bbsTitle,String bbsContent) {
		String SQL="UPDATE BBS SET bbsTitle=?, bbsContent=? WHERE bbsID=?";
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3,bbsID);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}

//	여기까지

	public Bbs getBbs(int bbsID)
	{
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();

			if (rs.next())
			{
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getTimestamp(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));

				return bbs;

			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
