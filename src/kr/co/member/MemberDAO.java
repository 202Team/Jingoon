package kr.co.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
		String sql = "select * from user_tbl where id=? "; 
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbid = rs.getString("id");
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
		String sql ="insert into user_tbl (num, id, pw, name, nickname, address, birth) values (?,?,?,?,?,?,?) ";
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
			pstmt.setString(7, dto.getBirth());	
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
	
	public MemberDTO read(String id) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_tbl where id = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int num = rs.getInt("num");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String nickname = rs.getString("nickname");
				String address = rs.getString("address");
				String day = rs.getString("day");
				dto = new MemberDTO(num, id, pw, name, nickname, address, day);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return dto;
	}
	
	public MemberDTO read(int num) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_tbl where num = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String nickname = rs.getString("nickname");
				String address = rs.getString("address");
				String day = rs.getString("day");
				String birth = rs.getString("birth");
				if(birth != null) {
					birth = birth.substring(0,10);
				}
				dto = new MemberDTO(num, id, pw, name, nickname, address, day);
				dto.setBirth(birth);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return dto;
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
				int master = rs.getInt("master");
				login = new LoginDTO();
				login.setId(loginParam.getId());
				login.setNickname(nickname);
				login.setNum(num);
				login.setAddress(address);
				login.setName(name);
				login.setDay(day);
				login.setMaster(master);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return login;
	}

	public MemberDTO updateui(String id) {

		return read(id);
	}
	public MemberDTO updateui(int num) {

		return read(num);
	}

	public void update(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update user_tbl set name = ?, nickname = ?, address = ?, birth = ? where num = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getBirth());
			pstmt.setInt(5, dto.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}

	public void delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from user_tbl where num = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}

	public List<MemberDTO> list() {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from user_tbl order by num asc";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getNString("id");
				String pw = rs.getString("pw");
				String nickname = rs.getString("nickname");
				String address = rs.getString("address");
				String name = rs.getString("name");
				String day = rs.getString("day");
				String birth = rs.getString("birth");
				if(birth !=null) {
					birth = birth.substring(0, 10);
				}
				int master = rs.getInt("master");
				int age = getAge(conn, num);
				MemberDTO dto = new MemberDTO(num, id, pw, name, nickname, address, day, birth);
				dto.setMaster(master);
				dto.setAge(age);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return list;
	}

	private int getAge(Connection conn, int num) {
		int age = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = 
				"select a.num, b.한국나이 from user_tbl a, (select num, (to_char(sysdate, 'YYYY') - to_char(birth, 'YYYY')) + 1 as 한국나이 from user_tbl) b where a.num = b.num and a.num = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String a = rs.getString("한국나이");
				if(a != null) {
					age = Integer.parseInt(a) ;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, rs);
		}
		return age;
	}

	public void ConfirmDelete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update user_tbl set master = -1 where num = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	public void RollbackDelete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update user_tbl set master = 0 where num = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	
}
