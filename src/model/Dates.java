package model;

public class Dates {
	public Dates(String dateStart, String dateEnd) {
		super();
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
	}
	public String getDateStart() {
		return dateStart;
	}
	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	private String dateStart;
	private String dateEnd;

}
