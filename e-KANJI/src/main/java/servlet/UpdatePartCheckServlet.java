package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.PartBean;

/**
 * Servlet implementation class UpdatePartCheckServlet
 */
@WebServlet("/update-part-check-servlet")
public class UpdatePartCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePartCheckServlet() {
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
		PartBean bean = new PartBean();

		bean.setUserID(request.getParameter("userID"));
		bean.setPartID(Integer.parseInt(request.getParameter("partID")));
		bean.setPartName(request.getParameter("partName"));
		bean.setPartRuby(request.getParameter("partRuby"));
		bean.setPartGender(request.getParameter("partGender"));
		bean.setPartAge(Integer.parseInt(request.getParameter("partAge")));
		bean.setPartEmpyear(Integer.parseInt(request.getParameter("partEmpyear")));
		bean.setPartPostId(Integer.parseInt(request.getParameter("partPostId")));
		bean.setPartPost(request.getParameter("partPost"));
		bean.setPartBudget(Integer.parseInt(request.getParameter("partBudget")));
		bean.setPartAllergy(request.getParameter("partAllergy"));
		bean.setPartGenre(request.getParameter("partGenre"));
		bean.setPartCategory(request.getParameter("partCategory"));
		bean.setPartBeer(request.getParameter("partBeer"));
		bean.setPartSmoke(Integer.parseInt(request.getParameter("partSmoke")));

		request.getSession().setAttribute("part", bean);

		RequestDispatcher rd = request.getRequestDispatcher("update-part-check.jsp");
		rd.forward(request, response);
	}

}
