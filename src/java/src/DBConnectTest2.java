/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.awt.BorderLayout;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import javax.swing.ImageIcon;
import java.util.regex.*;
import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JLabel;
/**
 *
 * @author nhyupa.2010
 */
public class DBConnectTest2 {
    public static void main (String [] args) {
        DBConnect dbConnect = new DBConnect();
        DBConnect.connectDB();
        
       DBConnect.insertNewPassportNum(null, null, "T5662041Z", "0000-00-00", "0000-00-00");
    }
}
