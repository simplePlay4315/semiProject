package semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.user.model.service.UserService;

@WebServlet("/user/checkId")
public class UserCheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String newId = req.getParameter("userId");
		
		boolean isDuplicated = service.isDuplicated(newId); 
		
		if(isDuplicated == true) {
			resp.getWriter().append("used");
		}else {
			resp.getWriter().append("unUsed");
		}
		
		
	}
}
