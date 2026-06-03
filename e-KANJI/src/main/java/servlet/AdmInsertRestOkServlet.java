package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.RestaurantDAO;
import model.entity.RestBean;

/**
 * Servlet implementation class AdmInsertRestOkServlet
 */
@WebServlet("/adm-insert-rest-ok")
public class AdmInsertRestOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdmInsertRestOkServlet() {
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

		/*
		String userId = (String) request.getSession().getAttribute("user_id");
		if(userId == null) {
			throw new ServletException("ログインユーザーが見つかりません");
		}
		*/


		RestBean rest = new RestBean();

		rest.setRestName(request.getParameter("rest_name"));
		rest.setRestGenre(request.getParameter("rest_genre"));
		rest.setRestCategory(request.getParameter("rest_category"));
		rest.setRestOpen(request.getParameter("rest_open"));
		rest.setRestClose(request.getParameter("rest_close"));
		rest.setRestNextday(Integer.parseInt(request.getParameter("rest_nextday")));
		rest.setRestDistance(Integer.parseInt(request.getParameter("rest_distance")));
		rest.setRestBudget(Integer.parseInt(request.getParameter("rest_budget")));
		rest.setRestCapacity(Integer.parseInt(request.getParameter("rest_capacity")));
		rest.setRestTel(request.getParameter("rest_tel"));
		rest.setRestAddress(request.getParameter("rest_address"));
		rest.setRestUrl(request.getParameter("rest_url"));
		rest.setRestReview(Double.parseDouble(request.getParameter("rest_review")));
		rest.setRestBeer(request.getParameter("rest_beer"));
		rest.setRestSmoke(Integer.parseInt(request.getParameter("rest_smoke")));
		rest.setRestSmokeroom(Integer.parseInt(request.getParameter("rest_smokeroom")));
		
		try {
			RestaurantDAO dao = new RestaurantDAO();

			dao.insert(rest);    // ← DB登録

			request.setAttribute("rest", rest);
			request.getRequestDispatcher("adm-insert-rest-ok.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();

			// ★失敗時はここへ
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("adm-insert-rest-failure.jsp").forward(request, response);
		}
	}
}
