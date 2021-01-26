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
		String id = request.getParameter("id");
		// 로그인 유지 확인
		HttpSession session = request.getSession(false);
		LoginDTO login = (LoginDTO) session.getAttribute("login");
		if (session == null || login == null ) {
			return new CommandAction(true, "/TeamProject_Board/login.jsp");
		}else if (num != login.getNum()) {
			if(login.getMaster() == 1) {
				if(numS != null) {
					new MemberDAO().ConfirmDelete(num);
					return new CommandAction(true, "/TeamProject_Board/member.do");
				}else {
					new MemberDAO().ConfirmDelete(id);
					return new CommandAction(true, "/TeamProject_Board/member.do");
				}
			}
			return new CommandAction(true, "/TeamProject_Board/mainwarning.jsp");
		}
		//회원정보에 탈퇴정보를 표시해서 로그인불가
		new MemberDAO().ConfirmDelete(num);
				
		return new CommandAction(true, "/TeamProject_Board/logout.do");
	}

}
