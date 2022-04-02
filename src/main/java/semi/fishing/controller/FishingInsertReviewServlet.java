package semi.fishing.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.fishing.model.service.FishingService;
import semi.fishing.model.vo.Review;

@WebServlet("/fishing/review")
public class FishingInsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FishingService service = new FishingService(); 
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId"); 
		String content = req.getParameter("content"); 
		int fishingNo = Integer.parseInt(req.getParameter("fishingNo"));
		int rating = 1;
		try {
			rating = Integer.parseInt(req.getParameter("rating"));
		} catch (Exception e) {}
		
		Review review = new Review(0, fishingNo, userId, content, null, rating);
		
		int result = service.saveReview(review); 
		
		if(result > 0) {
			req.setAttribute("msg", "댓글이 입력되었습니다.");
			req.setAttribute("location", "/fishing/view?fishingNo=" + fishingNo);
		}else {
			
		}
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}

}
