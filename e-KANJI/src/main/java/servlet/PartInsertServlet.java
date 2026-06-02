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
 * Servlet implementation class PartInsertServlet
 */
@WebServlet("/part-insert")
public class PartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartInsertServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "part-insert-failure.jsp";
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user_id");

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
		
		int partSmoke = request.getParameter("part_smoke") != null ? 1 : 0;
		part.setPartSmoke(partSmoke);

		ParticipantDAO dao = new ParticipantDAO();
		int result = 0;

		try {

			result = dao.insert(userId, part);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			url = "part-insert-ok.jsp";
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("part", part);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
