/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    public User Register (User u){
          Connection con=getConnection(); 
	// User u = new User();
        int role=1;
	try{
		          
		PreparedStatement ps=con.prepareStatement("INSERT INTO users(username,password,fname,lname,role_id) VALUES(?,?,?,?,?)");
             
		ps.setString(1,u.getUsername());
		ps.setString(2,u.getPassword());
		ps.setString(3,u.getFname());
		ps.setString(4,u.getLname());
		ps.setInt(5,role);
		ps.executeUpdate();
	}catch(Exception e){System.out.println(e);
        
        }
        
        finally{
            closeConnection();
        }
	
        return null;
  }
    
    
    
}

