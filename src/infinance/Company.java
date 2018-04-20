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

import model.CompanyInfo;
import model.CompanyValue;
import model.Dates;
import model.Empresa;
import utils.RequestAPI;

/**
 * Servlet implementation class EnterpriseDetailServlet
 */
@WebServlet("/company")
public class Company extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user") != null) {
			ServletContext sc = getServletContext();
			String symbol = request.getParameter("symbol");
			Empresa empresa = DatabaseManager.busquedaEmpresaPorSymbol(symbol);
			CompanyInfo infoEmpresa = new CompanyInfo(empresa.getName(), empresa.getSymbol(), empresa.getMarketcap(),
					empresa.getSector(), empresa.getIndustry(), 0.0);
			request.setAttribute("infoEmpresa", infoEmpresa);
			String dateStart = request.getParameter("dateStart");
			String dateEnd = request.getParameter("dateEnd");
			try {
				if (dateStart != null && dateEnd != null) {
					if (checkDates(dateStart, dateEnd)) {
						ArrayList<CompanyValue> company = RequestAPI.callAPIbyDate(symbol, dateStart, dateEnd);
						request.setAttribute("Company", company);
						Dates dates = new Dates(dateStart, dateEnd);
						request.setAttribute("Dates", dates);
						RequestDispatcher rd = sc.getRequestDispatcher("/company.jsp");
						rd.forward(request, response);
					} else {
						RequestDispatcher rd = sc.getRequestDispatcher("/company-data-error.jsp");
						rd.forward(request, response);
					}
				} else {
					Dates dates = RequestAPI.getOldestandNewestDate(symbol);
					request.setAttribute("Dates", dates);
					ArrayList<CompanyValue> company = RequestAPI.callAPIbyTicker(symbol);
					request.setAttribute("Company", company);
					RequestDispatcher rd = sc.getRequestDispatcher("/company.jsp");
					rd.forward(request, response);
				}
			} catch (java.io.IOException e) {
				System.out.println("io");
				RequestDispatcher rd = sc.getRequestDispatcher("/company-data-error.jsp");
				rd.forward(request, response);
			} catch (java.lang.NullPointerException e) {
				System.out.println("nullpointer");
				RequestDispatcher rd = sc.getRequestDispatcher("/company-data-error.jsp");
				rd.forward(request, response);
			}
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
		doGet(request, response);
	}

	private boolean checkDates(String dateStart, String dateEnd) {
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
