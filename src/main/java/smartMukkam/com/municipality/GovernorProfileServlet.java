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

@WebServlet("/GovernorProfileServlet")
@MultipartConfig(maxFileSize = 16177215)
public class GovernorProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Conn con = new Conn();
        Connection connection = con.connection;
        String ward = request.getParameter("ward");
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String message = request.getParameter("message");
        String party = request.getParameter("party");

        Part part = request.getPart("image");
        InputStream inputStream = part.getInputStream();

        

        // JDBC variables
        PreparedStatement preparedStatement = null;

        try {
            // Update the record based on 'ward'
            String updateQuery = "UPDATE governorMunicipality SET name=?, position=?, message=?, party=?, image=? WHERE ward=?";
            preparedStatement = connection.prepareStatement(updateQuery);

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, position);
            preparedStatement.setString(3, message);
            preparedStatement.setString(4, party);
            preparedStatement.setBlob(5, inputStream);
            preparedStatement.setString(6, ward);

            // Execute the update statement
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("municipalityProfile.jsp?message=success");
            } else {
                response.sendRedirect("municipalityProfile.jsp?message=failed");
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

            // Close the InputStream and delete the Part
            if (inputStream != null) {
                inputStream.close();
            }
            if (part != null) {
                part.delete();
            }
        }
    }
}
