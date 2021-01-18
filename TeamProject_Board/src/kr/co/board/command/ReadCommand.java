package kr.co.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board.BoardDAO;
import kr.co.board.BoardDTO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.fileload.FileDAO;
import kr.co.fileload.FileDTO;

public class ReadCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String boardNumStr = request.getParameter("num");
		String curPageStr = request.getParameter("curPage");
		int curPage = 1;
		if(curPageStr != null) {
			curPage = Integer.parseInt(curPageStr);
		}
		
		int num = Integer.parseInt(boardNumStr);
		BoardDTO dto = new BoardDAO().read(num);
		request.setAttribute("dto", dto);
		request.setAttribute("curPage", curPage);
		// 파일 정보 추가 바인딩
		FileDTO dtoFile = new FileDAO().select(num);
		request.setAttribute("dtoFile", dtoFile);
		return new CommandAction(false, "read.jsp");
	}

}
