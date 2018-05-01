package infinance;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Empresa;
import model.UserInfo;

/**
 * Servlet implementation class AdminCompany
 */
@WebServlet("/admin-company")
public class AdminCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminCompany() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("user") != null) {
			UserInfo userInfo= (UserInfo)request.getSession().getAttribute("user");
			int type = userInfo.getType();
			if (type>1) {
				ServletContext sc = getServletContext();
				ArrayList<Empresa> Empresas = DatabaseManager.busquedaTodasEmpresas();
				request.setAttribute("Empresas", Empresas);

				RequestDispatcher rd = sc.getRequestDispatcher("/admin-company.jsp");
				rd.forward(request,response);	
			}
			else {
				response.sendRedirect("/infinance/portfolio");
			}
		}
		else {
			response.sendRedirect("/infinance/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("type").equals("add")) {
			int ipoyear = Integer.parseInt(request.getParameter("ipoyear"));
			DecimalFormat decimalFormat = new DecimalFormat();
			decimalFormat.setParseBigDecimal(true);
			BigDecimal marketcap =new BigDecimal(request.getParameter("marketCap"));
			//int marketcap = Number.parse(request.getParameter("marketCap"));
			int adrtso = Integer.parseInt(request.getParameter("adrtso"));
			float lastsale = Float.parseFloat(request.getParameter("lastsale"));

			DatabaseManager.createCompany(request.getParameter("symbol"), request.getParameter("name"), lastsale,marketcap, adrtso, ipoyear, request.getParameter("sector"), request.getParameter("industry"), request.getParameter("summary"));
			doGet(request, response);
		} else {
			if (request.getParameter("type").equals("delete")) {
				DatabaseManager.deleteCompany(request.getParameter("symbol"));
				doGet(request, response);
			}
			else {
				if (request.getParameter("type").equals("edit")) {
					int ipoyear = Integer.parseInt(request.getParameter("ipoyearedit"));
					BigDecimal marketcap =new BigDecimal(request.getParameter("marketcapedit"));
					float lastsale = Float.parseFloat(request.getParameter("lastsaleedit"));				
					DatabaseManager.updateCompany(request.getParameter("symboledit"), request.getParameter("nameedit"), marketcap, lastsale, ipoyear, request.getParameter("sectoredit"), request.getParameter("industryedit"));
					doGet(request, response);
				}
			}
		}
	}
}

