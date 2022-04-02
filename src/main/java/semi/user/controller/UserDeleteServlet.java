package semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.user.model.service.UserService;
import semi.user.model.vo.User;

@WebServlet("/myPage/delete")
public class UserDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService(); 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User loginUser = (User) req.getSession().getAttribute("loginUser"); 
		if(loginUser == null) {
			req.setAttribute("msg", "잘못된 접근입니다.");
			req.setAttribute("location", "/");
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
			return; 
		}
		int result = service.deleteUser(loginUser); 
		
		if(result > 0) {
			req.setAttribute("msg", "탈퇴가 정상적으로 처리되었습니다.");
			req.setAttribute("location", "/logout");
		}else {
			
		}
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
		
	}
			
}
