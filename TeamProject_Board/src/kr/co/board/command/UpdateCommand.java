package kr.co.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board.BoardDAO;
import kr.co.board.BoardDTO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.LoginDTO;

public class UpdateCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		if(session ==null){
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/loginui.do");
		}
		LoginDTO login =(LoginDTO) session.getAttribute("login");
		if(login == null) {
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/loginui.do");
		}
		
		String numS = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		int num = Integer.parseInt(numS);
		BoardDTO dto = new BoardDTO(num, author, title, content, null, 0, 0, 0, 0);
		new BoardDAO().update(dto);
		return new CommandAction(false, "read.do?num="+num);
	}

}
