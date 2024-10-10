package com.example.classjsp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DBconnect {
    private static final Properties properties = new Properties();

    static {
        try (InputStream input = DBconnect.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                System.out.println("Sorry, unable to find db.properties");
            }
            properties.load(input);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    static final String MYSQL_DRIVER = properties.getProperty("MYSQL_DRIVER");
    static final String MYSQL_URL = properties.getProperty("MYSQL_URL");
    static final String USERNAME = properties.getProperty("USERNAME");
    static final String PASSWORD = properties.getProperty("PASSWORD");

    public DBconnect() {
        // TODO Auto-generated constructor stub
        try {
            Class.forName(MYSQL_DRIVER);
        } catch (ClassNotFoundException e) {
            System.out.println("Mysql 드라이버 실패:"+e.getMessage());
        }
    }

    public Connection getConnection()
    {
        Connection conn=null;
        try {
            conn=DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            System.out.println("Mysql 연결 실패 : "+e.getMessage());
        }

        return conn;
    }

    public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
    {
        try {
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException|NullPointerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public void dbClose(PreparedStatement pstmt,Connection conn)
    {
        try {
            pstmt.close();
            conn.close();
        } catch (SQLException|NullPointerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void dbClose(ResultSet rs,Statement stmt,Connection conn)
    {
        try {
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException|NullPointerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public void dbClose(Statement stmt,Connection conn)
    {
        try {
            stmt.close();
            conn.close();
        } catch (SQLException|NullPointerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}