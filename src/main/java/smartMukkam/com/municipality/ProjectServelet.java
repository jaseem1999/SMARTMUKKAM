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


@MultipartConfig
@WebServlet("/ProjectServelet")
public class ProjectServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectServelet() {
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
		Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Conn con = new Conn();
            connection = con.connection;

            Integer uid = Integer.parseInt(request.getParameter("uid"));
            String project = request.getParameter("project");
            String idea = request.getParameter("idea");
            
            // Get the PDF file
            Part part = request.getPart("report");
            InputStream pdfInputStream = part.getInputStream();

            // Insert data into the database
            String insertQuery = "INSERT INTO projects (uid, project, idea, pdf, status) VALUES (?, ?, ?, ?, null)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setInt(1, uid);
            preparedStatement.setString(2, project);
            preparedStatement.setString(3, idea);
            preparedStatement.setBlob(4, pdfInputStream);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Successful insertion
                response.sendRedirect("userMunicipalityProject.jsp?message=submissionSuccess");
            } else {
                // Failed insertion
                response.sendRedirect("userMunicipalityProject.jsp?message=submissionFailed");
            }
        } catch (Exception e) {
            // Exception handling
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
		
		
		
		
	}

}
