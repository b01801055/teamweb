package member;

import java.io.Serializable;
import java.util.Properties;

public class SendMail implements Serializable{
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
		username="lab3300552@gmail.com";
		password="futureroad99";
		
		props = new Properties();
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.port", port);
	}
    
}
