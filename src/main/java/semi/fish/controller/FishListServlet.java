package semi.fish.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.fish.model.service.FishService;
import semi.fish.model.vo.Fish;

@WebServlet("/fish/list")
public class FishListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private FishService service = new FishService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Fish> list = service.getFishList();  
		req.setAttribute("list", list); 
		req.getRequestDispatcher("/views/fish/list.jsp").forward(req, resp); 
	}
}
