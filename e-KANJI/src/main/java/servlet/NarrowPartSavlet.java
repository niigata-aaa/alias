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

import model.dao.ParticipantDAO;
import model.entity.PartBean;

/**
 * Servlet implementation class NarrowPartSavlet
 */
@WebServlet("/narrow-part-savlet")
public class NarrowPartSavlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NarrowPartSavlet() {
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
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		List<PartBean> narrowList = null;
		
		String part_name = request.getParameter("part_name");
		
		// DAOの生成
		ParticipantDAO dao = new ParticipantDAO();
		
		try {
			// DAOの利用（名前で部分一致検索）
			narrowList = dao.select(part_name);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// JSP側が「partList」という名前でテーブル表示を待っているため、ここで設定します
		request.setAttribute("partList", narrowList);
	
		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("/select-part.jsp");
		rd.forward(request, response);
	}

}
