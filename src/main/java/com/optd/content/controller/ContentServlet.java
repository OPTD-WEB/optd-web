package com.optd.content.controller;

import com.optd.content.dto.ContentDTO;
import com.optd.content.service.ContentService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonProcessingException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@WebServlet("/api/main")
public class ContentServlet extends HttpServlet {

    private ContentService contentService;
    private ObjectMapper objectMapper;

    @Override
    public void init() throws ServletException {
        try {
            contentService = new ContentService();
            objectMapper = new ObjectMapper();
        } catch (Exception e) {
            System.err.println("❌ ContentServlet 초기화 오류: " + e.getMessage());
            throw new ServletException("ContentService 또는 ObjectMapper 초기화 실패", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // -------------------------------
            // 안전하게 Service 호출
            // -------------------------------
            List<ContentDTO> top7List = Optional.ofNullable(contentService.getTop7Contents())
                    .orElse(Collections.emptyList());
            List<ContentDTO> top20List = Optional.ofNullable(contentService.getTop20Contents())
                    .orElse(Collections.emptyList());
            List<ContentDTO> recommendList = Optional.ofNullable(contentService.getRecommendedContents())
                    .orElse(Collections.emptyList());

            // -------------------------------
            // 로그로 첫 번째 아이템 확인
            // -------------------------------
            String top7ImageUrl = top7List.stream()
                    .findFirst()
                    .map(ContentDTO::getImageUrl)
                    .orElse("데이터 없음");

            String top7Title = top7List.stream()
                    .findFirst()
                    .map(ContentDTO::getTitle)
                    .orElse("데이터 없음");

            System.out.println("\n--- Content API 연동 확인 로그 ---");
            System.out.println("TOP 7 (1위) Title: " + top7Title);
            System.out.println("TOP 7 (1위) Image URL: " + top7ImageUrl);
            System.out.println("----------------------------------------------\n");

            // -------------------------------
            // Map 생성 및 JSON 변환
            // -------------------------------
            Map<String, List<ContentDTO>> responseMap = new HashMap<>();
            responseMap.put("top7", top7List);
            responseMap.put("top20", top20List);
            responseMap.put("recommendations", recommendList);

            String jsonResponse = objectMapper.writeValueAsString(responseMap);

            out.print(jsonResponse);
            out.flush();

        } catch (JsonProcessingException jsonEx) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            System.err.println("❌ JSON 변환 오류: " + jsonEx.getMessage());
            response.getWriter().write("{\"error\": \"JSON serialization failed.\"}");
        } catch (IOException ioEx) {
            System.err.println("❌ 응답 스트림 오류: " + ioEx.getMessage());
        } catch (Exception ex) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            System.err.println("❌ 알 수 없는 오류 발생: " + ex.getMessage());
            response.getWriter().write("{\"error\": \"Unexpected error occurred.\"}");
        }
    }
}
