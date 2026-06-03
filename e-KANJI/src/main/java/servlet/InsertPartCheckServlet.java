package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertPartServlet
 */
@WebServlet("/insert-part-check-servlet")
public class InsertPartCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertPartCheckServlet() {
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

//		request.setCharacterEncoding("UTF-8");
//
//		String smokeStr = request.getParameter("part_smoke");
//		String ageStr = request.getParameter("part_age");
//		String empyearStr = request.getParameter("part_empyear");
//		String budgetStr = request.getParameter("part_budget");
//		String name = request.getParameter("part_name");
//		String ruby = request.getParameter("part_ruby");
//		String gender = request.getParameter("part_gender");
//		String post = request.getParameter("part_post");
//		String allergy = request.getParameter("part_allergy");
//		String genre = request.getParameter("part_genre");
//		String category = request.getParameter("part_category");
//		String beer = request.getParameter("part_beer");
//		String userId = (String) request.getSession().getAttribute("user_id");
//
//		if (isEmpty(smokeStr) || isEmpty(ageStr) || isEmpty(empyearStr) || isEmpty(budgetStr)) {
//			request.setAttribute("errorMessage", "未入力があります");
//			request.getRequestDispatcher("insert-part-failure.jsp").forward(request, response);
//			return;
//		}
//
//		try {
//			int smoke = Integer.parseInt(smokeStr);
//			int age = Integer.parseInt(ageStr);
//			int empyear = Integer.parseInt(empyearStr);
//			int budget = Integer.parseInt(budgetStr);
//
//			PartBean bean = new PartBean();
//
//			bean.setUserID(userId);
//			bean.setPartName(name);
//			bean.setPartRuby(ruby);
//			bean.setPartGender(gender);
//			bean.setPartPost(post);
//			bean.setPartAllergy(allergy);
//			bean.setPartCategory(category);
//			bean.setPartBeer(beer);
//			bean.setPartGenre(genre);
//			bean.setPartSmoke(smoke);
//			bean.setPartAge(age);
//			bean.setPartEmpyear(empyear);
//			bean.setPartBudget(budget);
//
//			request.setAttribute("part", bean);
//			request.getRequestDispatcher("insert-part-check.jsp").forward(request, response);
//
//		} catch (NumberFormatException e) {
//			request.setAttribute("errorMessage", "数値が不正です");
//			request.getRequestDispatcher("insert-part-failure.jsp").forward(request, response);
//		}
		
		
		
		request.setCharacterEncoding("UTF-8");

		String partName = request.getParameter("part_name");
		String partRuby = request.getParameter("part_ruby");
		String partGender = request.getParameter("part_gender");
		int partAge = Integer.parseInt(request.getParameter("part_age"));
		int partEmpyear = Integer.parseInt(request.getParameter("part_empyear"));
		int partPost = Integer.parseInt(request.getParameter("part_post"));
		int partBudget = Integer.parseInt(request.getParameter("part_budget"));
		String partAllergy = request.getParameter("part_allergy");
		int partGenre = Integer.parseInt(request.getParameter("part_genre"));
		int partCategory = Integer.parseInt(request.getParameter("part_category"));
		int partBeer = Integer.parseInt(request.getParameter("part_beer"));
		int partSmoke = request.getParameter("part_smoke") != null ? 1 : 0;

		request.setAttribute("part_name", partName);
		request.setAttribute("part_ruby", partRuby);
		request.setAttribute("part_gender", partGender);
		request.setAttribute("part_age", partAge);
		request.setAttribute("part_empyear", partEmpyear);
		request.setAttribute("part_post", partPost);
		request.setAttribute("part_budget", partBudget);
		request.setAttribute("part_allergy", partAllergy);
		request.setAttribute("part_genre", partGenre);
		request.setAttribute("part_category", partCategory);
		request.setAttribute("part_beer", partBeer);
		request.setAttribute("part_smoke", partSmoke);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("insert-part-check.jsp");
		rd.forward(request, response);
		
	}

//	private boolean isEmpty(String val) {
//		return val == null || val.trim().isEmpty();
//	}
}