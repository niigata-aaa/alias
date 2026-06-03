package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.RestBean;

/**
 * Servlet implementation class AdmInsertRestCheckServlet
 */
@WebServlet("/adm-insert-rest-check")
public class AdmInsertRestCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmInsertRestCheckServlet() {
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
		
		String restName=request.getParameter("rest_name");
		String restGenre=request.getParameter("rest_genre");
		String restCategory=request.getParameter("rest_category");
		String restOpen=request.getParameter("rest_open");
		String restClose=request.getParameter("rest_close");
		int restNextday=Integer.parseInt(request.getParameter("rest_nextday"));
		int restDistance=Integer.parseInt(request.getParameter("rest_distance"));
		int restBudget=Integer.parseInt(request.getParameter("rest_budget"));
		int restCapacity=Integer.parseInt(request.getParameter("rest_capacity"));
		String restTel=request.getParameter("rest_tel");
		String restAddress=request.getParameter("rest_address");
		String restUrl=request.getParameter("rest_url");
		Double restReview=Double.parseDouble(request.getParameter("rest_review"));
		String restBeer=request.getParameter("rest_beer");
		int restSmoke=Integer.parseInt(request.getParameter("rest_smoke"));
		int restSmokeroom=Integer.parseInt(request.getParameter("rest_smokeroom"));
		
		if(isEmpty(restName)) {
			request.setAttribute("errorMessage","未入力があります");
			request.getRequestDispatcher("adm-insert-rest-failure.jsp").forward(request, response);
			return;
		}
		
		try {
			
			RestBean bean=new RestBean();
			
			bean.setRestName(restName);
			bean.setRestGenre(restGenre);
			bean.setRestCategory(restCategory);
			bean.setRestOpen(restOpen);
			bean.setRestClose(restClose);
			bean.setRestNextday(restNextday);
			bean.setRestDistance(restDistance);
			bean.setRestBudget(restBudget);
			bean.setRestCapacity(restCapacity);
			bean.setRestTel(restTel);
			bean.setRestAddress(restAddress);
			bean.setRestUrl(restUrl);
			bean.setRestReview(restReview);
			bean.setRestBeer(restBeer);
			bean.setRestSmoke(restSmoke);
			bean.setRestSmokeroom(restSmokeroom);
			
			request.setAttribute("rest",bean);
			request.getRequestDispatcher("adm-insert-rest-check.jsp").forward(request, response);
			
		}catch (NumberFormatException e) {
	        request.setAttribute("errorMessage", "数値が不正です");
	        request.getRequestDispatcher("adm-insert-rest-failure.jsp").forward(request, response);
	    }
	}
	
	private boolean isEmpty(String val) {
	    return val == null || val.trim().isEmpty();
	}
}
