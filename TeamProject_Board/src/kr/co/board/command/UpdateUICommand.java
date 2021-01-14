package kr.co.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board.BoardDAO;
import kr.co.board.BoardDTO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;

public class UpdateUICommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String numS = request.getParameter("num");
		int num = Integer.parseInt(numS);
		BoardDTO dto = new BoardDAO().updateui(num);
		request.setAttribute("dto", dto);
		return new CommandAction(false, "update.jsp");
	}

}
