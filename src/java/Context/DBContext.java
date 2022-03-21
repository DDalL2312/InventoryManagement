/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        }
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    private final String serverName = "dalin.database.windows.net";
    private final String dbName = "Inventory";
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "dalinshop@dalin";
    private final String password = "tiendat.1423";
    
    public static void main(String[] args) throws SQLException, Exception {
        DBContext db = new DBContext();
        System.out.println(db.getConnection());
        System.out.println(db.getConnection().getCatalog());
    }
}