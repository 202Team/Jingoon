package kr.co.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.MemberDAO;

public class PasswordChange implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String pw = request.getParameter("pw");
		new MemberDAO().passwordChange(pw);
		return new CommandAction(true, "/main.jsp");
	}

}
