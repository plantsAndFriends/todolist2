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
public class DAOTask extends Bd{
    
    private Connection conn;
    private Statement stmt;

    public DAOTask() throws Exception {     
        
        conn = getConnexio();
        stmt = conn.createStatement();
    }

    public void insertTask(String task) throws Exception {
        stmt.executeUpdate("INSERT INTO task (task) VALUES ('" + task + "')");
    }
    
//    public void updateTask(String task)throws Exception {
//        
//    }
    public ArrayList<BeanTask> getTasks() throws Exception {
        ResultSet rs = stmt.executeQuery("SELECT * FROM task ORDER BY id");

        ArrayList<BeanTask> listTask = new ArrayList();

        while (rs.next()) {
            BeanTask task = new BeanTask();

            int id = rs.getInt("id");
            String t = rs.getString("task");
            Date st = rs.getDate("startedAt");
            Date ct = rs.getDate("completedAt");

            task.setId(id);
            task.setTask(t);
            task.setStartedAt(st);
            task.setCompletedAt(ct);

            listTask.add(task);
        }
        return listTask;
    
        

//    public void removeTask(int id) throws SQLException {
//        stmt.executeUpdate("DELETE FROM task WHERE id = " + id);
//    }
}
}