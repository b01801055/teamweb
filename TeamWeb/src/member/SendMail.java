package member;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

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
    private String msg;
    

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
    
    public SendMail() {
		host="smtp.gmail.com";
		port=587;
		username="teamweb2021@gmail.com";
		password="109java01";
		from=username;
		
		props = new Properties();
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.port", port);
	}
     
    public void execute() throws UnsupportedEncodingException {
    	try {
            Message message = createMessage(from, to, subject, content);
            Transport.send(message);  
            System.out.println("郵件傳送成功");
            msg="3";
        } catch (MessagingException e) {
        	msg="2";
            throw new RuntimeException(e);
        }
    }
    public String getMsg() {
		return msg;
	}
    private Message createMessage(
            String from, String to, String subject, String content)
                              throws MessagingException, UnsupportedEncodingException {
        Session session = Session.getInstance(props, new Authenticator() {  
            protected PasswordAuthentication getPasswordAuthentication() {  
                return new PasswordAuthentication(username, password);  
            }} 
        );  
        
        Multipart multiPart = multiPart(content);
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        message.setSentDate(new Date());
        message.setContent(multiPart);
        
        return message;
    }
    private Multipart multiPart(String content)
            throws MessagingException, UnsupportedEncodingException {
        Multipart multiPart = new MimeMultipart();
        
        MimeBodyPart htmlPart = new MimeBodyPart(); 
        htmlPart.setContent(content, "text/html;charset=UTF-8");
        multiPart.addBodyPart(htmlPart);
        
        
        return multiPart;
    }
}
