/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author nhyupa.2010
 */
public class LoginControllerTest {
    public static void main(String[]args) {
        LoginController loginCtrl = new LoginController();
        String username = "nhyupa";
        String password ="123";
        
        boolean value = loginCtrl.checkAuthentication(username, password);
        System.out.println(value);
    }
}
