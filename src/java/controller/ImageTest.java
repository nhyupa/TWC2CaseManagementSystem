/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author nhyupa.2010
 */
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import src.DBConnect;
import src.Worker;

public class ImageTest {
    
    public static void main(String[] args) {
        DBConnect.connectDB();
        ArrayList<Worker> results = DBConnect.retrieveWorkPassSearchResults("Work Permit");
        System.out.println(results.size());
        
    
    }
}
