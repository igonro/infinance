package model;

public class CompanyInfo {
	private String name;
	private String symbol;
	private int marketCap;
	private String sector;
	private String industry;
	private Double price;

	public CompanyInfo(String name, String symbol, int marketCap, String sector, String industry, Double price) {
		this.name = name;
		this.symbol = symbol;
		this.marketCap = marketCap;
		this.sector = sector;
		this.industry = industry;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public int getMarketCap() {
		return marketCap;
	}

	public void setMarketCap(int market) {
		this.marketCap = market;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}
}
