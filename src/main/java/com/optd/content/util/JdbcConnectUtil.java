package com.optd.content.util;

import java.sql.*;

public class JdbcConnectUtil {
	public static Connection getConnection() {
		 Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 환경 변수에서 DB 아이디/비밀번호 가져오기
            String DB_ID = System.getenv("DB_ID");
            String DB_PASSWORD = System.getenv("DB_PASSWORD");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/optddb", DB_ID, DB_PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	public static void close(Connection con, PreparedStatement pstmt) {
		try {
			con.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			con.close();
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
