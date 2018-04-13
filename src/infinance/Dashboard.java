package infinance;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CompanyValue;
import model.Dates;
import model.Empresa;
import utils.RequestAPI;

/**
 * Servlet implementation class dashboard
 */
@WebServlet("/dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Dashboard() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		ServletContext sc = getServletContext();

		String symbol = request.getParameter("symbol");
		String dateStart = request.getParameter("dateStart");
		String dateEnd = request.getParameter("dateEnd");

		Empresa empresa = new Empresa(symbol);

		request.setAttribute("Empresa", empresa);
		try {

			if (dateStart != null && dateEnd != null) {
				if (cheackDates(dateStart, dateEnd)) {
					ArrayList<CompanyValue> company = RequestAPI.callAPIbyDate(symbol, dateStart, dateEnd);
					request.setAttribute("Company", company);
					Dates dates = new Dates(dateStart, dateEnd);
					request.setAttribute("Dates", dates);
					RequestDispatcher rd = sc.getRequestDispatcher("/dashboard.jsp");
					rd.forward(request, response);
				} else {

					RequestDispatcher rd = sc.getRequestDispatcher("/dashboarderror.jsp");
					rd.forward(request, response);
				}
			} else {
				Dates dates = new Dates("2014-01-01", "2014-12-31");
				request.setAttribute("Dates", dates);
				ArrayList<CompanyValue> company = RequestAPI.callAPIbyTicker(symbol);
				request.setAttribute("Company", company);
				RequestDispatcher rd = sc.getRequestDispatcher("/dashboard.jsp");
				rd.forward(request, response);

			}

		} catch (java.io.IOException e) {
			RequestDispatcher rd = sc.getRequestDispatcher("/dashboarderror.jsp");
			rd.forward(request, response);
		} catch (java.lang.NullPointerException e) {
			RequestDispatcher rd = sc.getRequestDispatcher("/dashboarderror.jsp");
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private boolean cheackDates(String dateStart, String dateEnd) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar caldateStart = Calendar.getInstance();
		Calendar caldateEnd = Calendar.getInstance();
		try {
			caldateStart.setTime(df.parse(dateStart));
			caldateEnd.setTime(df.parse(dateEnd));
			if (caldateStart.getTimeInMillis() >= caldateEnd.getTimeInMillis()) {
				return false;
			} else {
				return true;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
}
