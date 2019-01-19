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
            PreparedStatement q = conn.prepareStatement("SELECT * FROM users WHERE USERNAME='"+username+"' AND PASSWORD='"+password+"'");
//            q.setString(1, username);
//            q.setString(2, password);
            ResultSet result = q.executeQuery();
            while(result.next()){
                user.setId(result.getInt(1));
                user.setUsername(result.getString(2));
                user.setPassword(result.getString(3));
                user.setFname(result.getString(4));
                user.setLname(result.getString(5));
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
    
    
}

