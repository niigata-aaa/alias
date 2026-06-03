package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.ParticipantDAO;
import model.entity.PartBean;

/**
 * Servlet implementation class InsertPartOkServlet
 */
@WebServlet("/insert-part-ok-servlet")
public class InsertPartOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertPartOkServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String url = "insert-part-failure.jsp";

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("user_id");

		request.setCharacterEncoding("UTF-8");

		PartBean part = new PartBean();
		part.setPartName(request.getParameter("part_name"));
		part.setPartRuby(request.getParameter("part_ruby"));
		part.setPartGender(request.getParameter("part_gender"));
		part.setPartAge(Integer.parseInt(request.getParameter("part_age")));
		part.setPartEmpyear(Integer.parseInt(request.getParameter("part_empyear")));
		part.setPartPostId(Integer.parseInt(request.getParameter("part_post")));
		part.setPartBudget(Integer.parseInt(request.getParameter("part_budget")));
		part.setPartAllergy(request.getParameter("part_allergy"));
		part.setPartGenreId(Integer.parseInt(request.getParameter("part_genre")));
		part.setPartCategoryId(Integer.parseInt(request.getParameter("part_category")));
		part.setPartBeerId(Integer.parseInt(request.getParameter("part_beer")));

		part.setPartSmoke(Integer.parseInt(request.getParameter("part_smoke")));

		ParticipantDAO dao = new ParticipantDAO();
		int result = 0;

		try {

			result = dao.insert(userId, part);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		if (result > 0) {
			url = "insert-part-ok.jsp";
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("part", part);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

		//		PartBean part = new PartBean();
		//
		//		part.setUserID(userId);
		//		part.setPartName(request.getParameter("part_name"));
		//		part.setPartRuby(request.getParameter("part_ruby"));
		//		part.setPartGender(request.getParameter("part_gender"));
		//		part.setPartAge(Integer.parseInt(request.getParameter("part_age")));
		//		part.setPartEmpyear(Integer.parseInt(request.getParameter("part_empyear")));
		//		part.setPartPost(request.getParameter("part_post"));
		//		part.setPartBudget(Integer.parseInt(request.getParameter("part_budget")));
		//		part.setPartAllergy(request.getParameter("part_allergy"));
		//		part.setPartGenre(request.getParameter("part_genre"));
		//		part.setPartCategory(request.getParameter("part_category"));
		//		part.setPartBeer(request.getParameter("part_beer"));
		//		part.setPartSmoke(Integer.parseInt(request.getParameter("part_smoke")));
		//		try {
		//			ParticipantDAO dao = new ParticipantDAO();
		//
		//			dao.insert(part); // ← DB登録
		//
		//			request.setAttribute("part", part);
		//			request.getRequestDispatcher("insert-part-ok.jsp")
		//					.forward(request, response);
		//
		//		} catch (Exception e) {
		//			e.printStackTrace();
		//
		//			// ★失敗時はここへ
		//			request.setAttribute("errorMessage", e.getMessage());
		//			request.getRequestDispatcher("insert-part-fail.jsp")
		//					.forward(request, response);
		//		}
	}
}