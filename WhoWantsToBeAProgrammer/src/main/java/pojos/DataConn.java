/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author theod
 */
public class DataConn {
    private static Connection conn = null;
    
    public static Connection getConnection(){
       if (conn != null) {
           return conn;
       }
       else {
            try{

                String Driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://ra1.anystream.eu:1011/dteam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
                String username = "dteam";
                String password = "dteam";

                Class.forName(Driver);
                conn = DriverManager.getConnection(url, username, password);
                //System.out.println("paokara dynata");
                Statement st = conn.createStatement();
                st.executeUpdate("SET NAMES 'utf8'");
                st.executeUpdate("SET CHARACTER SET 'utf8'");
                System.out.println("connected");
                System.out.println("inside connection");
                return conn;
            }catch(ClassNotFoundException | SQLException e){
                System.out.println("COULD NOT CONNECT");
                System.out.println(e);
            }
            return null;
       }
    }
    public static void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("CONNECTION CLOSED");
            } catch (SQLException ex) {
                System.out.println("Connection Close Error");
            }
            finally {
                conn = null;
            }
        }
    }
    public static boolean executeSQLUpdate(String sqlCommand) {
        Connection conn = DataConn.getConnection();
        if (conn == null) {
            System.out.println("No cdb connection");
            return false;
        }
        try {
            Statement st = conn.createStatement();
            int result = st.executeUpdate(sqlCommand);
            
            conn.close();
            return result > 0;
        }
        catch (SQLException ex) 
        {
            System.out.println(ex.getMessage());
            return false;
        }
    }
    
    public static ResultSet executeSQLQuery(String sqlCommand) throws SQLException {
        Connection conn = DataConn.getConnection();
        if (conn == null) {
            System.out.println("No cdb connection");
            return null;
        }
        Statement st = conn.createStatement();
        return st.executeQuery(sqlCommand);
    }
    
}



