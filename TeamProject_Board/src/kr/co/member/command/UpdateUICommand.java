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

public class UpdateUICommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String numS = request.getParameter("num");
		int num = Integer.parseInt(numS);
		MemberDTO dto = new MemberDAO().updateui(num);
		
		HttpSession session = request.getSession(false);
		if(session == null) {
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/login.jsp");
		}
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		if(login == null || !(num == login.getNum())){
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/login.jsp");
		}
		
		request.setAttribute("dto", dto);
		
		return new CommandAction(false, "update.jsp");
	}

}
