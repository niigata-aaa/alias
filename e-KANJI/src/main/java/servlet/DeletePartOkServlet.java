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
import model.entity.PartBean;

/**
 * Servlet implementation class DeletePartOkServlet
 */
@WebServlet("/delete-part-ok-servlet")
public class DeletePartOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePartOkServlet() {
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

		HttpSession session = request.getSession();
		PartBean bean = (PartBean) session.getAttribute("bean");

		ParticipantDAO dao = new ParticipantDAO();

		int processingNumber = 0;

		try {
			processingNumber = dao.delete(bean);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("bean", bean);

		if (processingNumber > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("delete-part-ok.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("delete-part-failure.jsp");
			rd.forward(request, response);
		}
	}

}
