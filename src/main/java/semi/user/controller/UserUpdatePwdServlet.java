package semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.user.model.service.UserService;
import semi.user.model.vo.User;

@WebServlet(name ="updatePwd" , urlPatterns = "/myPage/updatePwd")
public class UserUpdatePwdServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User loginUser = (User) req.getSession().getAttribute("loginUser");
		
		if(loginUser == null) {
			// 예외
			return;
		}
		String userId = loginUser.getUserId();
		String oldPwd = req.getParameter("userPw");
		String newPwd = req.getParameter("newPassword");
		
		int result = service.updatePwd(userId, oldPwd, newPwd); 
		if(result > 0) {
			req.setAttribute("msg", "성공적으로 변경되었습니다. 다시 로그인 해주세요.");
			req.setAttribute("location", "/logout"); 
		}else {
			//예외
		}
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}
}
