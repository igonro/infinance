package utils;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import org.jdom2.Document;
import org.jdom2.Element;
import model.Usuario;
import model.Empresa;
import model.HistoryUser;
import model.PortfolioUser;
import model.UserInfo;

public class DatabaseManager {
	// Tabla usuario
	public static final String TABLE_USER = "USER";
	public static final String CN_ID_USER = "ID";
	public static final String CN_DATA_REGISTER = "dateRegister";
	public static final String CN_TYPE = "type";
	public static final String CN_USER = "user";
	public static final String CN_PASSWORD = "password";
	public static final String CN_EMAIL = "email";
	public static final String CN_FIRST_NAME = "firstName";
	public static final String CN_LAST_NAME = "lastName";
	public static final String CN_PHONE = "phone";
	public static final String CN_APIKey = "APIKey";

	// Tabla acciones
	public static final String TABLE_SHARES = "SHARES";
	public static final String CN_ID_SHARES = "ID";
	public static final String CN_ID_USER_SHARES = "id_user";
	public static final String CN_ID_COMPANY_SHARES = "id_company";
	public static final String CN_DATE_ACTION = "dateAction";
	public static final String CN_VALUE = "value";
	public static final String CN_NUM = "num";
	public static final String CN_TRANSACTION = "transaction";

	// Tabla company

	public static final String TABLE_COMPANY = "COMPANY";
	public static final String CN_ID_COMPANY = "ID";
	public static final String CN_NAME_COMPANY = "name";
	public static final String CN_SYMBOL = "symbol";
	public static final String CN_LAST_SALE = "lastSale";
	public static final String CN_MARKETCAP = "marketCap";
	public static final String CN_SECTOR = "sector";
	public static final String CN_INDUSTRY = "industry";
	public static final String CN_SUMMARY = "summary";
	public static final String CN_MARKET = "market";
	public static final String CN_ADRTSO = "ADRTSO";
	public static final String CN_IPOYEAR = "IPOyear";


	private static final String dblogin = "adminInfinance";
	private static final String dbpasswd = "proyectoDAT";

	private static String lastError = "Sin errores";

	public static int register(String type, String user, String password, String email, String firstName,
			String lastName, String phone, String randomString) {
		Statement stmt = openConnection();
		String insert = "insert into " + TABLE_USER + " " + "(" + CN_TYPE + "," + CN_USER + "," + CN_PASSWORD + ","
				+ CN_EMAIL + "," + CN_FIRST_NAME + "," + CN_LAST_NAME + "," + CN_PHONE + "," + CN_APIKey + ") "
				+ "values (" + type + "," + "\"" + user + "\"," + "\"" + password + "\"," + "\"" + email + "\"," + "\""
				+ firstName + "\"," + "\"" + lastName + "\"," + phone + ",\"" + randomString + "\");";
		System.out.println(insert);
		try {
			stmt.executeUpdate(insert);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			convertErrorRegisterUser(e.getMessage());
			closeConnection(stmt);
			return -1;
		}
	}

	public static UserInfo login(String user, String password) {
		Statement stmt = openConnection();
		String query = "Select * from " + TABLE_USER + " where " + CN_USER + "=" + "\"" + user + "\" and " + CN_PASSWORD
				+ " = " + "\"" + password + "\";";
		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {

				int id_user = rs.getInt(CN_ID_USER);
				int type = rs.getInt(CN_TYPE);
				String nameUser = rs.getString(CN_USER);
				lastError = "Sin errores";
				closeConnection(stmt);
				return (new UserInfo(nameUser,id_user, type));
				

			} else {
				lastError = "El usuario " + user + " y/o la contasena no son correctos";
				closeConnection(stmt);
				return (new UserInfo("errorUsuario",-1));
			}

		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			closeConnection(stmt);
			return (new UserInfo("errorUsuario",-1));
		}

	}

	public static int transactionShares(int id_user, String symbol, int numero,float value,String type) {
		Statement stmt = openConnection();
		int id_company;
		

		try {
			String query = "Select " + CN_ID_COMPANY + "," + CN_LAST_SALE + " from " + TABLE_COMPANY + " where "
					+ CN_SYMBOL + "=" + "\"" + symbol + "\";";
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);

			if (rs.next()) {
				id_company = rs.getInt(CN_ID_COMPANY);
				//value = rs.getFloat(CN_LAST_SALE);
			} else {
				lastError = "No existe la empresa con el simbolo " + symbol;
				closeConnection(stmt);
				return -1;
			}

			String insert = "insert into " + TABLE_SHARES + " " + "(" + CN_ID_COMPANY_SHARES + "," + CN_ID_USER_SHARES
					+ "," + CN_NUM + "," + CN_VALUE + ","+CN_TRANSACTION+") " + "values (" + id_company + "," + id_user + "," + numero
					+ "," + value + ",\"" + type + "\");";
			System.out.println(insert);
			stmt.executeUpdate(insert);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;

		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError = "Error desconocido. Ver debug";
			closeConnection(stmt);
			return -1;
		}

	}

	public static Empresa busquedaEmpresaPorSymbol(String symbol) {
		Statement stmt = openConnection();
		String query = "Select * from " + TABLE_COMPANY + " where " + CN_SYMBOL + " = " + "\"" + symbol + "\" ;";
		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			Empresa emp = null;
			while (rs.next()) {
				String symb = rs.getString(CN_SYMBOL);
				String name = rs.getString(CN_NAME_COMPANY);
				float lastsale = rs.getFloat(CN_LAST_SALE);
				BigDecimal marketcap = rs.getBigDecimal(CN_MARKETCAP);
				int address = rs.getInt(CN_ADRTSO);
				String sector = rs.getString(CN_SECTOR);
				String industry = rs.getString(CN_INDUSTRY);
				String summaryquote = rs.getString(CN_SUMMARY);
				int ipo = rs.getInt(CN_IPOYEAR);

				emp = new Empresa(symb, name, lastsale, marketcap, address, sector, industry, summaryquote,ipo);
			}
			closeConnection(stmt);
			return emp;
			/*
			 * else { lastError="La empresa con el simbolo "+startsWithsymbol+" no existe";
			 * closeConnection(stmt) ; return -1; }
			 */

		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			closeConnection(stmt);
			return null;
		}
	}

	public static ArrayList<Empresa> busquedaTodasEmpresas() {
		Statement stmt = openConnection();
		String query = "Select * from " + TABLE_COMPANY + ";";
		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			ArrayList<Empresa> empresas = new ArrayList<Empresa>();
			while (rs.next()) {

				String symbol = rs.getString(CN_SYMBOL);
				String name = rs.getString(CN_NAME_COMPANY);
				float lastsale = rs.getFloat(CN_LAST_SALE);
				BigDecimal marketcap = rs.getBigDecimal(CN_MARKETCAP);
				int address = rs.getInt(CN_ADRTSO);
				String sector = rs.getString(CN_SECTOR);
				String industry = rs.getString(CN_INDUSTRY);
				String summaryquote = rs.getString(CN_SUMMARY);
				int ipo = rs.getInt(CN_IPOYEAR);

				Empresa emp = new Empresa(symbol, name, lastsale, marketcap, address, sector, industry, summaryquote,ipo);
				empresas.add(emp);

			}
			closeConnection(stmt);
			return empresas;
			/*
			 * else { lastError="La empresa con el simbolo "+startsWithsymbol+" no existe";
			 * closeConnection(stmt) ; return -1; }
			 */

		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			closeConnection(stmt);
			return null;
		}
	}

	public static ArrayList<Empresa> busquedaEmpresa(String startsWithsymbol) {
		Statement stmt = openConnection();
		String query = "Select * from " + TABLE_COMPANY + " where " + CN_SYMBOL + " LIKE " + "\"" + startsWithsymbol
				+ "%\" ;";
		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			ArrayList<Empresa> empresas = new ArrayList<Empresa>();
			while (rs.next()) {
				String symbol = rs.getString(CN_SYMBOL);
				String name = rs.getString(CN_NAME_COMPANY);
				float lastsale = rs.getFloat(CN_LAST_SALE);
				BigDecimal marketcap = rs.getBigDecimal(CN_MARKETCAP);
				int address = rs.getInt(CN_ADRTSO);
				String sector = rs.getString(CN_SECTOR);
				String industry = rs.getString(CN_INDUSTRY);
				String summaryquote = rs.getString(CN_SUMMARY);
				int ipo = rs.getInt(CN_IPOYEAR);

				Empresa emp = new Empresa(symbol, name, lastsale, marketcap, address, sector, industry, summaryquote,ipo);
				empresas.add(emp);

			}
			closeConnection(stmt);
			return empresas;
			/*
			 * else { lastError="La empresa con el simbolo "+startsWithsymbol+" no existe";
			 * closeConnection(stmt) ; return -1; }
			 */

		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			closeConnection(stmt);
			return null;
		}
	}

	public static ArrayList<HistoryUser> getHistory(int id_user) {
		Statement stmt = openConnection();
		// String query = "Select * from "+TABLE_SHARES+" WHERE "+
		// CN_ID_USER_SHARES+"="+id_user+";";

		String query = "SELECT " + TABLE_SHARES + "." + CN_DATE_ACTION + ", " + TABLE_SHARES + "." + CN_ID_SHARES + ", "
				+ TABLE_SHARES + "." + CN_VALUE + "," + TABLE_SHARES + "." + CN_NUM + "," + TABLE_SHARES + "."
				+ CN_TRANSACTION + "," + TABLE_COMPANY + "." + CN_SYMBOL + "\n" + "FROM " + TABLE_SHARES + "\n"
				+ "JOIN COMPANY ON " + TABLE_SHARES + "." + CN_ID_COMPANY_SHARES + "=" + TABLE_COMPANY + "."
				+ CN_ID_COMPANY + " where " + CN_ID_USER_SHARES + "=" + id_user + ";";

		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			ArrayList<HistoryUser> history = new ArrayList<HistoryUser>();
			while (rs.next()) {
				int id_transaction = rs.getInt(CN_ID_SHARES);
				String symbol = rs.getString(CN_SYMBOL);
				String dateAction = rs.getString(CN_DATE_ACTION);
				int num = rs.getInt(CN_NUM);
				float value = rs.getFloat(CN_VALUE);
				String transaction = rs.getString(CN_TRANSACTION);

				if (transaction == null) {
					transaction = "purchase";
				}
				history.add(new HistoryUser(symbol, dateAction, num, transaction, value, id_transaction, value * num));

			}
			closeConnection(stmt);
			return history;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			lastError = "Error al obtener el usuario";
			closeConnection(stmt);
			return null;
		}

	}

	public static String getAPIKey(int idUser) {
		Statement stmt = openConnection();
		String query = "Select " + CN_APIKey + " from " + TABLE_USER + " where " + CN_ID_USER + "=" + "\"" + idUser
				+ "\";";
		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				String key = rs.getString(CN_APIKey);
				closeConnection(stmt);
				return key;
			} else {
				closeConnection(stmt);
				return null;
			}

		} catch (SQLException ex) {
			System.err.print("SQLException: ");
			System.err.println(ex.getMessage());
			closeConnection(stmt);
			return null;
		}
	}

	public static ArrayList<PortfolioUser> getPortfolio(int id_user) {
		Statement stmt = openConnection();
		// String query = "Select * from "+TABLE_SHARES+" WHERE "+
		// CN_ID_USER_SHARES+"="+id_user+";";

		String query = "SELECT " + TABLE_SHARES + "." + CN_DATE_ACTION + ", " + TABLE_SHARES + "." + CN_ID_SHARES + ", "
				+ TABLE_SHARES + "." + CN_VALUE + "," + TABLE_SHARES + "." + CN_NUM + "," + TABLE_SHARES + "."
				+ CN_TRANSACTION + "," + TABLE_COMPANY + "." + CN_SYMBOL + "\n" + "FROM " + TABLE_SHARES + "\n"
				+ "JOIN COMPANY ON " + TABLE_SHARES + "." + CN_ID_COMPANY_SHARES + "=" + TABLE_COMPANY + "."
				+ CN_ID_COMPANY + " where " + CN_ID_USER_SHARES + "=" + id_user + ";";

		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			HashMap<String, PortfolioUser> compras = new HashMap<String, PortfolioUser>();
			HashMap<String, PortfolioUser> ventas = new HashMap<String, PortfolioUser>();
			while (rs.next()) {
				int id_transaction = rs.getInt(CN_ID_SHARES);
				String symbol = rs.getString(CN_SYMBOL);
				String dateAction = rs.getString(CN_DATE_ACTION);
				int num = rs.getInt(CN_NUM);
				float value = rs.getFloat(CN_VALUE);
				String transaction = rs.getString(CN_TRANSACTION);

				if (transaction.equals("purchase")) {
					if (compras.containsKey(symbol)) {
						float costes = compras.get(symbol).getCostes() + value * num;
						num = compras.get(symbol).getNum() + num;
						compras.put(symbol, new PortfolioUser(symbol, num, costes));
					} else {

						compras.put(symbol, new PortfolioUser(symbol, num, value * num));
					}
				} else {
					if (ventas.containsKey(symbol)) {
						float dinero_ventas = ventas.get(symbol).getCostes() + value * num;
						num = ventas.get(symbol).getNum() + num;
						ventas.put(symbol, new PortfolioUser(symbol, num, dinero_ventas));

					} else {
						ventas.put(symbol, new PortfolioUser(symbol, num, value * num));
					}

				}

			}
			ArrayList<PortfolioUser> portfoliouser = new ArrayList<PortfolioUser>();
			for (String symbol : compras.keySet()) {
				double actualValue= RequestAPI.getMostRecentCloseValue(symbol);
				System.out.println(actualValue);
				int num = compras.get(symbol).getNum();
				float costes = compras.get(symbol).getCostes();
				float dinero_ventas = 0;
				if (ventas.containsKey(symbol)) {
					num = num - ventas.get(symbol).getNum();
					dinero_ventas = ventas.get(symbol).getCostes(); // Aqui costes son en realidad el dinero de ventas .
																	// Esto es porque no se puede hacer dos
																	// constructures iguales
				}
				float valor_actual= (float) (num*actualValue);
				float balance = valor_actual+dinero_ventas-costes;
				PortfolioUser portfolio = new PortfolioUser(symbol, num, costes, dinero_ventas,  valor_actual, balance);
				System.out.println(portfolio);
				portfoliouser.add(portfolio);

			}
			closeConnection(stmt);
			return portfoliouser;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			lastError = "Error al obtener el usuario";
			closeConnection(stmt);
			return null;
		}

	}

	public static Usuario getUserInfo(int id) {
		Statement stmt = openConnection();
		String query = "Select * from " + TABLE_USER + " where " + CN_ID_USER + "=" + "\"" + id + "\";";
		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {

				String userName = rs.getString(CN_USER);
				String firstName = rs.getString(CN_FIRST_NAME);
				String lastName = rs.getString(CN_LAST_NAME);
				String phone = rs.getString(CN_PHONE);
				String email = rs.getString(CN_EMAIL);
				lastError = "Sin errores";
				closeConnection(stmt);
				return new Usuario(userName, firstName, lastName, phone, email);

			} else {
				lastError = "El id de usuario  " + id + " no es correcto";
				closeConnection(stmt);
				return null;
			}

		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			closeConnection(stmt);
			return null;
		}

	}

	public static int updateUserInfo(int id, String user, String email, String firstName, String lastName, String phone) {
		Statement stmt = openConnection();

		String insert = "update " + TABLE_USER + " " + "SET " + CN_USER + "=" + "\"" + user + "\"," + CN_EMAIL + "="
				+ "\"" + email + "\"," + CN_FIRST_NAME + "=" + "\"" + firstName + "\"," + CN_LAST_NAME + "=" + "\""
				+ lastName + "\"," + CN_PHONE + "=" + phone  + " WHERE " + CN_ID_USER + "=" + id + ";";
		System.out.println(insert);
		try {
			stmt.executeUpdate(insert);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			convertErrorRegisterUser(e.getMessage());
			closeConnection(stmt);
			return -1;
		}

	}

	public static int changePassword(int id, String oldPassword, String newPassword) {
		Statement stmt = openConnection();
		String query = "Select * from " + TABLE_USER + " where " + CN_ID_USER + "=" + "\"" + id + "\";";
		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			String bdPassword = "";
			if (rs.next()) {
				bdPassword = rs.getString(CN_PASSWORD);

			}
			if (!bdPassword.equals(oldPassword)) {
				closeConnection(stmt);
				return -1;
			}

			String update = "update " + TABLE_USER + " " + "SET " + CN_PASSWORD + "=" + "\"" + newPassword + "\""
					+ " WHERE " + CN_ID_USER + "=" + id + ";";
			System.out.println(update);
			stmt.executeUpdate(update);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			convertErrorRegisterUser(e.getMessage());
			closeConnection(stmt);
			return -1;
		}

	}
	public static int deleteUser(int id_user) {
		Statement stmt = openConnection();

		String delete = "Delete from "+TABLE_USER+" where "+CN_ID_USER+"="+id_user+";";
		System.out.println(delete);
		try {
			stmt.executeUpdate(delete);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError="No se pudo elimniar el usuario";
			closeConnection(stmt);
			return -1;
		}
		
	}

	public static int updateUser(int id_user) {
		Statement stmt = openConnection();

		String delete = "UPDATE "+TABLE_USER+" SET "+CN_TYPE+"="+2+" WHERE "+CN_ID_USER+"="+id_user+";";
		System.out.println(delete);
		try {
			stmt.executeUpdate(delete);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError="No se pudo elimniar el usuario";
			closeConnection(stmt);
			return -1;
		}
		
	}
	
	public static ArrayList<Usuario> getNormalUsers() {
		Statement stmt = openConnection();
		String query = "SELECT * FROM  "+TABLE_USER+"  WHERE "+CN_TYPE+"="+1+";";
		System.out.println(query);
		try {
			ResultSet rs=stmt.executeQuery(query);
			lastError = "Sin errores";
			ArrayList<Usuario>usuarios =new ArrayList<Usuario>();
			while (rs.next()) {
				
				String userName = rs.getString(CN_USER);
				String firstName = rs.getString(CN_FIRST_NAME);
				String lastName = rs.getString(CN_LAST_NAME);
				String phone = rs.getString(CN_PHONE);
				String email = rs.getString(CN_EMAIL);
				String id_user = rs.getString(CN_ID_USER);
				Usuario user= new Usuario(userName,firstName,lastName,phone,email,id_user);
				usuarios.add(user);
			
				
			}
			lastError = "Sin errores";
			closeConnection(stmt);
			return usuarios;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError="No se encontraron usuarios";
			closeConnection(stmt);
			return null;
		}
		
	}
	
	public static int updateCompany(String symbol,String companyName,BigDecimal marketCap, float lastsale,int ipoyear,String sector, String industry) {
		Statement stmt = openConnection();
		String update = "UPDATE "+TABLE_COMPANY+" SET "+CN_NAME_COMPANY+"="+"\"" + companyName + "\", "+CN_MARKETCAP+"="+marketCap+","+CN_LAST_SALE+"="+lastsale+","+CN_IPOYEAR+"="+ipoyear+","
				+ ""+CN_SECTOR+"="+"\"" + sector + "\","+CN_INDUSTRY+"="+"\"" + industry + "\" where "+CN_SYMBOL+"="+"\""+symbol+"\";";  
		System.out.println(update);
		try {
			stmt.executeUpdate(update);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError="No se pudo actulizar la empresa ";
			closeConnection(stmt);
			return -1;
		}
	}
	
	public static int deleteCompany(String symbol) {
		Statement stmt = openConnection();

		String delete = "Delete from "+TABLE_COMPANY+" where "+CN_SYMBOL+"="+"\"" + symbol + "\";";
		System.out.println(delete);
		try {
			stmt.executeUpdate(delete);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError="No se pudo elimniar el usuario";
			closeConnection(stmt);
			return -1;
		}
		
	}
	public static void updateLastValue(String symbol, double closePrice) {
		Statement stmt = openConnection();
		String update = "UPDATE "+TABLE_COMPANY+" SET "+CN_LAST_SALE+"="+closePrice + " where "+CN_SYMBOL+"="+"\""+symbol+"\";";  
		System.out.println(update);
		try {
			stmt.executeUpdate(update);
			lastError = "Sin errores";
			closeConnection(stmt);
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError="No se pudo actualizar el valor de la empresa";
			closeConnection(stmt);
		}
		
	}

	public static double getLastValue(String symbol) {
		
		Statement stmt = openConnection();
		String query = "SELECT * FROM  "+TABLE_COMPANY+"  WHERE "+CN_SYMBOL+"="+"\""+symbol+"\";"; 
		System.out.println(query);
		double lastValue=0.0;
		try {
			ResultSet rs=stmt.executeQuery(query);
			while (rs.next()) {
				
				lastValue= rs.getDouble(CN_LAST_SALE);
				 double value= Math.random()*2-1;
				 lastValue =lastValue+value;
				
			}
			lastError = "Sin errores";
			closeConnection(stmt);
			return lastValue;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError="No se pudo recuperar el ultimo valor";
			closeConnection(stmt);
			return lastValue;
		}
		

	}

	
	public static int createCompany(String symbol,String name,float lastSale,BigDecimal marketCap, int ADRTSO, int IPOyear,String sector, String industry,String summary) {
		Statement stmt = openConnection();

		String insert = "insert into "+TABLE_COMPANY+" "
				+ "(symbol,name,lastSale,marketCap,ADRTSO,IPOyear,sector,industry,summary) " + "values (\"" + symbol
				+ "\",\"" + name + "\"," + lastSale + "," + marketCap + "," + ADRTSO + "," + IPOyear + ",\"" + sector
				+ "\",\"" + industry + "\",\"" + summary + "\");";
		System.out.println(insert);
		try {
			stmt.executeUpdate(insert);
			lastError = "Sin errores";
			closeConnection(stmt);
			return 0;
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("Message:  " + e.getMessage());
			System.out.println("SQLSTATE: " + e.getSQLState());
			System.out.println("C�digo de error SQL: " + e.getErrorCode());
			// sqle=sqle.getNextException(); // Recuperar excepci�n de SQL siguiente
			lastError="No se pudo crear la empresa";
			closeConnection(stmt);
			return -1;
		}
		
	}
	public static Document getPortfolioHistory(String key) {

		Statement stmt = openConnection();
		String query = "select COMPANY.name, COMPANY.symbol, IDcomp.dateAction, IDcomp.value, IDcomp.num, IDcomp.transaction from COMPANY join (select SHARES.id_company, SHARES.dateAction, SHARES.num, SHARES.value, SHARES.transaction from SHARES JOIN (select ID FROM USER where APIKey='"
				+ key + "') as IDus on id_user = IDus.ID) as IDcomp on COMPANY.ID=IDcomp.id_company";
		System.out.println(query);
		try {
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				rs.beforeFirst();
				ArrayList<String> companyNames = new ArrayList<String>();
				ArrayList<String> symbols = new ArrayList<String>();
				ArrayList<String> dates = new ArrayList<String>();
				ArrayList<Float> values = new ArrayList<Float>();
				ArrayList<Integer> num = new ArrayList<Integer>();
				ArrayList<String> types = new ArrayList<String>();
				while (rs.next()) {
					companyNames.add(rs.getString("name"));
					symbols.add(rs.getString("symbol"));
					dates.add(rs.getString("dateAction"));
					values.add(rs.getFloat("value"));
					num.add(rs.getInt("num"));
					types.add(rs.getString("transaction"));
				}

				Element root = new Element("portfolio");

				Document document = new Document(root);

				for (int i = 0; i < companyNames.size(); i++) {
					Element transaction = new Element("transaction");
					Element companyName = new Element("companyName");
					companyName.setText(companyNames.get(i));
					transaction.addContent(companyName);
					Element companySymbol = new Element("symbol");
					companySymbol.setText(symbols.get(i));
					transaction.addContent(companySymbol);
					Element date = new Element("date");
					date.setText(dates.get(i));
					transaction.addContent(date);
					Element value = new Element("value");
					value.setText(values.get(i).toString());
					transaction.addContent(value);
					Element amount = new Element("amount");
					amount.setText(num.get(i).toString());
					transaction.addContent(amount);
					Element type = new Element("type");
					type.setText(types.get(i));
					transaction.addContent(type);
					document.getRootElement().addContent(transaction);
				}
				closeConnection(stmt);
				return document;

			} else {
				closeConnection(stmt);
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			closeConnection(stmt);
			return null;
		}

	}

	private static Statement openConnection() {

		try {
			Connection con = DBInteraction();
			return con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	private static void closeConnection(Statement stmt) {
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static Connection DBInteraction() throws SQLException {
		String url = "jdbc:mysql://127.0.0.1:3306/infinancedb";
		// String url = "jdbc:mariadb://127.0.0.1:3306/infinancedb";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// Class.forName("org.mariadb.jdbc.Driver");
		} catch (java.lang.ClassNotFoundException e) {
			System.err.print("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
		try {
			System.out.println("Trying to connect...");
			Connection con = DriverManager.getConnection(url, dblogin, dbpasswd);
			System.out.println("Connected!");
			return con;
		} catch (SQLException ex) {
			System.err.print("SQLException: ");
			System.err.println(ex.getMessage());
			return null;
		}

	}

	private static void convertErrorRegisterUser(String error) {
		if (error.contains("Duplicate entry")) {
			String errorArray[] = error.split("'");
			if (errorArray[3].equals("user")) {
				lastError = "El usuario " + errorArray[1] + " ya esta registrado";
			}
			if (errorArray[3].equals("email")) {
				lastError = "El email " + errorArray[1] + " ya esta registrado";
			}
			if (errorArray[3].equals("phone")) {
				lastError = "El numero " + errorArray[1] + " ya esta registrado";
			}
		}
		else {
			lastError = "Compruebe los datos del registro";
		}

	}

	public static String getLastError() {
		return lastError;
	}

	
}
