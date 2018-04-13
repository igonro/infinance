package infinance;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HistoryUser;

@WebServlet("/history")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public History() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET DEL HISTORY");
		ServletContext sc = getServletContext();
		int id_user= DatabaseManager.login("luis", ("123456"));
		ArrayList<HistoryUser>  historyUser =   DatabaseManager.getHistory( id_user);
		request.setAttribute("HistoryUser", historyUser);
		RequestDispatcher rd = sc.getRequestDispatcher("/history.jsp");
		rd.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
	}

}
