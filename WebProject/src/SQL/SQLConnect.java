package SQL;
import java.sql.*;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class SQLConnect {

	private Connection con;
	private Statement stmt;
	
	public SQLConnect(){
		
		try{
			String driverName = "org.gjt.mm.mysql.Driver"; 
			String dbURL = "jdbc:mysql://localhost:3305/testdb";
			Class.forName(driverName); 
			this.con = (Connection) DriverManager.getConnection(dbURL, "root", "565898"); 
			this.stmt = (Statement) con.createStatement();
			
			
		}
		catch(Exception e){
			System.out.println("DB에러");
			e.printStackTrace();
		}
		
	
		
	}
	public void ConnectionClose() {
		try {
			this.con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet ExecuteQuery(String SQL)
	{
		try {
			return stmt.executeQuery(SQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean Execute(String SQL)
	{
		try {
			stmt.execute(SQL);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
}
