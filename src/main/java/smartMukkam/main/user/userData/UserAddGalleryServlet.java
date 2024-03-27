package smartMukkam.main.user.userData;

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


@WebServlet("/UserAddGalleryServlet")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class UserAddGalleryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserAddGalleryServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        String description = request.getParameter("description");
        InputStream imageInputStream = null;
        Part filePart = request.getPart("image");

        if (filePart != null) {
            imageInputStream = filePart.getInputStream();
        }

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        smartMukkam.connection.Conn con = new smartMukkam.connection.Conn(); 

        try {
            connection = con.connection;
            String sql = "INSERT INTO uGallery (uid, description, image) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, uid);
            preparedStatement.setString(2, description);
            if (imageInputStream != null) {
                preparedStatement.setBlob(3, imageInputStream);
            }

            int i= preparedStatement.executeUpdate();
            if (i>0) {
            	response.sendRedirect("userAddGallery.jsp?message=success"); 
			} else {
				response.sendRedirect("userAddGallery.jsp?message=failed");
			}
            // Redirect to gallery page after successful insertion
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
