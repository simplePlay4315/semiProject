package semi.fish.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.fish.model.service.FishService;
import semi.fish.model.vo.Fish;

@WebServlet("/fish/view")
public class FishViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private FishService service = new FishService(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int fishNo = Integer.parseInt(req.getParameter("fishNo")); 
		Fish fish = service.findFishByNo(fishNo);
		req.setAttribute("fish", fish);
		req.getRequestDispatcher("/views/fish/view.jsp").forward(req, resp);
		
	}
}
