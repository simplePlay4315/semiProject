package semi.fishing.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.KeywordInfo;
import common.util.PageInfo;
import semi.fish.model.service.FishService;
import semi.fishing.model.service.FishingService;
import semi.fishing.model.vo.Fishing;

@WebServlet("/fishing/list")
public class FishingListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private FishingService service = new FishingService();
	private FishService fishService = new FishService(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int page = 1;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {}
		
		String area = req.getParameter("area"); 
		String type = req.getParameter("type"); 
		String fishName = req.getParameter("fishName");
		String title = req.getParameter("title"); 
		KeywordInfo keyInfo = new KeywordInfo(area, type, title, fishName);
		int count = service.getFishingCount(keyInfo); 
		PageInfo pageInfo = new PageInfo(page, 10, count, 9); 
		
		List<Fishing> list = service.getFishingList(pageInfo, keyInfo);
		List<String> fishList = fishService.getFishNameList(); 
		req.setAttribute("pageInfo", pageInfo);
		req.setAttribute("list", list);
		req.setAttribute("fishList", fishList);
		req.setAttribute("keyInfo", keyInfo);
		req.getRequestDispatcher("/views/fishing/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
