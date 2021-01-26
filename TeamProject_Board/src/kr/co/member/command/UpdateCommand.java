package kr.co.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.LoginDTO;
import kr.co.member.MemberDAO;
import kr.co.member.MemberDTO;

public class UpdateCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String numS = request.getParameter("num");
		int num = Integer.parseInt(numS);
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth");
		// 로그인 유지 확인
		HttpSession session = request.getSession(false);
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		if(session == null || login == null ) {
			return new CommandAction(true, "/TeamProject_Board/login.jsp");
		}else if(!id.equals(login.getId())){
			if(login.getMaster() == 1) {
				MemberDTO dto = new MemberDTO(num, id, null, name, nickname, address, null); 
				dto.setBirth(birth);
				new MemberDAO().update(dto);
				return new CommandAction(true, "/TeamProject_Board/member.do");
			}
			return new CommandAction(true, "/TeamProject_Board/mainwarning.jsp");
		}
		
		MemberDTO dto = new MemberDTO(num, id, null, name, nickname, address, null); 
		dto.setBirth(birth);
		new MemberDAO().update(dto);
		
		//수정후 재 로그인
		
		if(session != null) {
			//로그아웃
			session.removeAttribute("login");
			//로그인
			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setId(id);
			loginDTO.setPw(new MemberDAO().read(id).getPw());
			login = new MemberDAO().login(loginDTO);
						
			session.setAttribute("login", login);
		}
		return new CommandAction(false, "read.do?id="+id);
	}

}
