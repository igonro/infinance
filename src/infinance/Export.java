package infinance;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import model.UserInfo;

/**
 * Servlet implementation class export
 */
@WebServlet("/export")
public class Export extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Export() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext sc = getServletContext();
		if (request.getSession().getAttribute("user") != null) {
			UserInfo userInf = ((UserInfo) request.getSession().getAttribute("user"));
			userInf.setAPIKey(DatabaseManager.getAPIKey(userInf.getUserID()));
			RequestDispatcher rd = sc.getRequestDispatcher("/export.jsp");
			rd.forward(request, response);
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
		System.out.println("post del export");
		ServletContext sc = getServletContext();
		UserInfo userInf = ((UserInfo) request.getSession().getAttribute("user"));
		Document xml = DatabaseManager.getPortfolioHistory(userInf.getAPIKey());
		if (xml != null) {
			crearFicheroXML(xml, sc.getRealPath("/") + userInf.getAPIKey());
			RequestDispatcher rd = sc.getRequestDispatcher("/"+ userInf.getAPIKey() + ".xml");
			rd.forward(request, response);
		}
	}

	private static void crearFicheroXML(Document xml, String key) {
		File xmlfile = new File(key + ".xml");
		System.out.println("holaa");
		XMLOutputter xmlOutput = new XMLOutputter();
		xmlOutput.setFormat(Format.getPrettyFormat());
		try {
			xmlOutput.output(xml, new FileWriter(xmlfile));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
