package kr.co.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board.BoardDAO;
import kr.co.board.BoardDTO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;

public class ReadCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String boardNumStr = request.getParameter("num");
		int num = Integer.parseInt(boardNumStr);
		BoardDTO dto = new BoardDAO().read(num);
		request.setAttribute("dto", dto);
		return new CommandAction(false, "read.jsp");
	}

}
