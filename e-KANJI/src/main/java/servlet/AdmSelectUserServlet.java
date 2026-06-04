package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class AdmSelectUserServlet
 */
@WebServlet("/adm-select-user")
public class AdmSelectUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdmSelectUserServlet() {
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

		String url = null; // 画面遷移先
		List<UserBean> userList = null;

		// セッションオブジェクトの取得
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user_id");
		String userName = request.getParameter("user_name");
		String stopParam = request.getParameter("user_stop");

		Integer userStop = null;

		if (stopParam != null) {
			userStop = Integer.parseInt(stopParam);
		}

		// DAOの生成
		UserDAO uDao = new UserDAO();

		try {
			userList = uDao.search(userId, userName, userStop);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// ログイン認証済みかどうかを確認
		if (session.getAttribute("adm_id") != null) {
			url = "adm-select-user.jsp";
		} else {
			url = "adm-login.jsp";
		}

		request.setAttribute("userList", userList);
		request.setAttribute("user_id", userId);
		request.setAttribute("user_name", userName);
		request.setAttribute("user_stop", stopParam);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
