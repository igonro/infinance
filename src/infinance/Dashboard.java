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
		String query=  request.getQueryString(); 
		if(query!=null) {
			String queryArray[]=query.split("\\?");
			if(queryArray.length>2) {
				String symbol =queryArray[0];
				String dataStart= queryArray[1];
				String dataEnd= queryArray[2];
				ArrayList<CompanyValue> company = callAPI(symbol,dataStart,dataEnd);	
				request.setAttribute("Company", company);
			}
			else {
				String symbol =queryArray[0];
				ArrayList<CompanyValue> company = callAPI(symbol);	
				request.setAttribute("Company", company);
			}
		}
		RequestDispatcher rd = sc.getRequestDispatcher("/dashboard.jsp");
		rd.forward(request, response);
	
		
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
	protected void drawChart(PrintWriter out) {
		out.println("<html>");
		out.println("<head>");
		out.println("<script type=\"text/javascript\" src=\"https://www.gstatic.com/charts/loader.js\"></script>");
		out.println("<script type=\"text/javascript\">");
		out.println("google.charts.load(\'current\', {\'packages\':[\'line\']})");
		out.println("google.charts.setOnLoadCallback(drawChart)");

		out.println("function drawChart() {");

		out.println("var data = new google.visualization.DataTable();");
		out.println("data.addColumn(\'number\', \'Day\');");
		out.println("data.addColumn('number', 'Guardians of the Galaxy');");
		out.println(" data.addColumn('number', 'The Avengers');");
		out.println("data.addColumn('number', 'Transformers: Age of Extinction');");

		out.println("data.addRows([");
      out.println(" [1,  37.8, 80.8, 41.8],");
    	out.println("[2,  30.9, 69.5, 32.4],");
    	out.println(" [3,  25.4,   57, 25.7],");
    	out.println(" [4,  11.7, 18.8, 10.5],");
    	out.println("[5,  11.9, 17.6, 10.4],");
    	out.println(" [6,   8.8, 13.6,  7.7],");
    	out.println("  [7,   7.6, 12.3,  9.6],");
    	out.println("  [8,  12.3, 29.2, 10.6],");
    	out.println("[9,  16.9, 42.9, 14.8],");
    	out.println("[10, 12.8, 30.9, 11.6],");
    	out.println(" [11,  5.3,  7.9,  4.7],");
    	out.println("[12,  6.6,  8.4,  5.2],");
    	out.println("[13,  4.8,  6.3,  3.6],");
    	out.println("[14,  4.2,  6.2,  3.4]");
    	out.println(" ]);");

    	out.println("var options = {");
    	out.println("chart: {");
    	out.println(" title: 'Box Office Earnings in First Two Weeks of Opening',");
    	out.println(" subtitle: 'in millions of dollars (USD)'");
    	out.println(" },");
    	out.println("width: 900,");
    	out.println(" height: 500,");
    	out.println("axes: {");
    	out.println("x: {");
    	out.println("0: {side: 'top'}");
    	out.println("   }");
    	out.println("}");
    	out.println(" };");

    	out.println(" var chart = new google.charts.Line(document.getElementById('line_top_x'));");

    	out.println(" chart.draw(data, google.charts.Line.convertOptions(options));");
    	out.println("}");
    	out.println("</script>");
    	out.println("</head>");
    	out.println("<body>");
    	out.println("<div id=\"line_top_x\"></div>");
    	out.println("</body>");
    	out.println("</html>");
	}
}
