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

import model.dao.ParticipantDAO;

/**
 * Servlet implementation class DeleteAllPartOkServlet
 */
@WebServlet("/delete-all-part-ok-servlet")
public class DeleteAllPartOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAllPartOkServlet() {
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

		ParticipantDAO dao = new ParticipantDAO();

		int num = 0;

		HttpSession session = request.getSession();

		String userID = (String) session.getAttribute("user_id");

		try {
			num = dao.deleteALL(userID);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		request.setAttribute("num", num);

		if (num > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("delete-all-part-ok.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("delete-all-part-failure.jsp");
			rd.forward(request, response);
		}
	}

}
