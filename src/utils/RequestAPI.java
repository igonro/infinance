package utils;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import javax.swing.Timer;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;

import model.CompanyValue;
import model.Dates;

public class RequestAPI {

	public static final String QUANDL_KEY = "6zsyn1k-S2oxc38FZfm9";
	public static final String ALPHA_KEY = "78KJJ86U7AMFDY4T";
	public static long ultimoError;

	public static double getMostRecentCloseValue(String tickerSymbol) {
		// Creamos una URL y establecemos un l�mite de 1 para que nos muestre un s�lo
		// valor, el m�s reciente. As� el programa tarda menos en procesar los datos (si
		// no se establece un l�mite la API devolver�a cientos o miles de datos).
		String url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol="+tickerSymbol+"&interval=1min&outputsize=compact&apikey="+ALPHA_KEY;
		double closePrice = 0.0;
		try {
			if(( System.currentTimeMillis()-ultimoError)>5000) {
				System.setProperty("sun.net.client.defaultConnectTimeout", "5000");
				System.setProperty("sun.net.client.defaultReadTimeout", "5000");
				ObjectMapper mapper = new ObjectMapper();
				JsonNode rootNode = mapper.readTree(new URL(url));
				JsonNode timeseriestNode = rootNode.path("Time Series (1min)");
				Iterator<JsonNode> it = timeseriestNode.getElements();
				JsonNode lastNode = it.next();
				JsonNode closeNode = lastNode.path("4. close");
				closePrice = closeNode.asDouble();
				DatabaseManager.updateLastValue(tickerSymbol,closePrice);
			}
			else {
				closePrice  = DatabaseManager.getLastValue(tickerSymbol);
			}
			
		}catch (IOException e) {
			ultimoError = System.currentTimeMillis();
			System.out.println("Symbol sin valor");
			e.printStackTrace();
			closePrice  = DatabaseManager.getLastValue(tickerSymbol);
		} catch (Exception e) {
			ultimoError = System.currentTimeMillis();
			e.printStackTrace();
			System.out.println("Symbol sin valor");
			closePrice  = DatabaseManager.getLastValue(tickerSymbol);
		}
		return closePrice;
	}

	public static ArrayList<CompanyValue> callAPIbyDate(String tickerSymbol, String dataStart, String dataEnd) {
		String url = "https://www.quandl.com/api/v3/datasets/WIKI/" + tickerSymbol + ".json?column_index=4&start_date="
				+ dataStart + "&end_date=" + dataEnd + "&api_key=" + RequestAPI.QUANDL_KEY;
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
		JsonNode data = datasetNode.path("data"); //
		Iterator<JsonNode> iterator = data.getElements();
		ArrayList<CompanyValue> comp = new ArrayList<CompanyValue>();
		while (iterator.hasNext()) {
			JsonNode dataIt = iterator.next();
			System.out.println(dataIt.toString());
			String sDate = dataIt.get(0).asText();

			double value = dataIt.get(1).asDouble();
			System.out.println(new CompanyValue(sDate, value));
			comp.add(new CompanyValue(sDate, value));
		}
		Collections.reverse(comp);
		return comp;
	}

	public static ArrayList<CompanyValue> callAPIbyTicker(String tickerSymbol) {
		String url = "https://www.quandl.com/api/v3/datasets/WIKI/" + tickerSymbol
				+ ".json?column_index=4&api_key=" + RequestAPI.QUANDL_KEY;
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
		JsonNode data = datasetNode.path("data"); //
		Iterator<JsonNode> iterator = data.getElements();
		ArrayList<CompanyValue> comp = new ArrayList<CompanyValue>();
		while (iterator.hasNext()) {
			JsonNode dataIt = iterator.next();
			System.out.println(dataIt.toString());
			String sDate = dataIt.get(0).asText();

			double value = dataIt.get(1).asDouble();
			System.out.println(new CompanyValue(sDate, value));
			comp.add(new CompanyValue(sDate, value));
		}
		Collections.reverse(comp);
		return comp;

	}
	public static Dates getOldestandNewestDate(String tickerSymbol) {
		String url = "https://www.quandl.com/api/v3/datasets/WIKI/"+ tickerSymbol +"/metadata.json?api_key=" + QUANDL_KEY;
		System.out.println(url);
		try {
			ObjectMapper mapper = new ObjectMapper();
			JsonNode rootNode = mapper.readTree(new URL(url));
			JsonNode datasetNode = rootNode.path("dataset");
			JsonNode dataNode = datasetNode.path("newest_available_date");
			String end = dataNode.asText();
			dataNode = datasetNode.path("oldest_available_date");
			String start = dataNode.asText();
			return new Dates(start, end);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	
	


}
