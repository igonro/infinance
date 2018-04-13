package infinance;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 ServletContext sc = getServletContext();
		 RequestDispatcher rd = sc.getRequestDispatcher("/register.jsp");
		 rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Se pillarían los datos del usuario, se guardarán los datos en la bbdd y reenviará a la homeUser
		  String randomString = UUID.randomUUID().toString();
		int error = DatabaseManager.register("1", request.getParameter("user"), request.getParameter("password"),
				request.getParameter("email"), request.getParameter("name"), request.getParameter("lastName"),
				request.getParameter("phoneNumber"),randomString);
		if (error == 0) {
			response.sendRedirect("/infinance/home");
		} else {
			request.setAttribute("errorMessage", DatabaseManager.getLastError());
System.out.println(DatabaseManager.getLastError());
			getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);

		}
		
	}

}
