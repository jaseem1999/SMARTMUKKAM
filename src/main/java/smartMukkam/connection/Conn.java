package smartMukkam.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conn {
	public Connection connection;
	public Conn() {
		try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartMukkam", "root", "Love1999@MySQL");
	    } catch (Exception e) {
	        e.printStackTrace(); // Handle the exception appropriately in a real application
	    }
	}
}
