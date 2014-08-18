/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */

import java.math.BigInteger;
import java.security.SecureRandom;
public class Base32EncryptedPassword {
    
    private SecureRandom random = new SecureRandom();
    
    public String retrieveRandomPassword() {
        return new BigInteger(100, random).toString(32);
    }

}
