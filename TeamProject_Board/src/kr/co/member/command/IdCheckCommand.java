package kr.co.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.CommandAction;
import kr.co.member.MemberDAO;

public class IdCheckCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String id = request.getParameter("id");

		// DB를 통해서 id 비교
		String msg = null;
		msg = new MemberDAO().checkId(id);
		
		
		if(id != null) {		
			if (id.equals(msg)) {
				msg = "이미 존재하는 아이디 입니다";
			} else {
				msg ="사용 가능합니다";
			}
		}else {
			msg = "아이디를 입력해주세요";
		}
		request.setAttribute("msg", msg);
		System.out.println(id);// id출력확인용
		System.out.println(msg);// 체크id 출력 확인용
		return new CommandAction(false, "result.jsp");
	}

}
