package semi.wish.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.wish.model.service.WishService;

@WebServlet("/wish/delete")
public class WishDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private WishService service = new WishService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	

}
