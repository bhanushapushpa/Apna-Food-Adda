package mail;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailSender {

	public static void sendVerificationEmail(String toEmail, String verificationCode) throws MessagingException {

        String fromEmail = "studyjava1010@gmail.com"; // Replace with your email
        String host = "smtp.gmail.com"; // Replace with your SMTP server
        String password = "xslw wjbp wbvi fbio";

        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password); // Replace with your email and password
            }
        });

        MimeMessage message = new MimeMessage(session);

        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        message.setSubject("Email Verification");

        String emailContent = "Your verification code is: " + verificationCode;
        message.setText(emailContent);

        Transport.send(message);
    }


}
