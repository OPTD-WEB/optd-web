<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OPTD 채팅 목록</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', 'Noto Sans KR', sans-serif;
        }
        .chat-room-card {
            background: #1a1a1a;
            color: #fff;
            padding: 12px;
            border-radius: 12px;
            cursor: pointer;
            transition: transform 0.2s, background 0.2s;
        }
        .chat-room-card:hover {
            transform: scale(1.02);
            background: #2a2a2a;
        }
        .chat-message {
            padding: 6px 12px;
            border-radius: 12px;
            margin-bottom: 6px;
            max-width: 70%;
            word-wrap: break-word;
        }
        .chat-message.user {
            background: #e60023;
            color: white;
            align-self: flex-end;
        }
        .chat-message.other {
            background: #2a2a2a;
            color: white;
            align-self: flex-start;
        }
    </style>
</head>

<body class="bg-black min-h-screen text-white flex flex-col">

<!-- 상단바 -->
<%@ include file="../home/header.jsp" %>

<div class="flex flex-1">

    <!-- ===== 왼쪽 사이드바 ===== -->
    <aside class="w-80 bg-gray-900 h-screen flex flex-col p-4 gap-4">

        <!-- 채팅방 상단 버튼 -->
        <div class="flex justify-between items-center">
            <span class="font-semibold text-sm">채팅방</span>
            <button class="bg-red-600 hover:bg-red-700 w-8 h-8 flex items-center justify-center rounded-full text-white text-lg"
                    onclick="location.href='./createRoom.jsp'">+</button>
        </div>

        <!-- 검색창 -->
        <div>
            <input type="text" placeholder="채팅방 검색..." 
                   class="w-full px-3 py-2 rounded-lg bg-gray-800 border border-gray-700 text-sm text-white"/>
        </div>

        <!-- 채팅방 목록 -->
        <ul class="flex flex-col gap-2 overflow-y-auto">
            <c:forEach var="room" items="${chatRooms}">
                <li class="chat-room-card flex items-center gap-3 p-3"
                    onclick="location.href='chatRoom.jsp?id=${room.id}'">
                    <div class="w-10 h-10 bg-blue-500 rounded-full flex-shrink-0"></div>
                    <div class="flex flex-col flex-1">
                        <span class="font-medium">${room.title}</span>
                        <span class="text-xs text-gray-400">${room.userCount}명 참여 중</span>
                    </div>
                    <span class="bg-red-500 text-white text-xs px-2 py-1 rounded-full">${room.unreadCount}</span>
                </li>
            </c:forEach>
        </ul>

    </aside>

    <!-- ===== 오른쪽 채팅 영역 ===== -->
    <main class="flex-1 bg-gray-900 h-screen flex flex-col p-4">

        <!-- 선택된 채팅방 확인 -->
        <c:choose>
            <c:when test="${not empty selectedRoom}">
                <div class="flex-1 flex flex-col overflow-y-auto p-4 gap-2">
                    <div class="font-bold text-lg mb-4">${selectedRoom.title}</div>
                    
                    <!-- 채팅 메시지 -->
                    <c:forEach var="msg" items="${selectedRoom.messages}">
                        <div class="chat-message ${msg.user == sessionScope.user.name ? 'user' : 'other'}">
                            <span class="text-sm">${msg.user}: </span>${msg.content}
                        </div>
                    </c:forEach>
                </div>

                <!-- 입력창 -->
                <form action="sendMessage.do" method="post" class="flex gap-2 mt-2">
                    <input type="hidden" name="roomId" value="${selectedRoom.id}" />
                    <input type="text" name="message" placeholder="메시지를 입력하세요..."
                           class="flex-1 p-3 rounded-lg bg-gray-800 border border-gray-700 text-white"/>
                    <button type="submit" class="bg-red-600 hover:bg-red-700 px-4 py-2 rounded-lg">전송</button>
                </form>
            </c:when>
            <c:otherwise>
                <div class="flex flex-col justify-center items-center h-full text-gray-500 text-lg">
                    채팅방을 선택하거나 새 채팅방을 만들어 시작하세요.
                </div>
            </c:otherwise>
        </c:choose>

    </main>

</div>

</body>
</html>
