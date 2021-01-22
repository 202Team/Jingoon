package kr.co.fileload.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.util.FileDownload;

public class FileDownloadCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sysFileName = request.getParameter("sysFileName");
		
		FileDownload.fileDownload(request, response, sysFileName, "fileload");
		return null;
	}

}
