/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import model.pojo.BeanTask;
import model.pojo.BeanUser;

/**
 *
 * @author clara
 */
public class DAOTask extends Bd {

    private Connection conn;
    private Statement stmt;

    public DAOTask() throws Exception {

        conn = getConnexio();
        stmt = conn.createStatement();
    }

    public void insertTask(String task, int userId) throws Exception {
        stmt.executeUpdate("INSERT INTO task (task, user_id) VALUES ('" + task + "','" + userId + "')");
    }

    public ArrayList<BeanTask> getTasks(int userId) throws Exception {
        ResultSet rs = stmt.executeQuery("SELECT * FROM task WHERE user_id = " + userId + " ORDER BY id ");

        ArrayList<BeanTask> listTask = new ArrayList();

        while (rs.next()) {
            BeanTask task = new BeanTask();

            int id = rs.getInt("id");
            String t = rs.getString("task");
            Date st = rs.getDate("startedAt");
            Date ct = rs.getDate("completedAt");
            int uId = rs.getInt("user_id");

            task.setId(id);
            task.setTask(t);
            task.setStartedAt(st);
            task.setCompletedAt(ct);
            task.setUser_id(uId);
            listTask.add(task);
        }
        return listTask;

    }

    public void removeTask(int id) throws SQLException {
        stmt.executeUpdate("DELETE FROM task WHERE id = " + id);
    }

    public void startTask(int id) throws SQLException {
        stmt.executeUpdate("UPDATE task SET startedAt = NOW() WHERE id = " + id);
    }

    public void pauseTask(int id) throws SQLException {
        stmt.executeUpdate("UPDATE task SET completedAt = NOW() WHERE id = " + id);
    }
    
    public void totalTime() { // retornarà algo
        /*BeanTask task = new BeanTask();
        Date start = task.getStartedAt();
        System.out.println("start: " + start);*/
        
        // Canviar-ho per SELECT's directament
        // Enllaç per la diferència entre hores en Java: https://www.mkyong.com/java/how-to-calculate-date-time-difference-in-java/
    }
}
