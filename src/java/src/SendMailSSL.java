/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailSSL {
     
    
    public void sendMail(String recipientName, String emailAddress, String FIN, String value) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.starttls.enable","true");
        
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("yupanyeinhtoon@gmail.com","south05621880545581");
                    }
                });
        
        try {
            
           String generatedPassword = generateEncryptedPassword(); 
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@no-spam.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(emailAddress));
            message.setSubject("TWC2: CAMANS- Account Locked notification");
            message.setText("Dear " + recipientName + "(" + FIN + ")" +
                    ",\n\n Your account has been locked by the administrator due to inactivity."
                    + "\n\n Please contact your administrator for further information."
                    + "\n\n This is a System generated email, please do not reply.");
            
            Transport.send(message);
            
            System.out.println("Done");
            
        } catch (MessagingException err) {
            System.out.println("Error : " + err);
        }
    }
    
    public void sendMail(String recipientName, String emailAddress, String FIN) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.starttls.enable","true");
        
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("yupanyeinhtoon@gmail.com","south05621880545581");
                    }
                });
        
        try {
            
           String generatedPassword = generateEncryptedPassword(); 
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@no-spam.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(emailAddress));
            message.setSubject("TWC2: CAMANS- Account Locked notification");
            message.setText("Dear " + recipientName + "(" + FIN + ")" +
                    ",\n\n Your account has been locked by the administrator due to inactivity."
                    + "\n\n Please contact your administrator for further information."
                    + "\n\n This is a System generated email, please do not reply.");
            
            Transport.send(message);
            
            System.out.println("Done");
            
        } catch (MessagingException err) {
            System.out.println("Error : " + err);
        }
    }
    public void sendMail(String recipientName) {
        
        
        DBConnect.connectDB();
        
        String emailAddress = DBConnect.retrieveEmailAddress(recipientName);
        
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.starttls.enable","true");
        
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("yupanyeinhtoon@gmail.com","south05621880545581");
                    }
                });
        
        try {
            
           String generatedPassword = generateEncryptedPassword(); 
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@no-spam.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(emailAddress));
            message.setSubject("TWC2: CAMANS- New User Password notification");
            message.setText("Dear " + recipientName +
                    ",\n\n Your System generated password is " + generatedPassword
                    + ".\n\n Please change your password upon first log in.\n\n This is a System generated email, please do not reply.");
            
            Transport.send(message);
            
            System.out.println("Done");
            
        } catch (MessagingException err) {
            System.out.println("Error : " + err);
        }
        
    }
    public void sendMail(String recipientName, String newPassword) {
        

        
        DBConnect.connectDB();
        
        String emailAddress = DBConnect.retrieveEmailAddress(recipientName);
        
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.starttls.enable","true");
        
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("yupanyeinhtoon@gmail.com","south05621880545581");
                    }
                });
        
        try {
            
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@no-spam.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(emailAddress));
            message.setSubject("TWC2: CAMANS- New User Account Notification");
            message.setText("Dear " + recipientName +
                    ",\n\n Your account with CAMANS has been created. \n\n Your System generated password is " + newPassword  
                    + ".\n\n Please change your password upon first log in.\n\n This is a System generated email, please do not reply.");
            
            Transport.send(message);
            
            System.out.println("Done");
            
        } catch (MessagingException err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    public void forgetPasswordSendMail(String recipientName, String newPassword) {
        

        
        DBConnect.connectDB();
        
        String emailAddress = DBConnect.retrieveEmailAddress(recipientName);
        
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.starttls.enable","true");
        
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("yupanyeinhtoon@gmail.com","south05621880545581");
                    }
                });
        
        try {
            
           
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@no-spam.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(emailAddress));
            message.setSubject("TWC2: CAMANS- New Password Notification");
            message.setText("Dear " + recipientName +
                    ",\n\n Your password has been changed. \n\n Your System generated password is " + newPassword  
                    + ".\n\n Please change your password upon first log in.\n\n"
                    + "In the event you did not submit a request to change your password, please contact the System"
                    + " Administrator immediately. \n\nThis is a System generated email, please do not reply.");
            
            Transport.send(message);
            
            System.out.println("Done");
            
        } catch (MessagingException err) {
            System.out.println("Error : " + err);
        }
    }
    
    public String generateEncryptedPassword() {
        Base32EncryptedPassword randomPassword = new Base32EncryptedPassword();
        String encryptedPassword = randomPassword.retrieveRandomPassword();
        
        return encryptedPassword;
    }
}


