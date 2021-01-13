package kr.co.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.MemberDAO;
import kr.co.member.MemberDTO;


public class InsertCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw1");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String address = request.getParameter("address");
				
		MemberDTO dto = new MemberDTO(0, id, pw, name, nickname, address, null);
		MemberDAO dao = new MemberDAO();
		dao.insert(dto);
				
		return new CommandAction(true, "http://localhost:8089/TeamProject_Board/main.jsp");
	}

}
