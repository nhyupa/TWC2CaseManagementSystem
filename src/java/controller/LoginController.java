/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author nhyupa.2010
 */

import java.util.*;
import src.DBConnect;
import src.User;

public class LoginController {
    private ArrayList<String> usernames = new ArrayList<String>();
    private ArrayList<String> passwords = new ArrayList<String>();
    private ArrayList<User> users = new ArrayList<User>();
    private String position = null;
    
    public boolean checkUsername(String username) {
        DBConnect dbConnect = new DBConnect();
        dbConnect.connectDB();
        usernames = dbConnect.getUsernames();
        boolean checkUsername = false;
        for(int i =0 ; i<usernames.size(); i++) {
            String existingUsername = usernames.get(i);
            if(username.equalsIgnoreCase(existingUsername)) {
                checkUsername = true;
                return checkUsername;
            }
        }
        return checkUsername;
    }
    
    public boolean checkAuthentication(String username,String password) {
        DBConnect dbConnect = new DBConnect();
        dbConnect.connectDB();
        usernames = dbConnect.getUsernames();
        
        for(int i =0; i <usernames.size();i++) {
            String existingUsername = usernames.get(i);
            if(existingUsername.equalsIgnoreCase(username)){
                passwords = dbConnect.getPasswords();
                for(int j=0; j<passwords.size();j++){
                    String existingPassword = passwords.get(j);
                    if(existingPassword.equalsIgnoreCase(password)){
                        return true;
                    }
                }
            }
        }
        return false;
    }
    
    public String getPosition(String username) {
        DBConnect dbConnect = new DBConnect();
        DBConnect.connectDB();
        String position = null;
        users = dbConnect.getUsers();
        
        for(int i = 0 ; i < users.size(); i++) {
            User user = users.get(i);
            String existingUsername = user.getUsername();
            if(existingUsername.equalsIgnoreCase(username)){
                position = user.getJobTitle();
                return position;
            }
        }
        
        return null;
    }
    
   
}
