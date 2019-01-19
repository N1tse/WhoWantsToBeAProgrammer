/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pogos;

/**
 *
 * @author theod
 */
public class Score {
    private int id;
    private int user_id;
    private String date;
    private int subject_id;
    private int score;

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getDate() {
        return date;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public int getScore() {
        return score;
    }
}
