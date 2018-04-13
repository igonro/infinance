package model;

public class PortfolioUser {
	
	
	private String symbol;
	private int num;
	private float costes;
	private float ventas;
	private float valor_actual;
	private float balance;
	
	@Override
	public String toString() {
		return "PortfolioUser [symbol=" + symbol + ", num=" + num + ", costes=" + costes + ", ventas=" + ventas
				+ ", valor_actual=" + valor_actual + ", balance=" + balance + "]";
	}
	public PortfolioUser(String symbol, int num, float costes) {
		super();
		this.symbol = symbol;
		this.num = num;
		this.costes = costes;
	}
	public PortfolioUser(String symbol, int num, float costes, float ventas, float valor_actual, float balance) {
		super();
		this.symbol = symbol;
		this.num = num;
		this.costes = costes;
		this.ventas = ventas;
		this.valor_actual = valor_actual;
		this.balance = balance;
	}
	
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public float getCostes() {
		return costes;
	}
	public void setCostes(float costes) {
		this.costes = costes;
	}
	public float getVentas() {
		return ventas;
	}
	public void setVentas(float ventas) {
		this.ventas = ventas;
	}
	public float getValor_actual() {
		return valor_actual;
	}
	public void setValor_actual(float valor_actual) {
		this.valor_actual = valor_actual;
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}


}
