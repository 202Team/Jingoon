package kr.co.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory=(DataSource) ctx.lookup("java:comp/env/jdbc/oracle11g");
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
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
	
	public Map<String, String> menu() {
		Map<String, String> menu = new HashMap<String, String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from usermenu_tbl "; 
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String sp = rs.getString("sp");
				String fullname = rs.getString("fullname");
				menu.put(sp, fullname);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return menu;
	}

	public String checkId(String id) {
		String dbid = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_tbl where userid=? "; 
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbid = rs.getString("userid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return dbid;
	}

	public void insert(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="insert into user_tbl (num, id, pw, name, nickname, address) values (?,?,?,?,?,?) ";
		try {
			conn = dataFactory.getConnection();
			int num = insertNum(conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getNickname());
			pstmt.setString(6, dto.getAddress());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	private int insertNum(Connection conn) {
		int num =-1;
		PreparedStatement pstmt = null;
		String sql = "select max(num) from user_tbl ";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			closeAll(null, pstmt, rs);
		}
	
		return num;
	}
	
	public LoginDTO login(LoginDTO loginParam) {
		LoginDTO login = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_tbl where id = ? and pw = ?"; 
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginParam.getId());
			pstmt.setString(2, loginParam.getPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int num = rs.getInt("num");
				String nickname = rs.getString("nickname");
				String address = rs.getString("address");
				String name = rs.getString("name");
				String day = rs.getString("day");
				login = new LoginDTO();
				login.setId(loginParam.getId());
				login.setNickname(nickname);
				login.setNum(num);
				login.setAddress(address);
				login.setName(name);
				login.setDay(day);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return login;
	}
	
}
