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
 * Servlet implementation class AdmUpdateRestOkServlet
 */
@WebServlet("/adm-update-rest-ok-servlet")
public class AdmUpdateRestOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmUpdateRestOkServlet() {
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
		RestBean bean = (RestBean) session.getAttribute("rest");
		//RestBean bean = (RestBean) request.getAttribute("rest");

		// RestBean bean = new RestBean();

		    bean.setRestId(Integer.parseInt(request.getParameter("restId")));
		    bean.setRestName(request.getParameter("restName"));
		    bean.setRestGenre(request.getParameter("restGenre"));
		    bean.setRestCategory(request.getParameter("restCategory"));
		    bean.setRestOpen(request.getParameter("restOpen"));
		    bean.setRestClose(request.getParameter("restClose"));
		    bean.setRestNextday(Integer.parseInt(request.getParameter("restNextday")));
		    bean.setRestDistance(Integer.parseInt(request.getParameter("restDistance")));
		    bean.setRestBudget(Integer.parseInt(request.getParameter("restBudget")));
		    bean.setRestCapacity(Integer.parseInt(request.getParameter("restCapacity")));
		    bean.setRestTel(request.getParameter("restTel"));
		    bean.setRestAddress(request.getParameter("restAddress"));
		    bean.setRestUrl(request.getParameter("restUrl"));
		    bean.setRestReview(Double.parseDouble(request.getParameter("restReview")));
		    bean.setRestBeer(request.getParameter("restBeer"));
		    bean.setRestSmoke(Integer.parseInt(request.getParameter("restSmoke")));
		    bean.setRestSmokeroom(Integer.parseInt(request.getParameter("restSmokeroom")));
		
		RestaurantDAO dao = new RestaurantDAO();

		int processingNumber = 0;

		try {
			processingNumber = dao.update(bean);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("bean", bean);

		if (processingNumber > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("adm-update-rest-ok.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("adm-update-rest-failure.jsp");
			rd.forward(request, response);
		}
	}

}
