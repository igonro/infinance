package model;

public class HistoryUser {

	
	

	public int getId_transaction() {
		return id_transaction;
	}
	public void setId_transaction(int id_transaction) {
		this.id_transaction = id_transaction;
	}

	public String getId_company() {
		return symbol;
	}
	public void setId_company(String id_company) {
		this.symbol = id_company;
	}
	public String getDateAction() {
		return dateAction;
	}
	public void setDateAction(String dateAction) {
		this.dateAction = dateAction;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTransaction() {
		return transaction;
	}
	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}
	public float getValue() {
		return value;
	}
	public void setValue(float value) {
		this.value = value;
	}
	public float getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(float total_cost) {
		this.total_cost = total_cost;
	}


	public HistoryUser(String symbol, String dateAction, int num, String transaction, float value, int id_transaction,
			float total_cost) {
		super();
		this.symbol = symbol;
		this.dateAction = dateAction;
		this.num = num;
		this.transaction = transaction;
		this.value = value;
		this.id_transaction = id_transaction;
		this.total_cost = total_cost;
	}


	private String symbol;
	private String dateAction;
	private int num;
	private String transaction;
	private float value ;
	private int id_transaction;
	private float total_cost;

	

}
