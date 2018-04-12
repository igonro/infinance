package model;

import java.util.Calendar;
import java.util.Date;

public class CompanyValue {
	public CompanyValue(String date, double value) {
		super();
		this.date = date;
		this.value = value;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		return "CompanyValue [date=" + date + ", value=" + value + "]";
	}
	String date;
	double value;
}
