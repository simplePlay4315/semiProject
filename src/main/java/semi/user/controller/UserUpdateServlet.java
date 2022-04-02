package semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.user.model.service.UserService;
import semi.user.model.vo.User;

@WebServlet("/user/update")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User loginUser = (User) req.getSession().getAttribute("loginUser");
			String userId = req.getParameter("userId");
			if(loginUser.getUserId().equals(userId) == false) {
				// 예외  
				return;
			} 
			User updateUser = new User();
			updateUser.setUserId(userId);
			updateUser.setUserName(req.getParameter("userName"));
			updateUser.setEmail(req.getParameter("email"));
			updateUser.setPhone(req.getParameter("phone"));
			updateUser.setGender(req.getParameter("gender"));
			updateUser.setAddress(req.getParameter("address"));
			
			int result = service.updateUser(updateUser);  
			
			if(result > 0) {
				req.setAttribute("msg", "변경이 완료되었습니다. 다시 로그인해주세요.");
				req.setAttribute("location", "/logout");
			}else {
				// 예외 
			}
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
		} catch (Exception e) {
			// 예외 
		}
	}
}
