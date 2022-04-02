package semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.user.model.service.UserService;
import semi.user.model.vo.User;

@WebServlet(name="enroll", urlPatterns = "/enroll")
public class UserEnrollServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/enroll.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User user = new User(); 
			user.setUserId(req.getParameter("userId"));
			user.setUserPw(req.getParameter("userPw"));
			user.setUserName(req.getParameter("userName"));
			user.setGender(req.getParameter("gender"));
			user.setEmail(req.getParameter("email"));
			user.setAddress(req.getParameter("area"));
			user.setPhone(req.getParameter("phone"));
			
			System.out.println(user);
			
			int result = service.enroll(user); 
			
			if(result > 0) {
				req.setAttribute("msg", "회원가입에 성공하였습니다.");
				req.setAttribute("location", "/");
			}else {
				req.setAttribute("msg", "회원가입에 실패하였습니다.");
				req.setAttribute("location", "/");
			}
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
		} catch (Exception e) {
			req.setAttribute("msg", "회원가입에 실패하였습니다.");
			req.setAttribute("location", "/");
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
		}
	}
}
