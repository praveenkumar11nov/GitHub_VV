package com.bcits.bfm.util;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SendMailConsolidatedBill implements Runnable {
	
	static Logger logger = LoggerFactory.getLogger(SendMailConsolidatedBill.class);
	private final String toAddressEmail;
	private final String messageContent;
	private final String mailId;
	private final String mailIdPwd;	
	private final String mailSmtpHost;
	private final String mailSmtpSocketFactoryPort;
	private final String mailSmtpSocketFactoryClass;
	private final String mailSmtpAuth;
	private final String mailSmtpPort;
	private final InternetAddress fromAddress;
	private final String mailImapHost;
	private final String mailImapPort;
	private final String mailImapProtocol;
	
	public SendMailConsolidatedBill(EmailCredentialsDetailsBean emailCredentialsDetailsBean) {
		this.toAddressEmail=emailCredentialsDetailsBean.getToAddressEmail();
		this.messageContent=emailCredentialsDetailsBean.getMessageContent();
		this.mailId=emailCredentialsDetailsBean.getMailId();
		this.mailIdPwd=emailCredentialsDetailsBean.getMailIdPwd();
		this.mailSmtpHost=emailCredentialsDetailsBean.getMailSmtpHost();
		this.mailSmtpSocketFactoryPort=emailCredentialsDetailsBean.getMailSmtpSocketFactoryPort();
		this.mailSmtpSocketFactoryClass=emailCredentialsDetailsBean.getMailSmtpSocketFactoryClass();
		this.mailSmtpAuth=emailCredentialsDetailsBean.getMailSmtpAuth();
		this.mailSmtpPort=emailCredentialsDetailsBean.getMailSmtpPort();
		this.fromAddress=emailCredentialsDetailsBean.getFromAddress();
		this.mailImapHost=emailCredentialsDetailsBean.getMailImapHost();
		this.mailImapPort=emailCredentialsDetailsBean.getMailImapPort();
		this.mailImapProtocol=emailCredentialsDetailsBean.getMailImapProtocol();
	}

	@Override
	public void run() {
		Properties props = new Properties();
		props.put("mail.smtp.host", mailSmtpHost);
		props.put("mail.smtp.socketFactory.port", mailSmtpSocketFactoryPort);
		props.put("mail.smtp.socketFactory.class", mailSmtpSocketFactoryClass);
		props.put("mail.smtp.auth", mailSmtpAuth);
		props.put("mail.smtp.port", mailSmtpPort);
		props.put("mail.imap.host", mailImapHost);
		props.put("mail.imap.port", mailImapPort);
		props.put("mail.store.protocol", mailImapProtocol);
		Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(mailId, mailIdPwd);
			}
		});	
		
		try{
			int imapPort=Integer.parseInt(mailImapPort);
			Message message = new MimeMessage(session);
			message.setFrom(fromAddress);		
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(toAddressEmail));
			message.setSubject("IREO : Bill");
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setText(messageContent);
			// message.setContent("<h1>BILL</h1>", "text/html; charset=utf-8");
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			messageBodyPart = new MimeBodyPart();
			//String filename = "D://Bills/pdf/consolidatedBill.pdf";
			String filename = "D://Bills/pdf/consolidatedBill.pdf";
			DataSource source = new FileDataSource(filename);
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName("Consolidated Bill.pdf");
			multipart.addBodyPart(messageBodyPart);
			message.setContent(multipart);
			Transport.send(message);
			
			Store store = session.getStore(mailImapProtocol);
			logger.info("store is opening");
			logger.info("*************Imap Host*******"+mailImapHost);
			logger.info("***********Imap Port*********"+mailImapPort);
			logger.info("************MailId**********"+mailId);
			logger.info("************MailPwd**********"+mailIdPwd);
			store.connect(mailImapHost.trim(),imapPort,mailId.trim(), mailIdPwd.trim());
			logger.info("connected");
			Message [] messages = new Message[1];
			messages[0] = message;
			Folder folder = store.getFolder("Sent Items");
			/*Folder[] f=store.getDefaultFolder().list();
			for (Folder folder : f) {
				logger.info("**************** Folder Names***************"+folder.getName());
			}*/
			folder.open(Folder.READ_WRITE);
			logger.info("open the Folder");
			folder.appendMessages(messages);
			logger.info("message sent to Sent Items Folder");
			folder.close(false);
			store.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
