package semi.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.PageInfo;
import semi.reservation.model.service.ReserveService;
import semi.reservation.model.vo.Reserve;
import semi.user.model.vo.User;

@WebServlet("/myPage/cancleList")
public class ReserveCancleListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ReserveService service = new ReserveService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User loginUser = (User) req.getSession().getAttribute("loginUser"); 
		if(loginUser == null) {
			//예외 
			return;
		}
		int page = 1; 
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
				
		int Count = service.getReserveCount("N", loginUser.getUserId()); 
		PageInfo pageInfo = new PageInfo(page, 10, Count, 3);
		List<Reserve> list = service.getReserveNList(pageInfo, loginUser.getUserId());
		
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/user/myPage/cancleList.jsp").forward(req, resp);
	}
}
