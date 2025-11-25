<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채팅방 목록 - OPTD</title>

<!-- TailwindCSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Inter', 'Noto Sans KR', sans-serif;
    }

    .profile-box {
        width: 280px;
        background: #1a1a1a;
        border-radius: 12px;
        padding: 25px;
        color: #fff;
        height: fit-content;
    }

    .profile-placeholder {
        width: 120px;
        height: 120px;
        background: #444;
        border-radius: 50%;
        display: inline-block;
    }

    .tab {
        padding: 10px 15px;
        font-size: 15px;
        color: #aaa;
        border-bottom: 2px solid transparent;
    }
    .tab.active {
        color: #fff;
        border-bottom: 2px solid #e7000b;
    }

    .content-card {
        background: #fff;
        border-radius: 15px;
        padding: 15px;
        color: #000;
    }
    .content-thumb {
        width: 100%;
        height: 150px;
        background: #d9d9d9;
        border-radius: 10px;
    }
</style>

</head>

<body class="bg-black text-white">

<!-- Header -->
<%@ include file="../home/header.jsp" %>

<div class="flex gap-10 mt-10 px-6">

    <!-- ================== 왼쪽 프로필 영역 ================== -->
    <div class="profile-box">

        <div class="flex justify-center">
            <c:choose>
                <c:when test="${not empty sessionScope.user.profileImg}">
                    <img src="${sessionScope.user.profileImg}" class="w-32 h-32 rounded-full object-cover"/>
                </c:when>
                <c:otherwise>
                    <div class="profile-placeholder"></div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="mt-4 text-center text-xl font-bold">
            <c:out value="${sessionScope.user.name}" default="Guest"/>
        </div>

        <div class="mt-4 text-gray-300 text-sm space-y-2 text-left">
            <div>가입일 : ${sessionScope.user.regDate}</div>
            <div>시청시간 : ${sessionScope.user.watchTime}</div>
            <div>관심 콘텐츠 : ${contentCount}</div>
        </div>

        <button class="w-full mt-6 bg-red-600 hover:bg-red-700 py-2 rounded-md">
            프로필 수정
        </button>
    </div>

    <!-- ================== 오른쪽 콘텐츠 ================== -->
    <div class="flex-1">

        <!-- 탭 -->
        <div class="flex gap-4 mb-6 border-b border-gray-700 pb-2">
            <a href="../mypage/mypage.jsp" class="tab">관심 콘텐츠</a>
            <a href="./chatRoom.jsp" class="tab active">채팅방</a>
        </div>

        <!-- 상단 설명 + 채팅방 만들기 -->
        <div class="bg-white text-black p-5 rounded-xl mb-6 flex justify-between items-center">
            <div>
                <div class="text-lg font-semibold">동영상 채팅방</div>
                <div class="text-sm text-gray-500 mt-1">
                    좋아하는 영화나 드라마에 대해 다른 사용자들과 이야기 해보세요.
                </div>
            </div>

            <!-- 수정된 버튼: 클릭 시 createRoom.jsp로 이동 -->
            <button class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-md"
                    onclick="location.href='./createRoom.jsp'">
                + 채팅방 만들기
            </button>
        </div>

        <!-- 채팅방 카드 그리드 -->
        <div class="grid grid-cols-3 gap-6">

            <c:forEach var="room" items="${chatRooms}">
                <div class="content-card">

                    <div class="content-thumb"></div>

                    <div class="mt-3 font-semibold">${room.title}</div>
                    <div class="text-sm text-gray-600">
                        ${room.year} · ${room.genre}
                    </div>
                    <div class="text-xs text-gray-500 mt-1">
                        👥 ${room.userCount}명 참여
                    </div>

                    <button class="mt-3 w-full bg-red-600 hover:bg-red-700 text-white py-2 rounded-md">
                        채팅 참여하기
                    </button>
                </div>
            </c:forEach>

        </div>

    </div>

</div>

</body>
</html>
