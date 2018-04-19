package infinance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserInfo;
import utils.RequestAPI;

/**
 * Servlet implementation class SaleShares
 */
@WebServlet("/saleshares")
public class SaleShares extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleShares() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id_user= ((UserInfo)request.getSession().getAttribute("user")).getUserID();
		String symbol = request.getParameter("symbol");
		String numeroString = request.getParameter("numSharesSale");
		int numero = Integer.parseInt(numeroString);
		
		double value=RequestAPI.getMostRecentCloseValue(symbol);
		
		if(DatabaseManager.transactionShares( id_user, symbol,numero,(float) value,"sale")>=0) {
			response.sendRedirect("/infinance/portfolio");
		}
		else {
			response.sendRedirect("/infinance/portfolio");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
