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
import javax.servlet.http.HttpSession;

import model.dao.LogDAO;
import model.dao.ParticipantDAO;
import model.dao.RestaurantDAO;
import model.entity.LogBean;
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
		int restId = Integer.parseInt(request.getParameter("restId"));

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("user_id");
		
		int count = 0;

		// DAOの生成
		RestaurantDAO rDao = new RestaurantDAO();
		RestBean bean = new RestBean();

		ParticipantDAO pdao = new ParticipantDAO(); 

		LogDAO lDao = new LogDAO();
		List<LogBean> logList = new ArrayList<LogBean>();

		try {
			bean = rDao.select(userId, restId);
			logList = lDao.select(userId, restId);
			count = pdao.getParticipantCount(userId);

			request.setAttribute("bean", bean);
			request.setAttribute("logList", logList);
			request.setAttribute("partCount", count);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("select-rest-detail.jsp");
		rd.forward(request, response);
	}
}
