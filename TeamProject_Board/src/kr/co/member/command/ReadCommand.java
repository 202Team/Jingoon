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
		String numS = request.getParameter("num");
		int num = Integer.parseInt(numS);
		MemberDTO dto = new MemberDAO().read(num);
		
		request.setAttribute("dto", dto);
		
		
		return new CommandAction(false, "read.jsp");
	}

}
