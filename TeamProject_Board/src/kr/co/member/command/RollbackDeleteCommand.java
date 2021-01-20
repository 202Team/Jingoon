package kr.co.member.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.LoginDTO;
import kr.co.member.MemberDAO;

public class RollbackDeleteCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		LoginDTO login =(LoginDTO) session.getAttribute("login");
		
		if(session != null && login != null && login.getMaster() == 1) {
			PrintWriter out = response.getWriter();
			out.print("alert('탈퇴한 회원정보를 되돌립니다')");
			String numS = request.getParameter("num");
			int num = Integer.parseInt(numS);
			new MemberDAO().RollbackDelete(num);
			return new CommandAction(true, "member.do");
		}
		
		PrintWriter out = response.getWriter();
		out.print("alert('관리자계정으로 로그인 해주세요.')");
		
		return new CommandAction(true, "loginui.do");
	}

}
