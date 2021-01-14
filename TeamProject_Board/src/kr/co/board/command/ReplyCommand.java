package kr.co.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board.BoardDAO;
import kr.co.board.BoardDTO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;

public class ReplyCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		String oriNumS = request.getParameter("oriNum");
		int oriNum = Integer.parseInt(oriNumS);
		
		BoardDTO dto =new BoardDTO(0, author, title, content, null, 0, 0, 0, 0);
		dto.setId(id);
		new BoardDAO().reply(dto, oriNum);
		
		return new CommandAction(true, "list.do");
	}

}
