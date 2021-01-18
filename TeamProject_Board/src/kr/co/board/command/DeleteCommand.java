package kr.co.board.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board.BoardDAO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.fileload.FileDAO;
import kr.co.fileload.FileDTO;
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
			//첨부파일 디렉토리 파일삭제(게시글의 글번호로 조회, 삭제)
			FileDTO dtoF= new FileDAO().select(num);
			String filePath = dtoF.getRealPath() + File.separator + dtoF.getSysFileName();
			File file = new File(filePath);
			file.delete();
			// DB의 파일 정보 삭제
			new FileDAO().delete(num);
			
		}
		
		return new CommandAction(true, "list.do");
	}

}
