package smartMukkam.com.municipality.login;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import smartMukkam.connection.Conn;

/**
 * Servlet implementation class MunicipalityLoginServlet
 */
@WebServlet("/MunicipalityLoginServlet")
public class MunicipalityLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MunicipalityLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Conn con = new Conn();
		HttpSession session = request.getSession();
		int status = 0;
		int mid = 1;
		Connection connection = con.connection;
		String email = (String) request.getParameter("email");
		String pass = (String) request.getParameter("pass");
		
		
		try {
			String sql = "SELECT * FROM municipalityLogin WHERE email=? AND password=?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, pass);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
				mid = rs.getInt(1);
				email = rs.getString(2);
				pass = rs.getString(3);
				status = 1;
			}
            
            if(status > 0) {
            	String update = "UPDATE municipalityLogin SET active = 'active' WHERE munId = 1;";
            	
            	try {
            		java.sql.Statement statement = connection.createStatement();
        	        int rowsAffected = statement.executeUpdate(update);
        	        statement.close();
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e);
				}
            	
            	session.setAttribute("mid", mid);
            	session.setAttribute("muncipalityEmail", email);
            
            	response.sendRedirect("municipality.jsp");
            }else {
            	response.sendRedirect("index.jsp?message=municipalityLoginFailed");
            }
            
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		
	}

}
