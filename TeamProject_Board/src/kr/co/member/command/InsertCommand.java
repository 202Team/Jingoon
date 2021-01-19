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
		String birth = request.getParameter("birth");
		System.out.println("생일 입력 형식 테스트"+birth);// 생일 입력 테스트
		MemberDTO dto = new MemberDTO(0, id, pw, name, nickname, address, null);
		dto.setBirth(birth);
		new MemberDAO().insert(dto);
				
		return new CommandAction(true, "http://localhost:8089/TeamProject_Board/main.jsp");
	}

}
