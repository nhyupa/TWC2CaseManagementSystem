/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

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

import javax.imageio.ImageIO;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.imageio.ImageIO;

public class ImageTest {
    
    public static void main(String[] args) {
        
        ByteArrayOutputStream baos = null;
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        FileOutputStream fileOuputStream = null;
        
        try {
            
            BufferedImage originalImage = ImageIO.read(new File(
                    "resources/index.jpg"));
            
            baos = new ByteArrayOutputStream();
            ImageIO.write(originalImage, "jpg", baos);
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            
            connection = getDatabaseConnection();
            String insertImageSql = "INSERT INTO "
                    + "imagetable(image_data, image_name)"
                    + " VALUES(?,?)";
            preparedStatement = connection.prepareStatement(insertImageSql);
            preparedStatement.setBytes(1, imageInByte);
            preparedStatement.setString(2, "Java Honk");
            
            preparedStatement.executeUpdate();
            
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM imagetable");
            
            System.out.println("Image sucessfully inserted to the table");
            
            String imageName = "";
            byte[] image = null;
            int id = 0;
            
            while (resultSet.next()) {
                id = resultSet.getInt(1);
                image = resultSet.getBytes(2);
                imageName = resultSet.getString(3);
                
            }
            
            // convert array of bytes into modified file again
            fileOuputStream = new FileOutputStream(
                    "resources/index_copy.png");
            fileOuputStream.write(image);
            
            System.out
                    .println("\nImage successully retrieved "
                    + "from database. Id of image:"
                    + id + " Image name: " + imageName);
        
        } catch (Exception e) {
            System.out.println("Failed to make connection!" + e);
        } finally {
            
            try {
                if (baos != null) {
                    baos.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
                if (fileOuputStream != null) {
                    fileOuputStream.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    
    }
    
    // Static method to get connection object
    public static Connection getDatabaseConnection() {
        
        Connection connection = null;
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/twc2db",
                    "root", "password");
        } catch (Exception e) {
            System.out.println("Failed to make connection!" + e);
        }
        return connection;
    }
}