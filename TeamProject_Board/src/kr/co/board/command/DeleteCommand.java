package kr.co.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board.BoardDAO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.LoginDTO;

public class DeleteCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String numS = request.getParameter("num");
		int num = Integer.parseInt(numS);
		
		HttpSession session = request.getSession(false);
		LoginDTO login = (LoginDTO) session.getAttribute("login");
		if(session != null && login != null ) {
			new BoardDAO().delete(num);
		}
		
		return new CommandAction(true, "list.do");
	}

}
