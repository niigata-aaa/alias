package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.RestaurantDAO;
import model.entity.RestBean;

/**
 * Servlet implementation class AdmSelectRest
 */
@WebServlet("/adm-select-rest")
public class AdmSelectRest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdmSelectRest() {
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

		List<RestBean> restList = new ArrayList<RestBean>();


		//		String part_user = request.getParameter("part_user");

		//PartBean part=new PartBean();

		//part.setUserID(part_user);

		// DAOの生成
		RestaurantDAO dao = new RestaurantDAO();

		try {
			// DAOの利用
			restList = dao.selectAll();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("restList", restList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("adm-select-rest.jsp");
		rd.forward(request, response);


	}

}
