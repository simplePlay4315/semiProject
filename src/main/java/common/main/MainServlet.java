package common.main;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.fishing.model.service.FishingService;
import semi.fishing.model.vo.Fishing;

@WebServlet("/index.html")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FishingService fishingService = new FishingService(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Fishing> list1 = fishingService.getRecommendList("바다"); 
		List<Fishing> list2 = fishingService.getRecommendList("저수지"); 
		List<Fishing> list3 = fishingService.getRecommendList("평지"); 
		List<Fishing> list4 = fishingService.getRecommendList("실내");
		
		req.setAttribute("list1", list1);
		req.setAttribute("list2", list2);
		req.setAttribute("list3", list3);
		req.setAttribute("list4", list4);
		req.getRequestDispatcher("views/main.jsp").forward(req, resp);
	}
}
