package com.optd.content.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.optd.content.dto.SignUpDTO;
import com.optd.content.util.JdbcConnectUtil;

public class SignUpDAO {
    public boolean insertUser(SignUpDTO user) {
        String sql = "INSERT INTO users (username, password, email, phone, nickname, profile_image, marketing) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JdbcConnectUtil.getConnection();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getNickname());
            pstmt.setString(6, user.getProfileImage());
            pstmt.setBoolean(7, user.isMarketing());

            int result = pstmt.executeUpdate();
            return result == 1;

        } catch (Exception e) {
            e.printStackTrace();
            return false;

        } finally {
            JdbcConnectUtil.close(conn, pstmt);
        }
    }
}
