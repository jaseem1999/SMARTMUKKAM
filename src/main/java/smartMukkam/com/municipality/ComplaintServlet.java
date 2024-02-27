package smartMukkam.com.municipality;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import smartMukkam.connection.Conn;

/**
 * Servlet implementation class ComplaintServlet
 */
@MultipartConfig(maxFileSize = 16177215)// Max file size up to 16MB
@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Conn con = new Conn();
            connection = con.connection;

            Integer uid = Integer.parseInt(request.getParameter("uid"));
            String officer = request.getParameter("officer");
            String complaint = request.getParameter("complaint");

            // Get the PDF file
            Part part = request.getPart("report");
            InputStream pdfInputStream = part.getInputStream();

            // Insert data into the database
            String insertQuery = "INSERT INTO complaint (uid, officer, compint, pdf, status) VALUES (?, ?, ?, ?, null)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setInt(1, uid);
            preparedStatement.setString(2, officer);
            preparedStatement.setString(3, complaint);
            preparedStatement.setBlob(4, pdfInputStream);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Successful insertion
                response.sendRedirect("userMunicipalityComplaint.jsp?message=success");
            } else {
                // Failed insertion
                response.sendRedirect("userMunicipalityComplaint.jsp?message=failed");
            }
        } catch (Exception e) {
            // Exception handling
            e.printStackTrace();
            response.sendRedirect("userMunicipalityComplaint.jsp?message=failed");
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
        
}


