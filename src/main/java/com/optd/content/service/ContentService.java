package com.optd.content.service;

import com.optd.content.dto.ContentDTO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class ContentService {

    // 🔑 API 키를 환경 변수에서 읽어오기 위한 이름 정의
    private static final String TMDB_API_KEY_ENV_NAME = "TMDB_API_KEY";
    
    // ⚠️ API 키를 하드코딩하지 않고 final 필드로 선언
    private final String API_KEY; 
    
    // ✅ 나머지 상수들은 그대로 유지
    private static final String BASE_URL = "https://api.themoviedb.org/3";
    private static final String IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w500";
    private static final String LANGUAGE = "ko-KR";
    private static final String PLACEHOLDER_IMAGE_URL = "https://via.placeholder.com/342x513?text=No+Image";

    private final HttpClient httpClient;
    private final ObjectMapper objectMapper;

    public ContentService() {
        // 1. 환경 변수에서 API 키 로드 및 검증
        String apiKey = System.getenv(TMDB_API_KEY_ENV_NAME);
        if (apiKey == null || apiKey.isBlank()) {
            throw new IllegalStateException(
                "❌ 필수 환경 변수 '" + TMDB_API_KEY_ENV_NAME + "'가 설정되지 않았습니다. API 키를 설정해주세요."
            );
        }
        this.API_KEY = apiKey;
        
        // 2. HTTP 클라이언트 및 ObjectMapper 초기화
        this.httpClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(10))
                .build();
        this.objectMapper = new ObjectMapper();
    }

    private List<ContentDTO> fetchContentFromApi(String endpoint, int listSize) {
        // API_KEY는 이제 this.API_KEY를 통해 접근합니다.
        String fullUrl = String.format("%s%s?api_key=%s&language=%s&page=1",
                BASE_URL, endpoint, this.API_KEY, LANGUAGE);
        List<ContentDTO> contentList = new ArrayList<>();

        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(new URI(fullUrl))
                    .header("Accept", "application/json")
                    .GET()
                    .build();

            System.out.println("🌍 TMDB API 호출 URL: " + fullUrl);

            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() != 200) {
                System.err.println("❌ TMDB API 호출 실패! HTTP 코드: " + response.statusCode());
                System.err.println("❌ 응답 본문: " + response.body());
                return Collections.emptyList();
            }

            JsonNode rootNode = objectMapper.readTree(response.body());
            ArrayNode results = (ArrayNode) rootNode.get("results");

            if (results == null || results.isEmpty()) {
                System.out.println("⚠️ TMDB API 'results' 배열 없음 또는 비어 있음");
                return Collections.emptyList();
            }

            int rank = 1;
            for (int i = 0; i < results.size() && i < listSize; i++) {
                JsonNode movie = results.get(i);
                ContentDTO dto = new ContentDTO();

                dto.setId(Optional.ofNullable(movie.get("id"))
                        .filter(n -> !n.isNull())
                        .map(JsonNode::asLong)
                        .orElse(0L));

                dto.setRank(rank++);

                // ✅ 안전한 title 처리
                String title = Optional.ofNullable(movie.get("title"))
                        .filter(n -> !n.isNull() && !n.asText().isBlank())
                        .map(JsonNode::asText)
                        .orElseGet(() -> Optional.ofNullable(movie.get("name"))
                                .filter(n -> !n.isNull() && !n.asText().isBlank())
                                .map(JsonNode::asText)
                                .orElse("제목 없음"));
                dto.setTitle(title);

                // ✅ 안전한 poster_path 처리
                String posterPath = Optional.ofNullable(movie.get("poster_path"))
                        .filter(n -> !n.isNull() && !n.asText().isBlank() && !"null".equals(n.asText()))
                        .map(JsonNode::asText)
                        .orElse(null);

                String imageUrl = (posterPath != null) ? IMAGE_BASE_URL + posterPath : PLACEHOLDER_IMAGE_URL;
                dto.setImageUrl(imageUrl);

                if (posterPath == null) {
                    System.out.println("⚠️ 포스터 없음: " + title + " (ID: " + dto.getId() + ")");
                }

                contentList.add(dto);
            }

        } catch (Exception e) {
            System.err.println("❌ API 통신 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            return Collections.emptyList();
        }

        return contentList;
    }

    public List<ContentDTO> getTop7Contents() {
        return fetchContentFromApi("/movie/popular", 7);
    }

    public List<ContentDTO> getTop20Contents() {
        return fetchContentFromApi("/movie/popular", 20);
    }

    public List<ContentDTO> getRecommendedContents() {
        return fetchContentFromApi("/movie/popular", 6);
    }
}