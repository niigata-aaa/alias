package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.RestaurantDAO;
import model.entity.RestBean;

/**
 * Servlet implementation class AdmUpdateRestServlet
 */
@WebServlet("/adm-update-rest-servlet")
public class AdmUpdateRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmUpdateRestServlet() {
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

		int restId = Integer.parseInt(request.getParameter("restId"));
		RestBean bean = null;

		try {
			RestaurantDAO dao = new RestaurantDAO();
			bean = dao.select(restId);

		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		request.setAttribute("bean", bean);
		
		// update-part.jsp へ移動して初期値を表示させる
		RequestDispatcher rd = request.getRequestDispatcher("adm-update-rest.jsp");
		rd.forward(request, response);
	}
	

}
