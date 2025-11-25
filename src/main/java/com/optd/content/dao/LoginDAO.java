package com.optd.content.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.optd.content.dto.LoginDTO;
import com.optd.content.util.JdbcConnectUtil;

public class LoginDAO {

    public boolean checkLogin(LoginDTO loginDTO) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean success = false;

        try {
            con = JdbcConnectUtil.getConnection();
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, loginDTO.getUsername());
            pstmt.setString(2, loginDTO.getPassword());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                success = true; // 로그인 성공
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnectUtil.close(con, pstmt, rs);
        }

        return success;
    }
}
