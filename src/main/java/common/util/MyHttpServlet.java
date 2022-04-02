package common.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.user.model.vo.User;

public abstract class MyHttpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 공통 문자열 영역
	public static final String SESSION_USER_ID = "loginUser";
	
	abstract public String getServletName();

	// 공통 common page send 기능
	public void sendCommonPage(String msg, String path, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", path);
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}
	
	protected User getSessionUser(HttpServletRequest req) {
		try {
			HttpSession session = req.getSession();
			User loginUser = (User)session.getAttribute(SESSION_USER_ID);
			return loginUser;
		} catch (Exception e) {}
		return null;
	}
}
