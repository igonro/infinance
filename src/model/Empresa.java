
package model;

public class Empresa {
private String symbol;
private String name;
private int lastscale;
private int marketcap;
private int address;
private String sector;
private String industry;
private String summaryquote;
private int ipoyear;





public int getIpoyear() {
	return ipoyear;
}
public void setIpoyear(int ipoyear) {
	this.ipoyear = ipoyear;
}
public Empresa(String symbol) {
	super();
	this.symbol = symbol;
	
}
public String getSymbol() {
	return symbol;
}
public void setSymbol(String symbol) {
	this.symbol = symbol;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getLastscale() {
	return lastscale;
}
public void setLastscale(int lastscale) {
	this.lastscale = lastscale;
}
public int getMarketcap() {
	return marketcap;
}
public void setMarketcap(int marketcap) {
	this.marketcap = marketcap;
}
public int getAddress() {
	return address;
}
public void setAddress(int address) {
	this.address = address;
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
public String getSummaryquote() {
	return summaryquote;
}
public void setSummaryquote(String summaryquote) {
	this.summaryquote = summaryquote;
}
public Empresa(String symbol, String name, int lastscale, int marketcap, int address, String sector, String industry,
		String summaryquote, int ipoyear) {
	super();
	this.symbol = symbol;
	this.name = name;
	this.lastscale = lastscale;
	this.marketcap = marketcap;
	this.address = address;
	this.sector = sector;
	this.industry = industry;
	this.summaryquote = summaryquote;
	this.ipoyear = ipoyear;
}
@Override
public String toString() {
	return "symbol=" + symbol + ", name=" + name + ", lastscale=" + lastscale + ", marketcap=" + marketcap
			+ ", address=" + address + ", sector=" + sector + ", industry=" + industry + ", summaryquote="
			+ summaryquote + ", ipoyear=" + ipoyear;
}


}
