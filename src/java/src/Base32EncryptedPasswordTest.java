/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Base32EncryptedPasswordTest {
    public static void main(String [] args) {
        Base32EncryptedPassword encryptedPassword = new Base32EncryptedPassword();
        String password = encryptedPassword.retrieveRandomPassword();
        System.out.println(password);
    }  
  
}
