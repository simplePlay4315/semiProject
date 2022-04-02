package semi.reservation.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.fishing.model.service.FishingService;
import semi.fishing.model.vo.Fishing;
import semi.reservation.model.service.ReserveService;
import semi.reservation.model.vo.Reserve;
import semi.user.model.vo.User;

@WebServlet("/fishing/reserve/result")
public class ReserveResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReserveService resService = new ReserveService();
	private FishingService fishingService = new FishingService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int fishingNo = Integer.parseInt(req.getParameter("fishingNo")); 
			Fishing fishing = fishingService.findFishingByNo(fishingNo, false);
			Date date = Date.valueOf(req.getParameter("date"));
			User loginUser = (User)req.getSession().getAttribute("loginUser");
			int peopleNum = Integer.parseInt(req.getParameter("peopleNum"));
			
			Reserve res = new Reserve();
			res.setFishing(fishing);
			res.setUserId(loginUser.getUserId());
			res.setResDate(date);
			res.setUserNum(peopleNum);
			
			int result = resService.saveRes(res); 
			
			if(result > 0) {
				req.setAttribute("reservation", res);
				req.getRequestDispatcher("/views/reservation/result.jsp").forward(req, resp);
			}else {
				req.setAttribute("msg", "오류가 발생하였습니다.");
				req.setAttribute("location", "/");
				req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			req.setAttribute("msg", "잘못된 접근입니다.");
			req.setAttribute("location", "/index.html");
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
		}
	}
}
