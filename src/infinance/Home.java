package infinance;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Home
 */
@WebServlet("/home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private static DatabaseManager db;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }
public void init() {
	//inicializaci�n de la conexione de la base de datos
	db = new DatabaseManager();
	
}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 ServletContext sc = getServletContext();
		 RequestDispatcher rd = sc.getRequestDispatcher("/home.jsp");
		 System.out.println(request.getSession().getAttribute("user"));
		 rd.forward(request,response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String page = null;
//		String param = request.getParameter("page");
//
//		if (param.equals("login")) {
//			page = "/login.jsp";
//		} else if (param.equals("register")) {
//			page = "/register.jsp";
//		} else if (param.equals("doregister")) {
//
//			int error = DatabaseManager.register("1", request.getParameter("user"), request.getParameter("password"),
//					request.getParameter("email"), request.getParameter("name"), request.getParameter("lastname"),
//					request.getParameter("phone"));
//			if (error == 0) {
//				page = "/home.jsp";
//			} else {
//				page = "/register.jsp";
//			}
//		} else if (param.equals("dologin")) {
//
//			int iduser = DatabaseManager.login(request.getParameter("user"), request.getParameter("password"));
//			if (iduser == -1) {
//				page = "/login.jsp";
//				request.setAttribute("errorMessage", "Invalid user or password");
//				System.out.println("ERROR");
//			} else {
//				page = "/home.jsp";
//			}
//
//		}
//
//		getServletContext().getRequestDispatcher(page).forward(request, response);
//
	}
}
