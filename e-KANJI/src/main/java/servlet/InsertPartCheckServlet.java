package servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ParticipantDAO;
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
		
		// リクエストオブジェクトのエンコーディング方式の指定
				request.setCharacterEncoding("UTF-8");

				// リクエストパラメータの取得
				String part_name = request.getParameter("part_name");
				String part_ruby = request.getParameter("part_ruby");
				String part_gender = request.getParameter("part_gender");
				int part_age = Integer.parseInt(request.getParameter("part_age"));
				int part_empyear = Integer.parseInt(request.getParameter("part_empyear"));
				String part_post = request.getParameter("part_post");
				int part_budget= Integer.parseInt(request.getParameter("part_budget"));
				String part_allergy = request.getParameter("part_allergy");
				String part_genre = request.getParameter("part_genre");
				String part_category = request.getParameter("part_category");
				String part_beer = request.getParameter("part_beer");
				int part_smoke = Integer.parseInt(request.getParameter("part_smoke"));

				PartBean part = new PartBean();
				part.setPartName(part_name);
				part.setPartRuby(part_ruby);
				part.setPartGender(part_gender);
				part.setPartAge(part_age);
				part.setPartEmpyear(part_empyear);
				part.setPartPost(part_post);
				part.setPartBudget(part_budget);
				part.setPartAllergy(part_allergy);
				part.setPartGenre(part_genre);
				part.setPartCategory(part_category);
				part.setPartBeer(part_beer);
				part.setPartSmoke(part_smoke);

				// DAOの生成
				ParticipantDAO dao = new ParticipantDAO();

				int count = 0;	// 処理件数

				// リクエストスコープへの属性の設定
				request.setAttribute("count", count);
				request.setAttribute("part", part);

				// リクエストの転送
				RequestDispatcher rd = request.getRequestDispatcher("insert-part-check.jsp");
				rd.forward(request, response);

	}

}