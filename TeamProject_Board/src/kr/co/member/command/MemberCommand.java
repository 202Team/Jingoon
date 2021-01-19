package kr.co.member.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.LoginDTO;
import kr.co.member.MemberDAO;
import kr.co.member.MemberDTO;

public class MemberCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		if(session ==null){
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/loginui.do");
		}
		LoginDTO login =(LoginDTO) session.getAttribute("login");
		if(login == null || login.getMaster() != 1 ) {
			return new CommandAction(true, "http://localhost:8089/TeamProject_Board/loginui.do");
		}
		
		List<MemberDTO> list = new MemberDAO().list();
		
		request.setAttribute("list", list);
		
		return new CommandAction(false, "master/member.jsp");
	}

}
