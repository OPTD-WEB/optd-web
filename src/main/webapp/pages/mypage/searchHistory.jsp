<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색 기록 - OPTD</title>

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

    .search-header { display: flex; justify-content: flex-end; margin-bottom: 1rem; }

    .delete-all {
        background: #e7000b;
        color: white;
        padding: 8px 16px;
        border-radius: 6px;
        font-weight: 500;
        cursor: pointer;
    }
    .delete-all:hover { background: #ff2a3d; }

    .search-list { display: flex; flex-direction: column; gap: 1rem; }

    .search-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #1a1a1a;
        padding: 10px 15px;
        border-radius: 10px;
    }

    .search-item-left { display: flex; flex-direction: column; }
    .item-title { font-weight: 500; color: #fff; }
    .item-date { font-size: 12px; color: #aaa; }

    .item-remove {
        background: #e7000b;
        color: white;
        border: none;
        padding: 4px 8px;
        border-radius: 6px;
        cursor: pointer;
    }
    .item-remove:hover { background: #ff2a3d; }

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
        <div class="profile-info">관심 콘텐츠 : <c:out value="${contentCount}" default="0" /></div>

        <button class="edit-btn">프로필 수정</button>
    </div>

    <!-- 오른쪽 검색기록 영역 -->
    <div class="content-area">

        <!-- 탭 -->
        <div class="tabs">
            <a href="mypage.jsp" class="tab">관심 콘텐츠</a>
            <a href="searchHistory.jsp" class="tab active">검색기록</a>
        </div>

        <!-- 전체 삭제 버튼 -->
        <div class="search-header">
            <button class="delete-all" onclick="alert('전체 삭제 기능 연결 예정')">전체 삭제</button>
        </div>

        <!-- 검색 기록 리스트 -->
        <div class="search-list">
            <c:choose>
                <c:when test="${not empty searchList}">
                    <c:forEach var="item" items="${searchList}">
                        <div class="search-item">
                            <div class="search-item-left">
                                <div class="item-title">${item.keyword}</div>
                                <div class="item-date">${item.searchDate}</div>
                            </div>
                            <button class="item-remove" onclick="alert('삭제 기능 연결 예정')">x</button>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p style="opacity:0.6; margin-top:20px;">검색 기록이 없습니다.</p>
                </c:otherwise>
            </c:choose>
        </div>

    </div>

</div>

</body>
</html>
