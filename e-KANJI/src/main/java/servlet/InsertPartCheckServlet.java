package servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.PartBean;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		    request.setCharacterEncoding("UTF-8");

		    PartBean bean = new PartBean();

		    bean.setUserID(request.getParameter("user_id"));
		    bean.setPartName(request.getParameter("part_name"));
		    bean.setPartRuby(request.getParameter("part_ruby"));
		    bean.setPartGender(request.getParameter("part_gender"));
		    bean.setPartAge(Integer.parseInt(request.getParameter("part_age")));
		    bean.setPartEmpyear(Integer.parseInt(request.getParameter("part_empyear")));
		    bean.setPartPost(request.getParameter("part_post"));
		    bean.setPartBudget(Integer.parseInt(request.getParameter("part_budget")));
		    bean.setPartAllergy(request.getParameter("part_allergy"));
		    bean.setPartGenre(request.getParameter("part_genre"));
		    bean.setPartCategory(request.getParameter("part_category"));
		    bean.setPartBeer(request.getParameter("part_beer"));
		    bean.setPartSmoke(Integer.parseInt(request.getParameter("part_smoke")));

		    // ★確認画面用にrequestへ
		    request.setAttribute("part", bean);

		    request.getRequestDispatcher("insert-part-check.jsp")
		           .forward(request, response);
		}
}