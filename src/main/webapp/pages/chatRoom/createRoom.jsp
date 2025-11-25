<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>채팅방 만들기 - OPTD</title>
<script src="https://cdn.tailwindcss.com"></script>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Inter', 'Noto Sans KR', sans-serif;
    }
</style>
</head>
<body class="bg-black text-white min-h-screen">

<!-- 상단 헤더 -->
<%@ include file="../home/header.jsp" %>

<div class="max-w-3xl mx-auto mt-12 bg-[#1a1a1a] p-8 rounded-2xl shadow-xl">
    <h1 class="text-2xl font-bold mb-8">채팅방 만들기</h1>

    <form action="createRoom.do" method="post" class="space-y-6">

        <!-- OTT 선택 -->
        <div>
            <label class="block mb-2 font-semibold">OTT 선택</label>
            <select name="ott" class="w-full p-3 rounded-lg bg-gray-800 text-white border border-gray-600">
                <option value="">선택하세요</option>
                <option value="Netflix">Netflix</option>
                <option value="Disney+">Disney+</option>
                <option value="Watcha">Watcha</option>
                <option value="Tving">Tving</option>
                <option value="Wavve">Wavve</option>
            </select>
        </div>

        <!-- 채팅방 이름 -->
        <div>
            <label class="block mb-2 font-semibold">채팅방 이름</label>
            <input type="text" name="roomName" class="w-full p-3 rounded-lg bg-gray-800 text-white border border-gray-600" placeholder="예: 기생충 영화 토론방" required />
        </div>

        <!-- 최대 인원수 -->
        <div>
            <label class="block mb-2 font-semibold">인원수 제한</label>
            <input type="number" name="limit" class="w-full p-3 rounded-lg bg-gray-800 text-white border border-gray-600" placeholder="예: 20" min="1" required />
        </div>

        <!-- 제출 버튼 -->
        <div class="flex justify-end gap-3 mt-8">
            <button type="button" onclick="history.back()" class="px-5 py-2 bg-gray-600 rounded-lg hover:bg-gray-500">취소</button>
            <button type="submit" class="px-6 py-2 bg-red-600 rounded-lg font-semibold hover:bg-red-700">채팅방 생성하기</button>
        </div>

    </form>
</div>

</body>
</html>
