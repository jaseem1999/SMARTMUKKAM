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

@WebServlet("/MunicipalityGalleryServlet")
@MultipartConfig(maxFileSize = 16177215) // Set max file size for uploaded files
public class MunicipalityGalleryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Conn con = new Conn();
        Connection connection = con.connection;
        PreparedStatement preparedStatement = null;

        String description = request.getParameter("description");
        Part part = request.getPart("image");
        InputStream inputStream = part.getInputStream();

        try {
            // Insert data into the mGallery table
            String insertQuery = "INSERT INTO mGallery (description, image) VALUES (?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);

            preparedStatement.setString(1, description);
            preparedStatement.setBlob(2, inputStream);

            // Execute the insert statement
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("municipalityGallery.jsp?message=success");
            } else {
                response.sendRedirect("municipalityGallery.jsp?message=failed");
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

