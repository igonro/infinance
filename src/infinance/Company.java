package infinance;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CompanyInfo;
import model.Empresa;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext sc = getServletContext();
		String symbol = request.getParameter("symbol");
		Empresa empresa = DatabaseManager.busquedaEmpresaPorSymbol(symbol);
		CompanyInfo infoEmpresa = new CompanyInfo(empresa.getName(), empresa.getSymbol(), empresa.getMarketcap(), empresa.getSector(), empresa.getIndustry(), 0.0);
		request.setAttribute("infoEmpresa", infoEmpresa);
		RequestDispatcher rd = sc.getRequestDispatcher("/company.jsp");
		rd.forward(request,response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
