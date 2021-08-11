/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.db;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author redra
 */
public class DBUtils implements Serializable {
    public static Connection getMyConnection() throws Exception {
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:6666;databaseName=LAB1_LAB231;user=sa;password=Longlol123");
        return conn;
    }
}
