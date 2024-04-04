package smartMukkam.main.otp;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserPassForgetOTP {
	public static int sendToEmailOTP(String email, HttpServletRequest request, HttpServletResponse response, HttpSession sessn) {
        int done = 0;
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;

        // Check if email is not null or empty
        if (email != null && !email.equals("")) {
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = email;

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("jaseemklpt1999@gmail.com", "kooumcqibcqtaacd");
                }
            });

            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Smart Mukkam for forget Password");
                message.setText("your OTP is: " + otpvalue);
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                // Handle exception
                throw new RuntimeException(e);
            }

            dispatcher = request.getRequestDispatcher("userPasswordForgetOtP.jsp");
            request.setAttribute("message", "OTP is sent to your email id");
            HttpSession mySession = request.getSession();
            mySession.setAttribute("otpforVerificationUser", otpvalue);
            mySession.setAttribute("emailVerificationUser", email);

            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }

            done = 1;
        }

        return done;
    }
}
