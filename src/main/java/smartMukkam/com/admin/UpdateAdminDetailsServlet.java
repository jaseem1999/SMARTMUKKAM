package smartMukkam.com.admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import smartMukkam.connection.Conn;

/**
 * Servlet implementation class UpdateAdminDetailsServlet
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/UpdateAdminDetailsServlet")
public class UpdateAdminDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Conn con = new Conn();
		Connection connection = con.connection;
		String name = request.getParameter("name");
	    String staff = request.getParameter("staff");
	    Part imagePart = request.getPart("image");

        InputStream imageInputStream = imagePart.getInputStream();
        
        try {
        	 String sql = "UPDATE adminDetails SET name=?, staff=?, image=? WHERE adminId=1";
             PreparedStatement statement = connection.prepareStatement(sql);
             statement.setString(1, name);
             statement.setString(2, staff);
             statement.setBlob(3, imageInputStream);

             // Execute SQL statement
             int rowsUpdated = statement.executeUpdate();

             // Close database connection
             connection.close();

             // Redirect to success page if update is successful
             if (rowsUpdated > 0) {
                 response.sendRedirect("adminHome.jsp?message=profileUploadSuccess");
             } else {
            	 response.sendRedirect("adminHome.jsp?message=profileUploadFailed");
             }
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (imageInputStream != null) {
            	imageInputStream.close();
            }
        }

        

	}

}
