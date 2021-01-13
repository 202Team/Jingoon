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

public class DeleteCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String numS =request.getParameter("num");
		int num = Integer.parseInt(numS);
		// 로그인 유지 확인
		HttpSession session = request.getSession(false);
		if (session == null) {
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/login.jsp");
		}
		LoginDTO login = (LoginDTO) session.getAttribute("login");
		if (login == null || num != login.getNum()) {
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/login.jsp");
		}
		// 이후 추가 탈퇴시 삭제가 아닌 회원정보에 탈퇴정보를 표시해서 로그인불가
		new MemberDAO().delete(num);
				
		return new CommandAction(true, "http://localhost:8089/TeamProject_Board/logout.do");
	}

}
