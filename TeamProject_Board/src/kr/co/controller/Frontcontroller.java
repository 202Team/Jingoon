package kr.co.controller;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.member.MemberDAO;
import kr.co.domain.CommandAction;

@WebServlet("*.do")
public class Frontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Frontcontroller() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String sp = uri.substring(cp.length());
		
		Command com = null;
		MemberDAO dao = new MemberDAO();
		Map<String, String> menu =dao.menu();
		String fullname = menu.get(sp);
		System.out.println("sp("+sp+")를 요청");
		try {
			Class<?> testClass = Class.forName(fullname);
			Constructor<?> cons = testClass.getConstructor();
			com = (Command) cons.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(fullname != null) {
			if(com != null) {
				
				CommandAction ca =com.execute(request, response);
				if(ca == null) {// 파일 다운로드 시 요청을 끝내고 null값을 반환해 요청을 끝낸다
					return;
				}
				if(ca.isRedirect()) {
					response.sendRedirect(ca.getWhere());
				}else {
					request.getRequestDispatcher(ca.getWhere()).forward(request, response);
				}
				
			}else {
				System.out.println("sp("+sp+")를 요청, com is null");
			}
		}else {
			System.out.println("sp("+sp+")를 요청,fullname is null");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
