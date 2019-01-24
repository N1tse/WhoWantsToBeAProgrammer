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
import java.util.ArrayList;
import static pojos.DataConn.closeConnection;
import static pojos.DataConn.getConnection;

/**
 *
 * @author ntsep
 */
public class QuestionDao {
    private final Connection conn = getConnection();
    
    public ArrayList<Questions> getQuestion(String subject){
        ArrayList questions = new ArrayList();
        try{
            System.out.println(subject);
            PreparedStatement q = conn.prepareStatement("select * from questions inner join subjects on questions.subject_id = subjects.subject_id where name = '"+subject+"' order by rand() limit 10;");
            ResultSet result = q.executeQuery();
            while(result.next()){
                Questions a = new Questions();
                a.setId(result.getInt(1));
                a.setQuestion(result.getString(2));
                a.setA(result.getString(3));
                a.setB(result.getString(4));
                a.setC(result.getString(5));
                a.setD(result.getString(6));
                a.setCorrect(result.getString(7));
                a.setSubject(result.getString(10));
                questions.add(a);
            }
            System.out.println(questions.size());
            return questions;
        }catch(SQLException e){
            System.out.println(e);
        }finally{
            closeConnection();
        }
        return null;
    }
    
    
    public boolean checkQuestion(String answer,int id){
        boolean flag;
        String answered = null;
        Questions question = new Questions();
        try{
            PreparedStatement q = conn.prepareStatement("select * from questions where question_id=?");
            q.setInt(1, id);
            ResultSet result = q.executeQuery();
            while(result.next()){
                question.setCorrect(result.getString(7));
                answered = question.getCorrect();
            }
            
            if(answer.equals(answered)){
                return true;
            }else{
                return false;
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return false;
    }
}
