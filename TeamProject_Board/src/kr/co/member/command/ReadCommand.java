package kr.co.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.MemberDAO;
import kr.co.member.MemberDTO;

public class ReadCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		MemberDTO dto = null;
		String numS = request.getParameter("num");
		if(numS != null) {
			int num = Integer.parseInt(numS);
			dto = new MemberDAO().read(num);
			
		}
		String id = request.getParameter("id");
		if(id != null) {
			dto = new MemberDAO().read(id);
		}
		
		request.setAttribute("dto", dto);
		return new CommandAction(false, "read.jsp");
	}

}
