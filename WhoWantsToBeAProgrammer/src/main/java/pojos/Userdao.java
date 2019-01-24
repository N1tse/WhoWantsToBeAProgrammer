/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import org.springframework.web.multipart.MultipartFile;
import static pojos.DataConn.closeConnection;
import static pojos.DataConn.getConnection;

/**
 *
 * @author theod
 */
public class Userdao {
    
    
    public User login(String username,String password){
        Connection conn = getConnection();
        User user = new User();
        try{
            PreparedStatement q = conn.prepareStatement("SELECT * FROM users WHERE USERNAME=? AND PASSWORD=?");
            q.setString(1, username);
            q.setString(2, password);
            ResultSet result = q.executeQuery();
            while(result.next()){
                user.setId(result.getInt(1));
                user.setUsername(result.getString(2).toUpperCase());
                user.setPassword(result.getString(3));
                user.setFname(result.getString(4).toUpperCase());
                user.setLname(result.getString(5).toUpperCase());
                user.setRole_id(result.getInt(6));
                byte[] b = result.getBlob(7).getBytes(1, (int) result.getBlob(7).length());
                user.setImage(stringFromBlob(b));
                return user;
            }
        }catch(SQLException e){
            System.out.println(e);
        }finally{
            closeConnection();
        }
        return null;
    }
    
 public User loginAdmin(String username,String password){
        Connection conn = getConnection();
        User user = new User();
       int role = 2;
        try{
            PreparedStatement q = conn.prepareStatement("SELECT * FROM users WHERE USERNAME=? AND PASSWORD=? AND ROLE_ID=?");
            q.setString(1, username);
            q.setString(2, password);
            q.setInt(3, role);
//            q.setInt(3, role);
            ResultSet result = q.executeQuery();
            while(result.next()){
                user.setId(result.getInt(1));
                user.setUsername(result.getString(2).toUpperCase());
                user.setPassword(result.getString(3));
                user.setFname(result.getString(4).toUpperCase());
                user.setLname(result.getString(5).toUpperCase());
                user.setRole_id(result.getInt(6));
                return user;
            }
        }catch(SQLException e){
            System.out.println(e);
        }finally{
            closeConnection();
        }
        return null;
    }
    
    public User Register (String username,String password,String fname,String lname,MultipartFile image)throws IOException{
          Connection con=getConnection(); 
        int role=1;
	try{          
		PreparedStatement ps=con.prepareStatement("INSERT INTO users(username,password,fname,lname,role_id,image) VALUES(?,?,?,?,?,?)");
		ps.setString(1,username);
		ps.setString(2,password);
		ps.setString(3,fname);
		ps.setString(4,lname);
		ps.setInt(5,role);
                ps.setBlob(6, getBlobInputStream(image));
		ps.executeUpdate();
	}catch(SQLException e){
            System.out.println(e);  
        }
        
        finally{
            closeConnection();
        }
	
        return null;
  }
    
      public InputStream getBlobInputStream(MultipartFile filePart) {
        InputStream inputStream = null; // input stream of the upload file
        try {
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                inputStream = filePart.getInputStream();
            }
        } catch (IOException e) {
            System.out.println("Error!");
        }
        
        return inputStream;
    }
      
      public String stringFromBlob(byte[] byteArray) {
        String base64Image = null;
        
        if(byteArray!=null)
            base64Image = Base64.getEncoder().encodeToString(byteArray);
        return base64Image;
    }
    
    
    
}

