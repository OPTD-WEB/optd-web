<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="w-full bg-black border-b border-gray-800 z-50">
    <div class="flex items-center justify-between px-8 py-4">

        <!-- Left: Logo + Navigation -->
        <div class="flex items-center gap-8">
            <a href="/">
                <img src="${pageContext.request.contextPath}/assets/images/optd_main_logo.png"
                     alt="homeLogo"
                     class="w-[130px] h-[50px]">
            </a>

            <div class="hidden md:flex items-center gap-6 text-sm">
                <a href="/" class="hover:text-gray-300">홈</a>
                <a href="/explore" class="hover:text-gray-300">탐색</a>
                <a href="/chat" class="hover:text-gray-300">채팅</a>
            </div>
        </div>

        <!-- Center: Search (Desktop Only) -->
        <div class="hidden lg:block absolute left-1/2 -translate-x-1/2">
            <div class="relative w-[400px]">
                <svg class="absolute left-3 top-[9px] w-4 h-4" viewBox="0 0 16 16" fill="none">
                    <path d="M14 14L11.1067 11.1067" stroke="#99A1AF" stroke-width="1.33333" stroke-linecap="round"/>
                    <path d="M7.33333 12.6667C10.2789 12.6667 12.6667 10.2789 12.6667 7.33333C12.6667 4.38781 10.2789 2 7.33333 2C4.38781 2 2 4.38781 2 7.33333C2 10.2789 4.38781 12.6667 7.33333 12.6667Z" 
                          stroke="#99A1AF" stroke-width="1.33333"/>
                </svg>
                <input 
                    type="text"
                    placeholder="영화, 시리즈, 배우를 검색하세요"
                    class="w-full h-9 pl-10 pr-4 rounded-md bg-white text-sm text-black focus:outline-none">
            </div>
        </div>

        <!-- Right: Auth Buttons -->
        <div class="flex gap-2">
            <button onclick="location.href='/login'" 
                class="bg-white text-black hover:bg-red-600 hover:text-white rounded-full px-5 h-8 text-sm transition-colors">
                로그인
            </button>
            <button onclick="location.href='/signup'" 
                class="bg-transparent text-white border border-white hover:bg-red-600 hover:border-red-600 rounded-full px-4 h-8 text-sm transition-colors">
                회원가입
            </button>
        </div>

    </div>

    <!-- Mobile Search -->
    <div class="px-4 py-3 lg:hidden">
        <div class="relative w-full">
            <svg class="absolute left-3 top-[10px] w-4 h-4" viewBox="0 0 16 16" fill="none">
                <path d="M14 14L11.1067 11.1067" stroke="#99A1AF" stroke-width="1.33333"/>
                <path d="M7.33333 12.6667C10.2789 12.6667 12.6667 10.2789 12.6667 7.33333C12.6667 4.38781 10.2789 2 7.33333 2C4.38781 2 2 4.38781 2 7.33333C2 10.2789 4.38781 12.6667 7.33333 12.6667Z" 
                      stroke="#99A1AF" stroke-width="1.33333"/>
            </svg>
            <input 
                type="text"
                placeholder="영화, 시리즈, 배우를 검색하세요"
                class="w-full h-9 pl-10 pr-4 rounded-md bg-white text-sm text-black focus:outline-none">
        </div>
    </div>
</nav>
