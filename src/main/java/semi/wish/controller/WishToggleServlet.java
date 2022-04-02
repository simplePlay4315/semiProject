package semi.wish.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.fishing.model.vo.Fishing;
import semi.user.model.vo.User;
import semi.wish.model.service.WishService;
import semi.wish.model.vo.Wish;

@WebServlet("/fishing/wish")
public class WishToggleServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private WishService service = new WishService(); 

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			User loginUser = (User)session.getAttribute("loginUser");
			int fishingNo = Integer.parseInt(req.getParameter("fishingNo"));
			Wish wish = service.wishCheck(fishingNo, loginUser.getUserId());
			
			if(wish == null) {
				wish = new Wish();
				wish.setUserId(loginUser.getUserId());
				Fishing fishing = new Fishing();
				fishing.setNo(fishingNo);
				wish.setFishing(fishing);
				resp.getWriter().append("like"); 
			}else {
				resp.getWriter().append("unLike");
			}
			
			int result = service.wishToggle(wish);
			
			if(result < 1) {
				resp.getWriter().append("fail");
			}
			
		} catch (Exception e) {
			// 로그인 요청부 
		}
	}
	
}
