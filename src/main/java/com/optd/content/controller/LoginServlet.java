package com.optd.content.controller;

import com.optd.content.dao.LoginDAO;
import com.optd.content.dto.LoginDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private LoginDAO loginDAO = new LoginDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        // JSON 데이터 읽기
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        JSONObject jsonRequest = new JSONObject(sb.toString());
        String username = jsonRequest.getString("userId");        // JS fetch에서 userId
        String password = jsonRequest.getString("userPassword");  // JS fetch에서 userPassword

        LoginDTO loginDTO = new LoginDTO(username, password);

        JSONObject jsonResponse = new JSONObject();
        if (loginDAO.checkLogin(loginDTO)) {
            jsonResponse.put("success", true);
            jsonResponse.put("message", "로그인 성공");
        } else {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
        }

        response.getWriter().write(jsonResponse.toString());
    }
}
