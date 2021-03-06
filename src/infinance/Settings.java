package infinance;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import utils.DatabaseManager;

/**
 * Servlet implementation class Settings
 */
@WebServlet("/settings")
public class Settings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Settings() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		if (request.getSession().getAttribute("user") != null) {
			UserInfo userInfo= (UserInfo)request.getSession().getAttribute("user");
			int type = userInfo.getType();
			request.setAttribute("type", type);

			HttpSession session = request.getSession();
			System.out.println(request.getParameter("error"));
			request.setAttribute("error", request.getParameter("error"));
			// Usuario user =
			// DatabaseManager.getUserInfo(Integer.parseInt(session.getAttribute("user").toString()));
			int id_user = ((UserInfo) request.getSession().getAttribute("user")).getUserID();
			Usuario user = DatabaseManager.getUserInfo(id_user);
			ServletContext sc = getServletContext();
			request.setAttribute("userinfo", user);
			RequestDispatcher rd = sc.getRequestDispatcher("/settings.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("/infinance/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserInfo userInfo= (UserInfo)request.getSession().getAttribute("user");
		int id_user= userInfo.getUserID();
		DatabaseManager.updateUserInfo(id_user, request.getParameter("user"), request.getParameter("email"),
				request.getParameter("name"), request.getParameter("lastName"), request.getParameter("phoneNumber"));
		doGet(request, response);
	}

}
