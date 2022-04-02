package semi.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.reservation.model.service.ReserveService;

@WebServlet("/fishing/reserve/cancle")
public class ReserveCancleServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ReserveService service = new ReserveService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int resNo = Integer.parseInt(req.getParameter("resNo"));
			int result = service.cancleRes(resNo); 
			
			if(result > 0) {
				req.setAttribute("msg", "예약이 정상적으로 취소되었습니다.");
				req.setAttribute("location", "/myPage/resList");
			}else {
				
			}
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
		}catch (Exception e) {
			
		}
	}
}
