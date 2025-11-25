<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지 - 관심 콘텐츠</title>

<!-- TailwindCSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Custom CSS -->
<style>
    body { font-family: 'Inter', 'Noto Sans KR', sans-serif; background: #000; color: #fff; }

    .mypage-container { display: flex; gap: 2rem; margin-top: 2rem; padding: 0 2rem; }

    .profile-box {
        width: 280px;
        background: #1a1a1a;
        border-radius: 12px;
        padding: 25px;
        box-shadow: 0 0 8px rgba(255,255,255,0.1);
        text-align: center;
        color: #fff;
    }

    .profile-img img, .profile-placeholder {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
        background: #444;
        display: inline-block;
    }

    .profile-name { margin-top: 15px; font-size: 20px; font-weight: bold; color: #fff; }
    .profile-info { margin-top: 10px; font-size: 15px; color: #ccc; }

    .edit-btn {
        margin-top: 20px;
        width: 100%;
        padding: 10px;
        border: none;
        background: #e7000b;
        color: white;
        border-radius: 8px;
        cursor: pointer;
        font-size: 15px;
    }
    .edit-btn:hover { background: #ff2a3d; }

    .tabs { display: flex; margin-bottom: 1rem; }
    .tab {
        padding: 10px 18px;
        margin-right: 10px;
        font-size: 16px;
        color: #aaa;
        text-decoration: none;
        border-bottom: 2px solid transparent;
    }
    .tab.active { font-weight: bold; color: #fff; border-bottom: 2px solid #e7000b; }

    .content-area { flex: 1; }

    .content-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 1rem;
    }

    .content-card {
        background: #1a1a1a;
        border-radius: 12px;
        padding: 10px;
        text-align: center;
        cursor: pointer;
        transition: transform 0.2s;
    }
    .content-card:hover { transform: scale(1.03); }

    .thumb img { width: 100%; height: 150px; object-fit: cover; border-radius: 10px; }
    .thumb-placeholder { width: 100%; height: 150px; background: #333; border-radius: 10px; }

    .card-title { margin-top: 8px; font-weight: 600; color: #fff; }
</style>
</head>
<body>

<!-- Header 상단바 포함 -->
<%@ include file="../home/header.jsp" %>

<div class="mypage-container">

    <!-- 왼쪽 프로필 박스 -->
    <div class="profile-box">
        <div class="profile-img">
            <c:choose>
                <c:when test="${not empty sessionScope.user.profileImg}">
                    <img src="${sessionScope.user.profileImg}">
                </c:when>
                <c:otherwise>
                    <div class="profile-placeholder"></div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="profile-name">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    ${sessionScope.user.name}
                </c:when>
                <c:otherwise>Guest</c:otherwise>
            </c:choose>
        </div>

        <div class="profile-info">가입일 : <c:out value="${sessionScope.user.regDate}" default="--" /></div>
        <div class="profile-info">시청시간 : <c:out value="${sessionScope.user.watchTime}" default="0시간" /></div>
        <div class="profile-info">관심 콘텐츠 : <c:out value="${fn:length(contentList)}" default="0" /></div>

        <!-- 수정된 버튼: 프로필 수정 화면으로 이동 -->
        <button class="edit-btn" onclick="location.href='profileEdit.jsp'">프로필 수정</button>
    </div>

    <!-- 오른쪽 콘텐츠 영역 -->
    <div class="content-area">

        <!-- 탭 -->
        <div class="tabs">
            <a href="mypage.jsp" class="tab active">관심 콘텐츠</a>
            <a href="searchHistory.jsp" class="tab">검색기록</a>
        </div>

        <!-- 콘텐츠 카드 -->
        <div class="content-grid">
            <c:choose>
                <c:when test="${not empty contentList}">
                    <c:forEach var="item" items="${contentList}">
                        <div class="content-card" onclick="location.href='../detail?id=${item.id}'">
                            <div class="thumb">
                                <c:choose>
                                    <c:when test="${not empty item.thumbnail}">
                                        <img src="${item.thumbnail}" alt="${item.title}">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="thumb-placeholder"></div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="card-title">${item.title}</div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach begin="1" end="8">
                        <div class="content-card dummy">
                            <div class="thumb-placeholder"></div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

    </div>

</div>

</body>
</html>
