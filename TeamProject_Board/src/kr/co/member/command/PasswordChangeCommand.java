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

public class PasswordChangeCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String pw = request.getParameter("pw1");
		String oripw = request.getParameter("oripw");
		HttpSession session = request.getSession(false);
		LoginDTO login = (LoginDTO) session.getAttribute("login");
		String LoginPw = new MemberDAO().read(login.getNum()).getPw();//login정보에 pw를 가지고 있지 않아서 회원번호로 조회
		
		if (session == null || login == null ) {
			return new CommandAction(true, "/TeamProject_Board/login.jsp");
		}else if (!oripw.equals(LoginPw)) {
			return new CommandAction(true, "/TeamProject_Board/mainwarning.jsp");
		}
		new MemberDAO().passwordChange(pw, login.getNum());
		return new CommandAction(true, "/TeamProject_Board/mainsuccess.jsp");
	}

}
