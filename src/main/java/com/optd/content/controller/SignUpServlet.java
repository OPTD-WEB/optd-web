package com.optd.content.controller;  // 패키지명은 프로젝트에 맞게 변경하세요

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.optd.content.dto.SignUpDTO;
import com.optd.content.dao.SignUpDAO;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        // 1) JSON 데이터 읽기
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;

        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        JSONObject jsonRequest = new JSONObject(sb.toString());

        // 2) JSON → DTO 매핑
        SignUpDTO dto = new SignUpDTO();
        dto.setUsername(jsonRequest.getString("username"));
        dto.setPassword(jsonRequest.getString("password"));
        dto.setPasswordConfirm(jsonRequest.getString("passwordConfirm"));
        dto.setEmail(jsonRequest.getString("email"));
        dto.setPhone(jsonRequest.getString("phone"));
        dto.setNickname(jsonRequest.getString("nickname"));
        dto.setProfileImage(jsonRequest.getString("profileImage"));
        dto.setAge14(jsonRequest.getBoolean("age14"));
        dto.setService(jsonRequest.getBoolean("service"));
        dto.setPrivacy(jsonRequest.getBoolean("privacy"));
        dto.setMarketing(jsonRequest.getBoolean("marketing"));

        // 3) DAO를 이용해 DB 저장 시도
        SignUpDAO dao = new SignUpDAO();
        boolean result = dao.insertUser(dto);

        // 4) 클라이언트로 JSON 응답 반환
        JSONObject jsonResponse = new JSONObject();
        PrintWriter out = response.getWriter();

        if (result) {
            jsonResponse.put("success", true);
            jsonResponse.put("message", "회원가입 성공");
        } else {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "DB 저장 실패");
        }

        out.print(jsonResponse.toString());
        out.flush();
    }
}
