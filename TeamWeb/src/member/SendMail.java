package member;

import java.io.Serializable;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String host;
	private int port;
    private String username;
    private String password;
    private Properties props;
    private String from;
    private String to;
    private String subject;
    private String content;
    
    public SendMail() {
		host="smtp.gmail.com";
		port=587;
		username="teamweb2021@gmail.com";
		password="109java01";
		
		props = new Properties();
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.port", port);
	}
     
    public void execute() {
    	try {
            Message message = createMessage(from, to, subject, content);
            Transport.send(message);  
            System.out.println("郵件傳送成功");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    
    private Message createMessage(
            String from, String to, String subject, String content)
                              throws MessagingException {
        Session session = Session.getInstance(props, new Authenticator() {  
            protected PasswordAuthentication getPasswordAuthentication() {  
                return new PasswordAuthentication(username, password);  
            }} 
        );  
        
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        message.setSentDate(new Date());
        message.setText(content);
        
        return message;
    }
    
}
