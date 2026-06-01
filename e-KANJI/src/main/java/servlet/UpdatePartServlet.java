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
 * Servlet implementation class UpdatePartServlet
 */
@WebServlet("/update-part-servlet")
public class UpdatePartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePartServlet() {
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

		int partID = Integer.parseInt(request.getParameter("partID"));
		PartBean bean =null; 

			try {

				// DAOを使ってデータベースからデータを1件取得
				ParticipantDAO dao = new ParticipantDAO();
				bean = dao.select(partID);


			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}

			request.setAttribute("bean", bean);
		// update-part.jsp へ移動して初期値を表示させる
		RequestDispatcher rd = request.getRequestDispatcher("update-part.jsp");
		rd.forward(request, response);
	}

}
