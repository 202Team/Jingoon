package kr.co.fileload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FileDAO {
	
	private DataSource dataFactory;
	
	public FileDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory =(DataSource)ctx.lookup("java:comp/env/jdbc/oracle11g");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int upload(FileDTO dto) {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into fileload_tbl (num, save, realPath, id, sysFileName, orgFileName, boardNum) "
				+ "values(?,?,?,?,?,?,?)";
		try {
			conn = dataFactory.getConnection();
			num = getFileNum(conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getSave());
			pstmt.setString(3, dto.getRealPath());
			pstmt.setString(4, dto.getId());
			pstmt.setString(5, dto.getSysFileName());
			pstmt.setString(6, dto.getOrgFileName());
			pstmt.setInt(7, dto.getBoardNum());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		
		return num;
	}

	private int getFileNum(Connection conn) {
		int num =-1;
		PreparedStatement pstmt = null;
		String sql = "select nvl2(max(num), max(num)+1, 1) from fileload_tbl ";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			closeAll(null, pstmt, rs);
		}
		return num;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}