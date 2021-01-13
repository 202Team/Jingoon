package kr.co.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.LoginDTO;
import kr.co.member.MemberDAO;
import kr.co.member.MemberDTO;

public class UpdateCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String numS = request.getParameter("num");
		int num = Integer.parseInt(numS);
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String address = request.getParameter("address");
		// 로그인 유지 확인
		HttpSession session = request.getSession(false);
		if(session == null) {
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/login.jsp");
		}
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		if(login == null || !id.equals(login.getId())){
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/login.jsp");
		}
		
		MemberDTO dto = new MemberDTO(num, id, null, name, nickname, address, null); 
		new MemberDAO().update(dto);
		
		
		return new CommandAction(false, "read.do?id="+id);
	}

}
