package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		  
		String userId = (String) request.getSession().getAttribute("user_id");
		    if(userId == null) {
		        throw new ServletException("ログインユーザーが見つかりません");
		    }

		
		PartBean part = new PartBean();

		part.setUserID(userId);
		part.setPartName(request.getParameter("part_name"));
		part.setPartRuby(request.getParameter("part_ruby"));
		part.setPartGender(request.getParameter("part_gender"));
		part.setPartAge(Integer.parseInt(request.getParameter("part_age")));
		part.setPartEmpyear(Integer.parseInt(request.getParameter("part_empyear")));
		part.setPartPost(request.getParameter("part_post"));
		part.setPartBudget(Integer.parseInt(request.getParameter("part_budget")));
		part.setPartAllergy(request.getParameter("part_allergy"));
		part.setPartGenre(request.getParameter("part_genre"));
		part.setPartCategory(request.getParameter("part_category"));
		part.setPartBeer(request.getParameter("part_beer"));
		part.setPartSmoke(Integer.parseInt(request.getParameter("part_smoke")));
		try {
	        ParticipantDAO dao = new ParticipantDAO();

	        dao.insert(part);    // ← DB登録

	        request.setAttribute("part", part);
            request.getRequestDispatcher("insert-part-ok.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            // ★失敗時はここへ
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("insert-part-fail.jsp")
                   .forward(request, response);
	}}}