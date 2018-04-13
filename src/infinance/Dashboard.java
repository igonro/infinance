package infinance;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;

import model.CompanyValue;
import model.Dates;
import model.Empresa;

/**
 * Servlet implementation class dashboard
 */
@WebServlet("/dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String QUANDL_KEY = "wKvyxZ84BD5yzC71jt3f";	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 
		 
		 ServletContext sc = getServletContext();

		String symbol= request.getParameter("symbol");
		String dateStart= request.getParameter("dateStart");
		String dateEnd =request.getParameter("dateEnd");
		
		
		if( cheackDates( dateStart,  dateEnd)) {
			Empresa empresa = new Empresa (symbol);
			
			request.setAttribute("Empresa", empresa);
			try {
	
			
			if(dateStart!=null&&dateEnd!=null) {
				
					ArrayList<CompanyValue> company = callAPI(symbol,dateStart,dateEnd);	
					request.setAttribute("Company", company);
					Dates dates = new Dates (dateStart,dateEnd);
					request.setAttribute("Dates", dates);
				}
				else {
					ArrayList<CompanyValue> company = callAPI(symbol);	
					request.setAttribute("Company", company);
				
				}
			
			RequestDispatcher rd = sc.getRequestDispatcher("/dashboard.jsp");
			rd.forward(request, response);
			}catch(java.io.IOException e) {
				RequestDispatcher rd = sc.getRequestDispatcher("/dashboarderror.jsp");
				rd.forward(request, response);
			}
			catch(java.lang.NullPointerException e) {
				RequestDispatcher rd = sc.getRequestDispatcher("/dashboarderror.jsp");
				rd.forward(request, response);
			}
			
		}
		else {
			
			RequestDispatcher rd = sc.getRequestDispatcher("/dashboarderror.jsp");
			rd.forward(request, response);
		}
		
		
	}

	private ArrayList<CompanyValue> callAPI(String tickerSymbol, String dataStart, String dataEnd) {
		String url = "https://www.quandl.com/api/v3/datasets/WIKI/"+tickerSymbol+".json?column_index=4&start_date="+dataStart+"&end_date="+dataEnd+"&api_key="+QUANDL_KEY;
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = null;
		try {
			rootNode = mapper.readTree(new URL(url));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JsonNode datasetNode = rootNode.path("dataset");
		JsonNode data = datasetNode.path("data");	//
		Iterator<JsonNode> iterator = data.getElements();
		ArrayList<CompanyValue> comp = new ArrayList<CompanyValue>();
		while(iterator.hasNext()) {
			JsonNode dataIt = iterator.next();
			System.out.println(dataIt.toString());
			String sDate = dataIt.get(0).asText();
	
			double value = dataIt.get(1).asDouble();
			System.out.println(new CompanyValue(sDate,value));
			comp.add(new CompanyValue(sDate,value));
		}
		Collections.reverse(comp);
		return comp;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected ArrayList<CompanyValue> callAPI(String tickerSymbol) {
		String url = "https://www.quandl.com/api/v3/datasets/WIKI/"+tickerSymbol+".json?column_index=4&start_date=2014-01-01&end_date=2014-12-31&api_key="+QUANDL_KEY;
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = null;
		try {
			rootNode = mapper.readTree(new URL(url));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JsonNode datasetNode = rootNode.path("dataset");
		JsonNode data = datasetNode.path("data");	//
		Iterator<JsonNode> iterator = data.getElements();
		ArrayList<CompanyValue> comp = new ArrayList<CompanyValue>();
		while(iterator.hasNext()) {
			JsonNode dataIt = iterator.next();
			System.out.println(dataIt.toString());
			String sDate = dataIt.get(0).asText();
	
			double value = dataIt.get(1).asDouble();
			System.out.println(new CompanyValue(sDate,value));
			comp.add(new CompanyValue(sDate,value));
		}
		Collections.reverse(comp);
		return comp;
		
	}
	 private boolean cheackDates(String dateStart, String dateEnd) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar caldateStart  = Calendar.getInstance();
			Calendar caldateEnd  = Calendar.getInstance();
			try {
				caldateStart.setTime(df.parse(dateStart));
				caldateEnd.setTime(df.parse(dateEnd));
				if(caldateStart.getTimeInMillis()>=caldateEnd.getTimeInMillis()) {
					return false;
				}
				else {
					return true;
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		 
	 }
}
