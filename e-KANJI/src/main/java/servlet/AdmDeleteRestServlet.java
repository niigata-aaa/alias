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

import model.dao.RestaurantDAO;
import model.entity.RestBean;

/**
 * Servlet implementation class AdmDeleteRestServlet
 */
@WebServlet("/adm-delete-rest")
public class AdmDeleteRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmDeleteRestServlet() {
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
		int restId = Integer.parseInt(request.getParameter("rest_id"));

		String url = null;

		int processingNumber = 0;
		
		RestaurantDAO dao = new RestaurantDAO();
		RestBean rest = new RestBean();

		try {
			rest = dao.select(restId);
			processingNumber = dao.delete(restId);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		if (processingNumber > 0) {
			url = "adm-delete-rest-ok.jsp";
		} else {
			url = "adm-delete-rest-failure.jsp";
		}

		// セッションオブジェクトの取得
		HttpSession session = request.getSession();

		// ログイン認証済みかどうかを確認
		if (session.getAttribute("adm_id") == null) {
			url = "adm-login.jsp";
		}
		
		

		request.setAttribute("rest", rest);

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	

}
