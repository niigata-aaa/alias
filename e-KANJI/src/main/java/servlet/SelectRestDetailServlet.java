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
 * Servlet implementation class SelectRestDetailServlet
 */
@WebServlet("/select-rest-detail")
public class SelectRestDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectRestDetailServlet() {
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
		
		int id = Integer.parseInt(request.getParameter("restId"));

		// DAOの生成
		RestaurantDAO dao = new RestaurantDAO();
		
		RestBean bean = new RestBean();

		try {
			bean = dao.select(id);


			request.setAttribute("bean", bean);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("select-rest-detail.jsp");
		rd.forward(request, response);
	}
}
