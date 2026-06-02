package servlet;
import java.io.IOException;
import java.sql.SQLException;

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

				

		
				
				String partName = (request.getParameter("part_name"));
				 String partRuby = (request.getParameter("part_ruby"));
				String partGender =( request.getParameter("part_gender"));
			  int partAge = Integer.parseInt(request.getParameter("part_age"));
			
			  int partEmpyear =Integer.parseInt(request.getParameter("part_empyear"));
							String partPost =( request.getParameter("part_post"));
							int partBudget= Integer.parseInt(request.getParameter("part_budget"));
							String partAllergy =( request.getParameter("part_allergy"));
							String partGenre = (request.getParameter("part_genre"));
								 String partCategory = (request.getParameter("part_category"));
								String partBeer = (request.getParameter("part_beer"));
							int partSmoke = Integer.parseInt(request.getParameter("part_smoke"));
				
					// DAOの利用
							   PartBean bean = new PartBean();

					bean.setPartName(partName);
					bean.setPartRuby(partRuby);
					bean.setPartGender(partGender);
					bean.setPartAge(partAge);
					bean.setPartEmpyear(partEmpyear);
					bean.setPartPost(partPost);
					bean.setPartBudget(partBudget);
					bean.setPartAllergy(partAllergy);
					bean.setPartGenre(partGenre);
					bean.setPartCategory(partCategory);
					bean.setPartBeer(partBeer);
					bean.setPartSmoke(partSmoke);
					
					 ParticipantDAO dao = new ParticipantDAO();
				        int count = 0; 
					

				        try {
				            count = dao.insert(bean); // ここでDAOのinsertメソッドを呼び出す！
				        } catch (ClassNotFoundException | SQLException e) {
				            e.printStackTrace();
				            // エラーが発生した場合はエラー画面へ（必要に応じて設定してください）
				        }

					
				request.getSession().setAttribute("part",bean);
				request.getSession().setAttribute("count", count);
		

				// リクエストの転送
				RequestDispatcher rd = request.getRequestDispatcher("insert-part-check.jsp");
				rd.forward(request, response);

	}

}