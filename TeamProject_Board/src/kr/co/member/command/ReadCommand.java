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

public class ReadCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		MemberDTO mdto = null;
		String numS = request.getParameter("num");
		HttpSession session = request.getSession(false);
		LoginDTO login = (LoginDTO)session.getAttribute("login");
				
		if(session == null ||login == null) {
			return new CommandAction(true, "/TeamProject_Board/login.jsp");
		}
		if(numS != null) {
			int num = Integer.parseInt(numS);
			mdto = new MemberDAO().read(num);
			if(login.getNum() != num) {
				return new CommandAction(true, "/TeamProject_Board/mainwarning.jsp");
			}
			
		}else {
			String id = request.getParameter("id");
			mdto = new MemberDAO().read(id);
			if(id == null) {
				return new CommandAction(true, "/TeamProject_Board/mainwarning.jsp");
			}
		}
				
		request.setAttribute("mdto", mdto);
		return new CommandAction(false, "read.jsp");
	}

}
