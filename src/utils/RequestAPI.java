package utils;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import model.CompanyValue;

public class RequestAPI {

	public static final String QUANDL_KEY = "6zsyn1k-S2oxc38FZfm9";

	public static double getMostRecentCloseValue(String tickerSymbol, String date) {
		// Creamos una URL y establecemos un l�mite de 1 para que nos muestre un s�lo
		// valor, el m�s reciente. As� el programa tarda menos en procesar los datos (si
		// no se establece un l�mite la API devolver�a cientos o miles de datos).
		String url = "https://www.quandl.com/api/v3/datasets/WIKI/" + tickerSymbol
				+ ".json?column_index=4&limit=1&api_key=" + QUANDL_KEY;
		double closePrice = 0.0;
		try {
			ObjectMapper mapper = new ObjectMapper();
			JsonNode rootNode = mapper.readTree(new URL(url));
			JsonNode datasetNode = rootNode.path("dataset");
			JsonNode dataNode = datasetNode.path("data");
			closePrice = dataNode.get(0).get(1).asDouble();
		} catch (IOException e) {
			System.out.println("Symbol sin valor");
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

}
