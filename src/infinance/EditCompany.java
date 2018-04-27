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

import model.Empresa;

/**
 * Servlet implementation class EditCompany
 */
@WebServlet("/editcompany")
public class EditCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext sc = getServletContext();
		ArrayList<Empresa> Empresas = DatabaseManager.busquedaTodasEmpresas();
		request.setAttribute("Empresas", Empresas);
		RequestDispatcher rd = sc.getRequestDispatcher("/editcompany.jsp");
		rd.forward(request,response);	
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("type").equals("add")) {
		int ipoyear = Integer.parseInt(request.getParameter("ipoyear"));
		int marketcap = Integer.parseInt(request.getParameter("marketCap"));
		int adrtso = Integer.parseInt(request.getParameter("adrtso"));
		int lastsale = Integer.parseInt(request.getParameter("lastsale"));

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
					int marketcap = Integer.parseInt(request.getParameter("marketcapedit"));
					int adrtso = Integer.parseInt(request.getParameter("addressedit"));				
					DatabaseManager.updateCompany(request.getParameter("symboledit"), request.getParameter("nameedit"), marketcap, adrtso, ipoyear, request.getParameter("sectoredit"), request.getParameter("industryedit"));
					doGet(request, response);
			}
			}
	}
	}
	}

