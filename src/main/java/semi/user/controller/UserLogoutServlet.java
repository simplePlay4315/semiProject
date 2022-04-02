package semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * 로그아웃 기능 : 세션을 없애고 초기화 하는 과정
 *
 */
@WebServlet(name="logout" , urlPatterns = "/logout")
public class UserLogoutServlet  extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		if(session != null) {
			session.invalidate(); // 세션을 없애는 코드 
		}
		StringBuffer backPage = new StringBuffer(req.getHeader("Referer"));
		String location = backPage.substring(backPage.indexOf("0") + 1);
		
		if(location.contains("myPage") == true || location.contains("update") == true) {
			resp.sendRedirect(req.getContextPath() + "/");
			return;
		}
		
		req.setAttribute("location",location);
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	

}