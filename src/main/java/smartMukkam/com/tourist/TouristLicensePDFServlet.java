package smartMukkam.com.tourist;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TouristLicensePDFServlet
 */
@WebServlet("/TouristLicensePDFServlet")
public class TouristLicensePDFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TouristLicensePDFServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartMukkam", "root", "Love1999@MySQL");

	            String sql = "SELECT License FROM tourist WHERE touristId = ?";
	            PreparedStatement statement = con.prepareStatement(sql);
	            statement.setInt(1, Integer.parseInt(request.getParameter("id"))); // Assuming you pass the project ID as a parameter
	            ResultSet rs = statement.executeQuery();

	            if (rs.next()) {
	                java.sql.Blob blob = rs.getBlob("License");
	                byte[] pdfBytes = blob.getBytes(1, (int) blob.length());

	                response.setContentType("application/pdf");
	                response.setHeader("Content-Disposition", "inline; filename=project.pdf");

	                OutputStream os = response.getOutputStream();
	                os.write(pdfBytes);
	                os.flush();
	                os.close();
	            }

	            rs.close();
	            statement.close();
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("Error: " + e);
	            // Handle the exception or provide an appropriate response
	        };
	}

}
