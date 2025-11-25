<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>

<!-- TailwindCSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family:'Inter','Noto Sans KR',sans-serif;
        background:#000;
        color:#fff;
    }

    .container {
        max-width: 420px;                  /* 기존 500 → 슬림하게 */
        margin: 2.3rem auto;
        background:#151515;                /* 톤 다운하여 더 고급스럽게 */
        padding:1.4rem 1.5rem;             /* 여백 줄여서 부담감 감소 */
        border-radius:14px;
        box-shadow:0 0 12px rgba(255,255,255,0.05);
    }

    .title {
        font-size:18px;                    /* 20 → 과하지 않게 */
        font-weight:700;
        margin-bottom:1rem;
        border-bottom:1px solid #2c2c2c;   /* 더 얇고 트렌디 */
        padding-bottom:0.45rem;
        text-align:center;
    }

    .label {
        margin-top:12px;
        font-size:13px;
        font-weight:600;
    }

    .input {
        width:100%;
        padding:9px;                       /* padding 조금 줄임 */
        border-radius:7px;
        background:#222;
        border:1px solid #333;
        color:white;
        margin-top:4px;
        font-size:14px;
    }

    .save-btn {
        margin-top:20px;
        width:100%;
        padding:10px;
        background:#e7000b;
        color:white;
        font-size:14.5px;                  /* 15 → 살짝 축소 */
        border-radius:7px;
        cursor:pointer;
        transition:.2s;
    }
    .save-btn:hover { background:#ff2a3d; }

    .profile-center {
        text-align:center;
        margin-bottom:14px;
    }

    .profile-img-edit {
        width:82px;                         /* 90 → 더 미니멀 */
        height:82px;
        border-radius:50%;
        object-fit:cover;
        background:#444;
    }

    .back {
        margin-top:15px;
        text-align:center;
    }
    .back a {
        color:#999;
        font-size:12.7px;
        text-decoration:underline;
    }
</style>
</head>
<body>

<!-- Header 상단바 포함 -->
<%@ include file="../home/header.jsp" %>

<div class="container">
    <div class="title">프로필 수정</div>

    <!-- 프로필 이미지 -->
    <div class="profile-center">
        <c:choose>
            <c:when test="${not empty sessionScope.user.profileImg}">
                <img class="profile-img-edit" src="${sessionScope.user.profileImg}">
            </c:when>
            <c:otherwise>
                <div class="profile-img-edit"></div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- 수정 Form -->
    <form action="updateProfile.do" method="post" enctype="multipart/form-data">
        <label class="label">이름</label>
        <input type="text" name="name" class="input" value="${sessionScope.user.name}" required>

        <label class="label">프로필 이미지 변경</label>
        <input type="file" name="profileImg" class="input">

        <button class="save-btn">저장하기</button>
    </form>

    <div class="back">
        <a href="mypage.jsp">← 돌아가기</a>
    </div>
</div>

</body>
</html>
