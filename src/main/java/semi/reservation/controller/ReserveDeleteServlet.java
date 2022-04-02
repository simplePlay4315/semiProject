package semi.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.reservation.model.service.ReserveService;

@WebServlet("/fishing/reserve/delete")
public class ReserveDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ReserveService service = new ReserveService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int resNo = Integer.parseInt(req.getParameter("resNo"));
			int result = service.deleteRes(resNo); 
			
			if(result > 0) {
				req.setAttribute("msg", "항목에서 제거가 완료되었습니다.");
				req.setAttribute("location", "/myPage/cancleList");
			}else {
				
			}
			req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
		}catch (Exception e) {
			
		}
	}
}
