package kr.co.fileload.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.board.BoardDAO;
import kr.co.board.BoardDTO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.fileload.FileDAO;
import kr.co.fileload.FileDTO;

public class FileUploadCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String realPath = request.getServletContext().getRealPath("fileload");
		int maxPostSize = 1024*1024*10;
		MultipartRequest multi = new MultipartRequest(request, realPath, maxPostSize, "utf-8", new DefaultFileRenamePolicy());
		String id = multi.getParameter("id");
		String orgFileName = multi.getOriginalFileName("filename");
		String sysFileName = multi.getFilesystemName("filename");
				
		String author = multi.getParameter("author");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		BoardDTO dto =new BoardDTO(0, author, title, content, null, 0, 0, 0, 0);
		dto.setId(id);
		int boardNum = new BoardDAO().insert(dto);
		FileDTO dtoF = new FileDTO(0, realPath, id, sysFileName, orgFileName, boardNum);
		
		new FileDAO().upload(dtoF);
	
		
		return new CommandAction(true, "http://localhost:8089/TeamProject_Board/board/list.do");
	}

}
