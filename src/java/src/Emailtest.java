/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Emailtest {
    public static void main (String [] args) {
        SendMailSSL ssl = new SendMailSSL();
        String password = ssl.generateEncryptedPassword();
        String recipientName = "nhyupa.2010@sis.smu.edu.sg";
       
        DBConnect.connectDB();
        String emailAddress = DBConnect.retrieveEmailAddress("nhyupa.2010");
        ssl.sendMail(emailAddress, password);
    }
}
