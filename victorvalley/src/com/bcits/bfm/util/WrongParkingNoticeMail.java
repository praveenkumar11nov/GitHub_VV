package com.bcits.bfm.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class WrongParkingNoticeMail implements Runnable {
	
	private final String toAddressEmail;
	private final String messageContent;
	private final String helpDeskMailId;
	private final String helpDeskMailPwd;	
	private final String mailSmtpHost;
	private final String mailSmtpSocketFactoryPort;
	private final String mailSmtpSocketFactoryClass;
	private final String mailSmtpAuth;
	private final String mailSmtpPort;
	
	public WrongParkingNoticeMail(EmailCredentialsDetailsBean emailCredentialsDetailsBean) {
		this.toAddressEmail=emailCredentialsDetailsBean.getToAddressEmail();
		this.messageContent=emailCredentialsDetailsBean.getMessageContent();
		this.helpDeskMailId=emailCredentialsDetailsBean.getMailId();
		this.helpDeskMailPwd=emailCredentialsDetailsBean.getMailIdPwd();
		this.mailSmtpHost=emailCredentialsDetailsBean.getMailSmtpHost();
		this.mailSmtpSocketFactoryPort=emailCredentialsDetailsBean.getMailSmtpSocketFactoryPort();
		this.mailSmtpSocketFactoryClass=emailCredentialsDetailsBean.getMailSmtpSocketFactoryClass();
		this.mailSmtpAuth=emailCredentialsDetailsBean.getMailSmtpAuth();
		this.mailSmtpPort=emailCredentialsDetailsBean.getMailSmtpPort();
	}
	
	@Override
	public void run()
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", mailSmtpHost);
		props.put("mail.smtp.socketFactory.port", mailSmtpSocketFactoryPort);
		props.put("mail.smtp.socketFactory.class",mailSmtpSocketFactoryClass);
		props.put("mail.smtp.auth", mailSmtpAuth);
		props.put("mail.smtp.port", mailSmtpPort);
	 
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(helpDeskMailId,helpDeskMailPwd);
				}
			});
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(helpDeskMailId));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(toAddressEmail));
			message.setSubject("Parking Notification");
			/*message.setText("Hi "+openNewTicketService.getPersons(newTicketEntity.getPersonId()).getFirstName()+",\n"+"\tYour ticket "+newTicketEntity.getTicketNumber()+" created on "+ new Timestamp(new java.util.Date().getTime()).toLocaleString()+" is in "+ openNewTicketService.getDepartements(newTicketEntity.getDept_Id()).getDept_Name()+" department.");*/
            
			message.setContent(messageContent,"text/html; charset=ISO-8859-1");				
			
			Transport.send(message); 
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
