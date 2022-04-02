package semi.wish.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.user.model.vo.User;
import semi.wish.model.service.WishService;
import semi.wish.model.vo.Wish;

@WebServlet("/myPage/wishList")
public class WishListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private WishService service = new WishService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User loginUser = (User) req.getSession().getAttribute("loginUser"); 
		if(loginUser == null) {
			// 예외 
			return; 
		}
		List<Wish> list = service.getWishList(loginUser.getUserId()); 
		req.setAttribute("list", list);
		req.getRequestDispatcher("/views/user/myPage/wishList.jsp").forward(req, resp);
	}

}
