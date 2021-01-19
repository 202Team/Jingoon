package kr.co.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BoardDAO {
	
	private DataSource dataFactory;
	public BoardDAO() {
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
	
	public int insert(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "insert into myboard (num,author,title,content,repRoot,repStep,repIndent,id) "
				+ "values (?,?,?,?,?,?,?,?)";
		try {
			conn = dataFactory.getConnection();
			num = insertNum(conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getAuthor());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, num);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setString(8, dto.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return num;
		
	}
	
	private int insertNum(Connection conn) {
		int num =-1;
		PreparedStatement pstmt = null;
		String sql = "select max(num) from myboard ";
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
	
	public List<BoardDTO> list() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from myboard order by repRoot desc, repStep asc";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String writedayfull = rs.getString("writeday");
				String writeday = writedayfull.substring(0, 10);
				int readcnt = rs.getInt("readcnt");
				int repRoot = rs.getInt("repRoot");
				int repStep = rs.getInt("repStep");
				int repIndent = rs.getInt("repIndent");
				BoardDTO dto = new BoardDTO(num, author, title, null, writeday, readcnt, repRoot, repStep, repIndent);
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			closeAll(conn, pstmt, rs);
		}
		
		return list;
	}

	public BoardDTO read(int num) {
		BoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from myboard where num = ?";
		ResultSet rs = null;
		boolean isOk= false;
		try {
			conn = dataFactory.getConnection();
			conn.setAutoCommit(false);
			readcntAdd(conn, num);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readcnt = rs.getInt("readcnt");
				int repRoot = rs.getInt("repRoot");
				int repStep = rs.getInt("repStep");
				int repIndent = rs.getInt("repIndent");
				String id = rs.getString("id");
			dto = new BoardDTO(num, author, title, content, writeday, readcnt, repRoot, repStep, repIndent);
			dto.setId(id);
			}
		isOk = true;
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			transaction(conn, isOk);
			closeAll(conn, pstmt, rs);
		}
		return dto;
	}

	private void readcntAdd(Connection conn, int num) {
		PreparedStatement pstmt = null;
		String sql ="update myboard set readcnt = readcnt+1 where num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}
		
	}

	public BoardDTO updateui(int num) {
		BoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from myboard where num = ?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readcnt = rs.getInt("readcnt");
				int repRoot = rs.getInt("repRoot");
				int repStep = rs.getInt("repStep");
				int repIndent = rs.getInt("repIndent");
				String id = rs.getString("id");
			dto = new BoardDTO(num, author, title, content, writeday, readcnt, repRoot, repStep, repIndent);
			dto.setId(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			closeAll(conn, pstmt, rs);
		}
		return dto;
	}

	public void update(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update myboard set author=?, title = ?, content = ?, writeday=sysdate  where num = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAuthor());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
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
		String sql = "delete from myboard where num = ?";
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
	public void blind(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update myboard set author= ?, title=?, content =? where num = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "BLIND");
			pstmt.setString(2, "BLIND");
			pstmt.setString(3, "BLIND");
			pstmt.setInt(4, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	
	 public boolean blindYes(int num) {
		 boolean ok = false;
		 Connection conn = null;
		 PreparedStatement  pstmt = null;
		 String sql = "select count(num) from myboard where repRoot = ?"; 
		 ResultSet rs = null;
		 try {
			conn = dataFactory.getConnection();
			BoardDTO dto = read(num);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getRepRoot());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
				if(count > 1) ok = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		 return ok;
	 }	

	public void reply(BoardDTO dto, int oriNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into myboard (num,author,title,content,repRoot,repStep,repIndent,id) "
				+ "values (?,?,?,?,?,?,?,?)";
		boolean isOk =false;
		try {
			conn = dataFactory.getConnection();
			conn.setAutoCommit(false);
			int num = insertNum(conn);
			BoardDTO oriDTO = read(oriNum);
			insertReplyOption(conn, oriDTO);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getAuthor());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, oriDTO.getRepRoot());
			pstmt.setInt(6, oriDTO.getRepStep()+1);
			pstmt.setInt(7, oriDTO.getRepIndent()+1);
			pstmt.setString(8, dto.getId());
			pstmt.executeUpdate();
			isOk =  true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			transaction(conn, isOk);
			closeAll(conn, pstmt, null);
		}
	}

	private void transaction(Connection conn, boolean isOk) {
		try {
			if (isOk) {
				conn.commit();
			}else {
				conn.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}

	private void insertReplyOption(Connection conn, BoardDTO oriDTO) {
		PreparedStatement pstmt = null;
		String sql = "update myboard set repStep = repStep +1 where repRoot = ? and repStep > ?";
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, oriDTO.getRepRoot());
			pstmt.setInt(2, oriDTO.getRepStep());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}
	}
	
	public PageTO page(int curPage) {
		PageTO to = new PageTO(curPage);
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from "
				+ "(select rownum rnum, num,author,title,writeday,readcnt,repRoot,repStep,repIndent,id from "
				+ "(select * from myboard order by repRoot desc, repStep asc ))"
				+ "where rnum between ? and ?";
		try {
			conn = dataFactory.getConnection();
			int amount = getAmount(conn);
			to.setAmount(amount);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, to.getStarNum());
			pstmt.setInt(2, to.getEndNum());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String writeday =rs.getString("writeday");
				int readcnt = rs.getInt("readcnt");
				int repRoot = rs.getInt("repRoot");
				int repStep = rs.getInt("repStep");
				int repIndent = rs.getInt("repIndent");
				String id = rs.getString("id");
				BoardDTO dto = new BoardDTO(num, author, title, null, writeday, readcnt, repRoot, repStep, repIndent, id);
				list.add(dto);
			}
			to.setList(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return to;
	}

	private int getAmount(Connection conn) {
		int amount = 0;
		PreparedStatement pstmt = null;
		String sql = "select count(num) from myboard";
		ResultSet rs= null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				amount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, rs);
		}
		return amount;
	}
	
	public int getAmount(String searchname, String searchkeyword) {
		int amount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select count(num) from myboard where lower("+searchname+") like lower(?)";
		ResultSet rs= null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchkeyword+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				amount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return amount;
	}

	public int getAmount() {
		int amount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select count(num) from myboard";
		ResultSet rs= null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				amount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return amount;
	}

	public PageTO searchPage(String searchname, String searchkeyword, int curPage) {
		PageTO to = new PageTO(curPage);
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from "
				+ "(select rownum rnum, num,author,title,writeday,readcnt,repRoot,repStep,repIndent,id from "
				+ "(select * from myboard "
				+ "where lower("+searchname+") like lower(?) order by repRoot desc, repStep asc )) "
				+ "where rnum between ? and ?";
		try {
			conn = dataFactory.getConnection();
			int amount = getAmount(searchname, searchkeyword );
			to.setAmount(amount);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchkeyword+"%");
			pstmt.setInt(2, to.getStarNum());
			pstmt.setInt(3, to.getEndNum());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String writeday =rs.getString("writeday");
				int readcnt = rs.getInt("readcnt");
				int repRoot = rs.getInt("repRoot");
				int repStep = rs.getInt("repStep");
				int repIndent = rs.getInt("repIndent");
				String id = rs.getString("id");
				BoardDTO dto = new BoardDTO(num, author, title, null, writeday, readcnt, repRoot, repStep, repIndent, id);
				list.add(dto);
			}
			to.setList(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return to;
	}

	
	
	
	

}
