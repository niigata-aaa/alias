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

import model.dao.ParticipantDAO;
import model.entity.PartBean;

/**
 * Servlet implementation class SelectPartServlet
 */
@WebServlet("/select-part-servlet")
public class SelectPartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectPartServlet() {
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
		List<PartBean> partList = null;

		// セッションオブジェクトの取得
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user_id");

		// DAOの生成
		ParticipantDAO dao = new ParticipantDAO();

		try {
			// DAOの利用
			partList = dao.selectAll(userId);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("partList", partList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("/select-part.jsp");
		rd.forward(request, response);

	}

}
