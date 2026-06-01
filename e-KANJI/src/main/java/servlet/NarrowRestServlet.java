package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.RestaurantDAO;
import model.entity.RestBean;

/**
 * Servlet implementation class NarrowRestServlet
 */
@WebServlet("/narrow-rest-servlet")
public class NarrowRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NarrowRestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		List<RestBean> narrowList = null;

		String keyword=request.getParameter("keyword");
		int genre = Integer.parseInt(request.getParameter("genre"));
		int category = Integer.parseInt(request.getParameter("category"));
		int beer=Integer.parseInt(request.getParameter("beer"));
		double review=Double.parseDouble(request.getParameter("review"));
		int capacity=Integer.parseInt(request.getParameter("capacity"));
		int log=Integer.parseInt(request.getParameter("log"));
		int distance=Integer.parseInt(request.getParameter("distance"));
		int budget=Integer.parseInt(request.getParameter("budget"));
		int smoke=Integer.parseInt(request.getParameter("smoke"));
/*
		String genre = request.getParameter("genre");
		String category = request.getParameter("category");
		String beer=request.getParameter("beer");
		double review=Double.parseDouble(request.getParameter("review"));
		int capacity=Integer.parseInt(request.getParameter("capacity"));
		int log=Integer.parseInt(request.getParameter("log"));
		int distance=Integer.parseInt(request.getParameter("distance"));
		int budget=Integer.parseInt(request.getParameter("budget"));
		int smoke=Integer.parseInt(request.getParameter("smoke"));
*/
		//PartBean part=new PartBean();

		//part.setUserID(part_user);

		// DAOの生成
		RestaurantDAO dao = new RestaurantDAO();

		try {
			// DAOの利用
			narrowList = dao.narrowselect(keyword, genre, category, beer, review, capacity, log, distance, budget, smoke);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("restList",narrowList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("/select-rest.jsp");
		rd.forward(request, response);

	}
}


