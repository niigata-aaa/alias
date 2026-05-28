package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class InsertUserServlet
 */
@WebServlet("/insert-user")
public class InsertUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserServlet() {
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
		
		String url = "insert-user-failure.jsp";

		request.setCharacterEncoding("UTF-8");

		UserBean user = new UserBean();
		user.setUserId(request.getParameter("user_id"));
		user.setUserName(request.getParameter("user_name"));
		user.setUserPass(request.getParameter("user_pass"));

		UserDAO dao = new UserDAO();
		int result = 0;

		try {

			result = dao.insert(user);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			url = "insert-user-ok.jsp";
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("result", result);
		request.setAttribute("user", user);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
