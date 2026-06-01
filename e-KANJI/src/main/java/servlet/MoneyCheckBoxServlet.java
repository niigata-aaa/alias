
package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MoneyCheckBoxServlet
 */
@WebServlet("/money-check-box")
public class MoneyCheckBoxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MoneyCheckBoxServlet() {
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
		String url = null;
		
		// セッションオブジェクトの取得
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user_id");

		String sumStr = request.getParameter("sum");
		String partyStr = request.getParameter("party");

		int sum = 0;
		int party = 0;
		int result = 0;
		String errorMsg = "";

		try {
			// 入力チェック（空でないか）
			if (sumStr != null && !sumStr.isEmpty() && partyStr != null && !partyStr.isEmpty()) {
				sum = Integer.parseInt(sumStr);
				party = Integer.parseInt(partyStr);

				// 0除算のチェック
				if (party != 0) {
					result = sum / party;
				} else {
					errorMsg = "人数に0は入力できません。";
				}
			} else {
				errorMsg = "合計金額と人数を入力してください。";
			}
		} catch (NumberFormatException e) {
			errorMsg = "正しい数値を入力してください。";
		}
		
		// ログイン認証済みかどうかを確認
		if (session.getAttribute("user_id") != null) {
			url = "money-check-box.jsp";
		} else {
			url = "login.jsp";
		}

		// 画面に値を戻す
		request.setAttribute("user_id", userId);
		request.setAttribute("sum", sumStr);
		request.setAttribute("party", partyStr);
		request.setAttribute("result", result);
		request.setAttribute("errorMsg", errorMsg); // エラーメッセージを渡す

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
