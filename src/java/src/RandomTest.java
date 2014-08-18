/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.util.Random;

/**
 *
 * @author nhyupa.2010
 */
public class RandomTest {
    public static void main(String []args) {
        /**Random random = new Random();
        
        int randomInt =  random.nextInt();
        for(int i = 0 ; i < 50; i++ ) {
            String firstInteger = Integer.toString(random.nextInt(10));
            String secondInteger = Integer.toString(random.nextInt(10));
            String thirdInteger = Integer.toString(random.nextInt(10));
            String fourthInteger = Integer.toString(random.nextInt(10));
            String fifthInteger = Integer.toString(random.nextInt(10));
            
            String FINInitial = "TWC2";
            String finalFINNumber = FINInitial + firstInteger + secondInteger + thirdInteger + fourthInteger +
                    fifthInteger;
            
            System.out.println(finalFINNumber);
            System.out.println(finalFINNumber.length());**/
        
        SendMailSSL sendmailSSL = new SendMailSSL();
        for(int i = 0; i < 20; i++){
            String password = sendmailSSL.generateEncryptedPassword();
            System.out.println(password);
        }
    }
}

