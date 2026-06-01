package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.ParticipantDAO;
import model.dao.RestaurantDAO;
import model.dao.UserDAO;
import model.entity.PartBean;
import model.entity.RestBean;
import model.entity.UserBean;

/**
 * Servlet implementation class SeatingChartServlet
 */
@WebServlet("/seating-chart")
public class SeatingChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SeatingChartServlet() {
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

		String url = null; // 画面遷移先
		List<PartBean> partList = null;
		UserBean user = null;
		RestBean rest = null;

		// セッションオブジェクトの取得
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");

		String userId = (String) session.getAttribute("user_id");
		String sortType = request.getParameter("sortType");

		// DAOの生成
		ParticipantDAO pDao = new ParticipantDAO();
		RestaurantDAO rDao = new RestaurantDAO();
		UserDAO uDao = new UserDAO();

		try {
			
			partList = pDao.selectForSC(userId);
			user = uDao.select(userId);
			
			if (user.getUserChoice() != 0) {
				rest = rDao.select(user.getUserChoice());
			}

			if (sortType != null) {

				switch (sortType) {

				case "random":
					Collections.shuffle(partList);
					break;

				case "post":
					Collections.shuffle(partList);
					partList.sort(Comparator.comparing(PartBean::getPartPostId).reversed());
					break;

				case "gender":
					Collections.shuffle(partList);
					partList.sort(Comparator.comparing(PartBean::getPartGender).reversed());
					break;

				case "smoke":
					Collections.shuffle(partList);
					partList.sort(Comparator.comparing(PartBean::getPartSmoke).reversed());
					break;
				}
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// ログイン認証済みかどうかを確認
		if (session.getAttribute("user_id") != null) {
			url = "seating-chart.jsp";
		} else {
			url = "login.jsp";
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("rest", rest);
		request.setAttribute("sortType", sortType);

		if ("post".equals(sortType)) {

			int rows = (partList.size() + 1) / 2;

			request.setAttribute("partList", partList);
			request.setAttribute("rightList", partList.subList(0, rows));
			request.setAttribute("leftList", partList.subList(rows, partList.size()));

		} else {
			// ランダム・男女・喫煙
			request.setAttribute("partList", partList);
		}

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
