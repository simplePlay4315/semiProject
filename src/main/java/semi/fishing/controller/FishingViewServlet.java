package semi.fishing.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.fishing.model.service.FishingService;
import semi.fishing.model.vo.Fishing;

@WebServlet("/fishing/view")
public class FishingViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private FishingService service = new FishingService(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int fishingNo = Integer.parseInt(req.getParameter("fishingNo"));
		Fishing fishing = service.findFishingByNo(fishingNo, true);
		
		// 예외 추가 
		
		req.setAttribute("fishing", fishing);
		req.getRequestDispatcher("/views/fishing/view.jsp").forward(req, resp);
	}
	
	

}
