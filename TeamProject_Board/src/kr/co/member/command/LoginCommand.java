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

public class LoginCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setId(id);
		loginDTO.setPw(pw);
		LoginDTO login = new MemberDAO().login(loginDTO);
		
		HttpSession session = request.getSession();
		session.setAttribute("login", login);
		//로그인 실패시 회원가입 화면으로
		if(session == null || login == null) {
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/member/insert.jsp");
		}else if (login.getMaster() == -1) { // 회원탈퇴 시 로그인 불가
			session.invalidate();
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/member/insert.jsp");
		}
				
		return new CommandAction(true, "http://localhost:8089/TeamProject_Board/board/list.do");
	}

	
}
