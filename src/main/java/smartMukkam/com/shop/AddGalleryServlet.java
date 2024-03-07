package smartMukkam.com.shop;

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
 * Servlet implementation class AddGalleryServlet
 */
@WebServlet("/AddGalleryServlet")
@MultipartConfig(maxFileSize = 16177215) // Set max file size for uploaded files
public class AddGalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGalleryServlet() {
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
        PreparedStatement preparedStatement = null;
        Integer sid = Integer.parseInt(request.getParameter("sid"));
        String description = request.getParameter("description");
        Part part = request.getPart("image");
        InputStream inputStream = part.getInputStream();
        System.out.println(sid);
        System.out.println(description);
        System.out.println(inputStream);

        try {
            // Insert data into the mGallery table
            String insertQuery = "INSERT INTO sGallery (sid, description, image) VALUES (?, ?, ?);";
            preparedStatement = connection.prepareStatement(insertQuery);
            
            preparedStatement.setInt(1, sid);
            preparedStatement.setString(2, description);
            preparedStatement.setBlob(3, inputStream);

            // Execute the insert statement
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("shopGallery.jsp?message=success");
            } else {
                response.sendRedirect("shopGallery.jsp?message=failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close JDBC objects
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

            // Close the InputStream
            if (inputStream != null) {
                inputStream.close();
            }
        }

	}

}
