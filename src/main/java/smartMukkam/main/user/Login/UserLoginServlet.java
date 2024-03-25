package smartMukkam.main.user.Login;

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
import smartMukkam.main.user.userData.UserDAO;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
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
		Conn conn = new Conn();
		
		HttpSession session = request.getSession();
		Connection con=conn.connection;
		String email = request.getParameter("email");

        String password = request.getParameter("pass");
        
        
        
        int status = 0;
        int uid = 0;
        String name = null;
        String pass = null;
        String emailName = null;
        long phone = 0;
        String country = null;
        
        try {
        	String sql = "SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
				uid = rs.getInt(1);
				name = rs.getString(2);
				emailName = rs.getString(3);
				pass = rs.getString(4);
				phone = rs.getLong(5);
				country = rs.getString(6);
				if(UserDAO.getUserStatus(emailName) == null) {
					status = 1;
				}else {
					status = 2;
				}
				
			}
            
            if(status == 1) {
            	int i =UserDAO.loginActive(uid);
            	session.setAttribute("uid", uid);
            	session.setAttribute("name", name);
            	session.setAttribute("email", emailName);
            	session.setAttribute("phone", phone);
            	session.setAttribute("country", country);
            	response.sendRedirect("index.jsp");
            }else if(status < 1) {
            	response.sendRedirect("index.jsp?message=useLoginFailed");
            }else {
            	response.sendRedirect("index.jsp?message=useLoginBlocked");
            }
            
            

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
	}

}
