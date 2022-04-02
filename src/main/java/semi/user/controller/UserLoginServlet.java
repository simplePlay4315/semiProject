package semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.user.model.service.UserService;
import semi.user.model.vo.User;

@WebServlet(name="login", urlPatterns = "/login")
public class UserLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId"); 
		String userPw = req.getParameter("userPw");
		
		User loginUser = service.login(userId, userPw);
		
		StringBuffer backPage = new StringBuffer(req.getParameter("backPage"));
		
		if(loginUser != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", loginUser); 
			req.setAttribute("location",backPage.substring(backPage.indexOf("0") + 1));
		}else {
			req.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			req.setAttribute("location", "/views/user/login.jsp");
		}
		req.getRequestDispatcher("views/msg.jsp").forward(req, resp);
	} 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/");
	}

}
