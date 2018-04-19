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
import model.PortfolioUser;
import model.UserInfo;

@WebServlet("/portfolio")
public class Portfolio extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Portfolio() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getSession().getAttribute("user") != null) {
			System.out.println("GET DEL PORTFOLIO");
			ServletContext sc = getServletContext();
		

			int id_user= ((UserInfo)request.getSession().getAttribute("user")).getUserID();
			ArrayList<PortfolioUser>  portfolioUser =   DatabaseManager.getPortfolio( id_user);
			request.setAttribute("PortfolioUser", portfolioUser);
			RequestDispatcher rd = sc.getRequestDispatcher("/portfolio.jsp");
			rd.forward(request,response);
			
		} else {
			response.sendRedirect("/infinance/login");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
	}

}
