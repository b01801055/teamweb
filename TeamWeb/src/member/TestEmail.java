package member;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class TestEmail {

	public static void main(String[] args) throws AddressException, MessagingException {
		String username="teamweb2021";
		String password="109java01";
		String from="teamweb2021@gmail.com";
		String to="109java01@gmail.com";
		String subject="主題是這個";
		String text="內文在這裡";
		//^^^參數
		//vvv建立Session物件
		Properties props = new Properties();
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.port",587);
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");//解決Exception
		Session session = Session.getInstance(props,new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		});
		//^^^建立Session物件
		
		//vvv設定郵件訊息
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		message.setSubject(subject);
		message.setSentDate(new Date());
		message.setText(text);
		//^^^設定郵件訊息
		
		//vvv寄出
		Transport.send(message);
		//^^^寄出
		
	}//main

}

