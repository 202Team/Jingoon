package kr.co.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board.BoardDAO;
import kr.co.board.PageTO;
import kr.co.command.Command;
import kr.co.domain.CommandAction;



public class ListCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String curPageStr = request.getParameter("curPage");
		int curPage = 1;
		
		if(curPageStr != null) {
			curPage = Integer.parseInt(curPageStr);
			int amount = new BoardDAO().getAmount();
			PageTO ato = new PageTO(curPage);
			ato.setAmount(amount);
			int totalPage = ato.getTotalPage();
			if(curPage<0) {
				curPage = 1;
			}else if(curPage > totalPage) {
				curPage = totalPage;
			}
		}

		PageTO to = new BoardDAO().page(curPage);
		request.setAttribute("list", to.getList());
		request.setAttribute("to", to);

		return new CommandAction(false, "list.jsp");
	}

}
