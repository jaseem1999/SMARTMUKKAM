package smartMukkam.com.municipality;

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
 * Servlet implementation class MunicipalityProfileServlet
 */
@WebServlet("/AddMunicipalityProfileServlet")
@MultipartConfig(maxFileSize = 16177215)
public class MunicipalityProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MunicipalityProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String history = (String) request.getParameter("history");
		String secretary = (String) request.getParameter("secretary");
		String chairman = (String) request.getParameter("president");
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
        	Conn con = new Conn();
            connection = con.connection;
            Part part = request.getPart("image");
            InputStream inputStream = part.getInputStream();
            String updateQuery = "UPDATE municipalityProfile SET chairman = ?, secretary = ?, history = ?, image = ?, status = ? WHERE tid = ?"; // Assuming tid is the primary key column
            preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, chairman);
            preparedStatement.setString(2, secretary);
            preparedStatement.setString(3, history);
            preparedStatement.setBlob(4, inputStream);
            preparedStatement.setString(5, null);
            preparedStatement.setInt(6, 1); // Replace yourTidValue with the actual value of the primary key for the record you want to update


            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Successful insertion
                response.sendRedirect("municipalityProfile.jsp?message=Msuccess");
            } else {
                // Failed insertion
            	response.sendRedirect("municipalityProfile.jsp?message=Mfailed");
            }
            
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

}
