package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertPartBackServlet
 */
@WebServlet("/insert-part-back")
public class InsertPartBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPartBackServlet() {
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
<<<<<<< HEAD
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		int partSmoke = Integer.parseInt(request.getParameter("part_smoke"));

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
		RequestDispatcher rd = request.getRequestDispatcher("insert-part.jsp");
		rd.forward(request, response);
	}

}
=======
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		int partSmoke = Integer.parseInt(request.getParameter("part_smoke"));
		

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
		RequestDispatcher rd = request.getRequestDispatcher("insert-part.jsp");
		rd.forward(request, response);
	}

}
>>>>>>> branch 'master' of https://github.com/niigata-aaa/alias.git
