/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pogos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import static pogos.DataConn.closeConnection;
import static pogos.DataConn.getConnection;

/**
 *
 * @author theod
 */
public class Userdao {
    public void connection(){
      Connection conn = getConnection();
      try{
          PreparedStatement q = conn.prepareStatement("SELECT * FROM USER WHERE AGE=?");
          q.setInt(0, 0);
          q.executeQuery();
      }catch(Exception e){
          System.out.println(e);
      }finally{
          closeConnection();
      }
    }
}

