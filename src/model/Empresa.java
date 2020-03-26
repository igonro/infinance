
package model;

import java.math.BigDecimal;

public class Empresa {
private String symbol;
private String name;
private float lastsale;
private BigDecimal marketcap;
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
public float getLastsale() {
	return lastsale;
}
public void setLastsale(int lastscale) {
	this.lastsale = lastscale;
}
public BigDecimal getMarketcap() {
	return marketcap;
}
public void setMarketcap(BigDecimal marketcap) {
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
public Empresa(String symbol, String name, float lastsale, BigDecimal marketcap, int address, String sector, String industry,
		String summaryquote, int ipoyear) {
	super();
	this.symbol = symbol;
	this.name = name;
	this.lastsale = lastsale;
	this.marketcap = marketcap;
	this.address = address;
	this.sector = sector;
	this.industry = industry;
	this.summaryquote = summaryquote;
	this.ipoyear = ipoyear;
}
@Override
public String toString() {
	return "symbol=" + symbol + ", name=" + name + ", lastsale=" + lastsale + ", marketcap=" + marketcap
			+ ", address=" + address + ", sector=" + sector + ", industry=" + industry + ", summaryquote="
			+ summaryquote + ", ipoyear=" + ipoyear;
}


}
