package infinance;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.Empresa;

/**
 * Servlet implementation class CompanyCheck
 */
@WebServlet("/CompanyCheck")
public class CompanyCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String term = request.getParameter("term");
	    System.out.println("Data from ajax call " + term);
	                    ArrayList<Empresa> list = DatabaseManager.busquedaEmpresa(term);
	                    System.out.println(list);
	                    GsonBuilder gsonBuilder = new GsonBuilder();
	                    Gson gson = gsonBuilder.create();
	                    response.getWriter().write(gson.toJson(list));	
	                    System.out.println("JSON String Array "+gson.toJson(list));


	                   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
