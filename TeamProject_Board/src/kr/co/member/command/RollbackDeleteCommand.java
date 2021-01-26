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

public class RollbackDeleteCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		LoginDTO login =(LoginDTO) session.getAttribute("login");
		
		if(session != null && login != null && login.getMaster() == 1) {
			String numS = request.getParameter("num");
			int num = Integer.parseInt(numS);
			new MemberDAO().RollbackDelete(num);
			return new CommandAction(true, "member.do");
		}
		
			
		return new CommandAction(true, "/TeamProject_Board/mainwarning.jsp");
	}

}
