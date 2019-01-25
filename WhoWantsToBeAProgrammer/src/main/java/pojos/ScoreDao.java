/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import static java.lang.Math.E;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import static pojos.DataConn.getConnection;

/**
 *
 * @author ntsep
 */
public class ScoreDao {
    private final Connection conn = getConnection();
    DateTimeFormatter prn = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
    LocalDateTime prnnow = LocalDateTime.now(); 
    
    public void setLog(int score,int user_id,int subject_id){
        try{
        
            PreparedStatement q = conn.prepareStatement("insert into scores (date,score,user_id,subject_id) VALUES (?,?,?,?)");
            q.setString(1, prn.format(prnnow));
            q.setInt(2, score);
            q.setInt(3,user_id);
            q.setInt(4, subject_id);
            System.out.println(score+" "+user_id+" "+subject_id);
            q.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public ArrayList getLogById(int id){
    ArrayList list = new ArrayList();
        try{
            PreparedStatement q = conn.prepareStatement("select date,score,name,username from scores\n" +
                                                        "inner join subjects on scores.subject_id = subjects.subject_id\n" +
                                                        "inner join users on scores.user_id = users.user_id\n" +
                                                        "where scores.user_id = ?;");
            q.setInt(1, id);
            ResultSet result = q.executeQuery();
            while(result.next()){
                Score s = new Score();
                s.setDate(result.getString(1));
                s.setScore(result.getInt(2));
                s.setSubject(result.getString(3));
                s.setUsername(result.getString(4));
                System.out.println(s.getSubject());
                list.add(s);
            }
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    
    
    public int getJavaScoreById(int id){
        int totalJavaScore = 0 ;
        try{
        
            PreparedStatement q = conn.prepareStatement("select sum(score) from scores where scores.user_id = ? and scores.subject_id = 1;");
            q.setInt(1, id);
            ResultSet result = q.executeQuery();
            while(result.next()){
                totalJavaScore = result.getInt(1);
            }
            return totalJavaScore;
        }catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
    
     public int getCsharpScoreById(int id){
        int totalJavaScore = 0 ;
        try{
        
            PreparedStatement q = conn.prepareStatement("select sum(score) from scores where scores.user_id = ? and scores.subject_id = 2;");
            q.setInt(1, id);
            ResultSet result = q.executeQuery();
            while(result.next()){
                totalJavaScore = result.getInt(1);
            }
            return totalJavaScore;
        }catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
     
     public int getJavascriptpScoreById(int id){
        int totalJavaScore = 0 ;
        try{
        
            PreparedStatement q = conn.prepareStatement("select sum(score) from scores where scores.user_id = ? and scores.subject_id = 3;");
            q.setInt(1, id);
            ResultSet result = q.executeQuery();
            while(result.next()){
                totalJavaScore = result.getInt(1);
            }
            return totalJavaScore;
        }catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
         public int getPythonScoreById(int id){
        int totalJavaScore = 0 ;
        try{
        
            PreparedStatement q = conn.prepareStatement("select sum(score) from scores where scores.user_id = ? and scores.subject_id = 4;");
            q.setInt(1, id);
            ResultSet result = q.executeQuery();
            while(result.next()){
                totalJavaScore = result.getInt(1);
            }
            return totalJavaScore;
        }catch(Exception e){
            System.out.println(e);
        }
        return 0;
    }
         
         
         public ArrayList top3(String subject){
             ArrayList list = new ArrayList();
             Connection getCon = getConnection();
             try{
                 System.out.println("inside top3 method");
                 PreparedStatement q = getCon.prepareStatement("SELECT username, sum(score) FROM dteam.scores\n" +
                                                                "INNER JOIN users ON scores.user_id = users.user_id\n" +
                                                                "INNER JOIN subjects ON scores.subject_id = subjects.subject_id\n" +
                                                                "WHERE name='"+subject+"'\n" +
                                                                "group by username\n" +
                                                                "order by sum(score) desc\n" +
                                                                "limit 3;");
             
                 ResultSet result = q.executeQuery();
                 while(result.next()){
                     Score score  = new Score();
                     score.setUsername(result.getString(1));
                     score.setScore(result.getInt(2));
                     list.add(score);
                     System.out.println(score.getUsername());
                 }
                 return list;
             }catch(SQLException e){
                 System.out.println(e);
             }
             return null;
         }
}
