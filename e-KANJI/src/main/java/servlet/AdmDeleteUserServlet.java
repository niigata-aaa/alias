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

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class AdmDeleteUserServlet
 */
@WebServlet("/adm-delete-user")
public class AdmDeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdmDeleteUserServlet() {
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
		String userId = request.getParameter("user_id");

		String url = null;

		UserDAO dao = new UserDAO();
		UserBean user = null;

		int processingNumber = 0;

		try {
			user = dao.select(userId);
			processingNumber = dao.delete(userId);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		if (processingNumber > 0) {
			url = "adm-delete-user-ok.jsp";
		} else {
			url = "adm-delete-user-failure.jsp";
		}

		// セッションオブジェクトの取得
		HttpSession session = request.getSession();

		// ログイン認証済みかどうかを確認
		if (session.getAttribute("adm_id") == null) {
			url = "adm-login.jsp";
		}

		request.setAttribute("user", user);

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
