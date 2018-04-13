package infinance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Usuario;
import model.Empresa;

public class DatabaseManager {
	  //Tabla usuario
    public static final String TABLE_USER="USER";
    public static final String CN_ID_USER = "ID";
    public static final String CN_DATA_REGISTER ="dateRegister";
    public static final String CN_TYPE="type";
    public static final String CN_USER="user";
    public static final String CN_PASSWORD="password";
    public static final String CN_EMAIL="email";
    public static final String CN_FIRST_NAME="firstName";
    public static final String CN_LAST_NAME="lastName";
    public static final String CN_PHONE="phone";
    public static final String CN_APIKey="APIKey";
    
	  //Tabla acciones
    public static final String TABLE_SHARES="SHARES";
    public static final String CN_ID_SHARES = "ID";
    public static final String CN_ID_USER_SHARES = "id_user";
    public static final String CN_ID_COMPANY_SHARES="id_company";
    public static final String CN_DATE_ACTION="dateAction";
    public static final String CN_VALUE="value";
    public static final String CN_NUM="num";
    
    //Tabla company
    
    public static final String TABLE_COMPANY="COMPANY";
    public static final String CN_ID_COMPANY = "ID";
    public static final String CN_NAME_COMPANY = "name";
    public static final String CN_SYMBOL= "symbol";
    public static final String CN_LAST_SALE="lastSale";
    public static final String CN_MARKETCAP="marketCap";
    public static final String CN_SECTOR="sector";
    public static final String CN_INDUSTRY="industry";
    public static final String CN_SUMMARY="summary";
    public static final String CN_MARKET="market";
    public static final String CN_ADRTSO="ADRTSO";
    
    
    

   
    
	
	private static final String dblogin = "adminInfinance";
	private static final String dbpasswd = "proyectoDAT";
	
	
	private static String lastError="Sin errores";
	
	
	static int  register(String type,String user,String password,String email, String  firstName, String lastName, String phone,String randomString) {
		Statement stmt=openConnection();
		String insert = "insert into "+TABLE_USER+" "
				+ "("+CN_TYPE+","+CN_USER+","+CN_PASSWORD+","+CN_EMAIL+","+CN_FIRST_NAME+","+CN_LAST_NAME+","+CN_PHONE+","+CN_APIKey+") " + "values ("
						+  type + "," +"\""+ user + "\"," +"\""+ password + "\"," + "\""+ email + "\"," +  "\""+ firstName + "\"," + "\""+ lastName
						+ "\"," + phone + ",\""+randomString+"\");";
		System.out.println(insert);
		try {
			stmt.executeUpdate(insert);
			lastError="Sin errores";
			closeConnection(stmt) ;
			return 0;
		} catch (SQLException e) {
			//e.printStackTrace();
			  System.out.println("Message:  " + e.getMessage());                        
		      System.out.println("SQLSTATE: " + e.getSQLState());            
		      System.out.println("Cï¿½digo de error SQL: " + e.getErrorCode()); 
		     // sqle=sqle.getNextException();     // Recuperar excepciï¿½n de SQL siguiente  
		      convertErrorRegisterUser( e.getMessage());
		      closeConnection(stmt) ;
		      return -1 ;
		}
	}
		
		 static int login(String user,String password) {
			Statement stmt=openConnection();
			String query = "Select * from "+TABLE_USER+" where "+CN_USER+"="+"\""+ user + "\" and "+CN_PASSWORD+" = "+"\""+ password + "\";";
			System.out.println(query);
			try {
				ResultSet rs= stmt.executeQuery(query);
				if(rs.next()) {
			
					
						int id_user= rs.getInt(CN_ID_USER);
						lastError="Sin errores";
						closeConnection(stmt) ;
						return id_user;
					
				}
				else {
					lastError="El usuario "+user+" y/o la contaseï¿½a no son correctos";
					closeConnection(stmt) ;
					return -1; 
				}
				
			} catch (SQLException e) {
				//e.printStackTrace();
				  System.out.println("Message:  " + e.getMessage());                        
			      System.out.println("SQLSTATE: " + e.getSQLState());            
			      System.out.println("Cï¿½digo de error SQL: " + e.getErrorCode()); 
			     // sqle=sqle.getNextException();     // Recuperar excepciï¿½n de SQL siguiente  
			      closeConnection(stmt) ;
			      return -1 ;
			}
			
		}
		private static int comprarAcciones(int id_user,String symbol, int numero) {
			Statement stmt=openConnection();
			int id_company;
			float value;
		
			try {
				String query = "Select "+CN_ID_COMPANY+","+CN_LAST_SALE+" from "+TABLE_COMPANY+" where "+CN_SYMBOL+"="+"\""+ symbol  + "\";";
				System.out.println(query);
				ResultSet rs= stmt.executeQuery(query);
				
				if(rs.next()) {
					id_company=rs.getInt(CN_ID_COMPANY);
					value= rs.getFloat(CN_LAST_SALE);
				}
				else {
					lastError="No existe la empresa con el simbolo "+symbol;
					closeConnection(stmt) ;
					return -1;
				}
			
			
			
		
			String insert = "insert into "+TABLE_SHARES+" "
					+ "("+CN_ID_COMPANY_SHARES+","+CN_ID_USER_SHARES+","+CN_NUM+","+CN_VALUE+") " + "values ("+id_company+","+id_user+","+numero+","+value+");";
			System.out.println(insert);
			stmt.executeUpdate(insert);
			lastError="Sin errores";
			closeConnection(stmt) ;
			return 0;
	
			}
			catch (SQLException e) {
				//e.printStackTrace();
				  System.out.println("Message:  " + e.getMessage());                        
			      System.out.println("SQLSTATE: " + e.getSQLState());            
			      System.out.println("Cï¿½digo de error SQL: " + e.getErrorCode()); 
			     // sqle=sqle.getNextException();     // Recuperar excepciï¿½n de SQL siguiente  
			      lastError="Error desconocido. Ver debug";
			      closeConnection(stmt) ;
			      return -1 ;
			}
			
			
		}
		 static Usuario getUserInfo(int id) {
				Statement stmt=openConnection();
				String query = "Select * from "+TABLE_USER+" where "+CN_ID_USER+"="+"\""+ id + "\";";
				System.out.println(query);
				try {
					ResultSet rs= stmt.executeQuery(query);
					if(rs.next()) {
				
										String userName = rs.getString(CN_USER);
							String firstName = rs.getString(CN_FIRST_NAME);
							String lastName = rs.getString(CN_LAST_NAME);
							String phone = rs.getString(CN_PHONE);
							String email = rs.getString(CN_EMAIL);
							lastError="Sin errores";
							closeConnection(stmt) ;
							return new Usuario(userName,firstName,lastName,phone,email);
						
					}
					else {
						lastError="El id de usuario  "+id+" no es correcto";
						closeConnection(stmt) ;
						return null; 
					}
					
				} catch (SQLException e) {
					//e.printStackTrace();
					  System.out.println("Message:  " + e.getMessage());                        
				      System.out.println("SQLSTATE: " + e.getSQLState());            
				      System.out.println("Cï¿½digo de error SQL: " + e.getErrorCode()); 
				     // sqle=sqle.getNextException();     // Recuperar excepciï¿½n de SQL siguiente  
				      closeConnection(stmt) ;
				      return null ;
				}
				
			}
		 static int updateUserInfo(int id,String user,String email, String  firstName, String lastName, String phone) {
			 Statement stmt=openConnection();
				String insert = "update "+TABLE_USER+" "
						+ "SET "+CN_USER+"="+"\""+user+"\","+CN_EMAIL+"="+"\""+email+"\","+CN_FIRST_NAME+"="+"\""+firstName+"\","+CN_LAST_NAME+"="+"\""+lastName+"\","+CN_PHONE+"="+"\""+phone +"\""+ 
							" WHERE "+CN_ID_USER+"="+id+";";
				System.out.println(insert);
				try {
					stmt.executeUpdate(insert);
					lastError="Sin errores";
					closeConnection(stmt) ;
					return 0;
				} catch (SQLException e) {
					//e.printStackTrace();
					  System.out.println("Message:  " + e.getMessage());                        
				      System.out.println("SQLSTATE: " + e.getSQLState());            
				      System.out.println("Cï¿½digo de error SQL: " + e.getErrorCode()); 
				     // sqle=sqle.getNextException();     // Recuperar excepciï¿½n de SQL siguiente  
				      convertErrorRegisterUser( e.getMessage());
				      closeConnection(stmt) ;
				      return -1 ;
				}
				
			}
		 static ArrayList<Empresa>  busquedaEmpresa(String startsWithsymbol) {
			Statement stmt=openConnection();
			String query = "Select * from "+TABLE_COMPANY+" where "+CN_SYMBOL+" LIKE "+"\""+ startsWithsymbol + "%\" ;";
			System.out.println(query);
			try {
				ResultSet rs= stmt.executeQuery(query);
				ArrayList<Empresa> empresas = new ArrayList<Empresa>();
				while(rs.next()) {
			
					
						
					
						String symbol=rs.getString(CN_SYMBOL);
						String name=rs.getString(CN_NAME_COMPANY);
						 int lastscale=rs.getInt(CN_LAST_SALE);
						int marketcap=rs.getInt(CN_MARKET);
						String address=rs.getString(CN_ADRTSO);
						 String sector=rs.getString(CN_SECTOR);
						 String industry=rs.getString(CN_INDUSTRY);
						String summaryquote=rs.getString(CN_SUMMARY);
						Empresa emp = new Empresa( symbol, name, lastscale, marketcap, address, sector,  industry,
								 summaryquote);
						empresas.add(emp);
					
				}
			return empresas;
				/*else {
					lastError="La empresa con el simbolo "+startsWithsymbol+" no existe";
					closeConnection(stmt) ;
					return -1; 
				}*/
				
			} catch (SQLException e) {
				//e.printStackTrace();
				  System.out.println("Message:  " + e.getMessage());                        
			      System.out.println("SQLSTATE: " + e.getSQLState());            
			      System.out.println("Código de error SQL: " + e.getErrorCode()); 
			     // sqle=sqle.getNextException();     // Recuperar excepción de SQL siguiente  
			      closeConnection(stmt) ;
			      return null ;
			}
			
		}
		static ArrayList<Empresa>  busquedaTodasEmpresas() {
			Statement stmt=openConnection();
			String query = "Select * from "+TABLE_COMPANY+ ";";
			System.out.println(query);
			try {
				ResultSet rs= stmt.executeQuery(query);
				ArrayList<Empresa> empresas = new ArrayList<Empresa>();
				while(rs.next()) {
			
					
						
					
						String symbol=rs.getString(CN_SYMBOL);
						String name=rs.getString(CN_NAME_COMPANY);
						 int lastscale=rs.getInt(CN_LAST_SALE);
						int marketcap=rs.getInt(CN_MARKET);
						String address=rs.getString(CN_ADRTSO);
						 String sector=rs.getString(CN_SECTOR);
						 String industry=rs.getString(CN_INDUSTRY);
						String summaryquote=rs.getString(CN_SUMMARY);
						Empresa emp = new Empresa( symbol, name, lastscale, marketcap, address, sector,  industry,
								 summaryquote);
						empresas.add(emp);
					
				}
			return empresas;
				/*else {
					lastError="La empresa con el simbolo "+startsWithsymbol+" no existe";
					closeConnection(stmt) ;
					return -1; 
				}*/
				
			} catch (SQLException e) {
				//e.printStackTrace();
				  System.out.println("Message:  " + e.getMessage());                        
			      System.out.println("SQLSTATE: " + e.getSQLState());            
			      System.out.println("Código de error SQL: " + e.getErrorCode()); 
			     // sqle=sqle.getNextException();     // Recuperar excepción de SQL siguiente  
			      closeConnection(stmt) ;
			      return null ;
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
//		String url = "jdbc:mysql://127.0.0.1:3306/infinancedb";
		String url = "jdbc:mariadb://127.0.0.1:3306/infinancedb";
		try {
//			Class.forName("com.mysql.jdbc.Driver");
			Class.forName("org.mariadb.jdbc.Driver");
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
		if(error.contains( "Duplicate entry" )) {
			String errorArray[] = error.split("'");
			if(errorArray[3].equals("user")) {
				lastError ="El usuario "+errorArray[1]+" ya esta registrado";
			}
			if(errorArray[3].equals("email")) {
				lastError ="El email "+errorArray[1]+" ya esta registrado";
			}
			if(errorArray[3].equals("phone")) {
				lastError ="El numero "+errorArray[1]+" ya esta registrado";
			}
		}
		
		
	}
	
	public static String getLastError() {
		return lastError;
	}

}
