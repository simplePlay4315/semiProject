package semi.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.fishing.model.service.FishingService;
import semi.fishing.model.vo.Fishing;
import semi.user.model.vo.User;

@WebServlet("/fishing/reserve/select")
public class ReserveSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FishingService service = new FishingService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User loginUser = (User)req.getSession().getAttribute("loginUser");
		
		if(loginUser == null) {
			req.setAttribute("msg", "로그인이 필요합니다.");
			req.setAttribute("location", "/");
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
			return;
		}
		
		try {
			int fishingNo = Integer.parseInt(req.getParameter("fishingNo")); 
			Fishing fishing = service.findFishingByNo(fishingNo, false); 
			req.setAttribute("fishing", fishing); 
			req.getRequestDispatcher("/views/reservation/select.jsp").forward(req, resp);
		} catch (Exception e) {
			req.setAttribute("msg", "잘못된 접근입니다.");
			req.setAttribute("location", "/index.html");
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
		}
	}
}
