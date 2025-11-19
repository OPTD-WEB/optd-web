<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar h-[65px] w-full border-b border-[#101828] relative z-50">
    <div class="navbar-content px-4 py-3 flex items-center justify-between h-full max-w-[1920px] mx-auto">
        <div class="navbar-left flex items-center gap-5">
            <div class="logo flex items-center gap-2">
                <a href="#">
                    <img src="${pageContext.request.contextPath}/assets/images/optd_main_logo.png" alt="homeLogo" class="w-[130px] h-[50px]">
                </a>
            </div>

            <div class="nav-links hidden md:flex gap-6 items-center">
                <a href="#" class="nav-link text-sm text-white no-underline tracking-[-0.1504px] leading-5 transition-opacity duration-300 hover:opacity-80">홈</a>
                <a href="#" class="nav-link text-sm text-white no-underline tracking-[-0.1504px] leading-5 transition-opacity duration-300 hover:opacity-80">영화</a>
                <a href="#" class="nav-link text-sm text-white no-underline tracking-[-0.1504px] leading-5 transition-opacity duration-300 hover:opacity-80">TV</a>
            </div>
        </div>
        
        <div class="search-container absolute left-1/2 transform -translate-x-1/2 hidden lg:block">
            <div class="search-input relative w-[448px]">
                <svg class="search-icon absolute left-3 top-[10px] w-4 h-4" viewBox="0 0 16 16" fill="none">
                    <path d="M14 14L11.1067 11.1067" stroke="#99A1AF" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M7.33333 12.6667C10.2789 12.6667 12.6667 10.2789 12.6667 7.33333C12.6667 4.38781 10.2789 2 7.33333 2C4.38781 2 2 4.38781 2 7.33333C2 10.2789 4.38781 12.6667 7.33333 12.6667Z" stroke="#99A1AF" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <input type="text" placeholder="영화, 시리즈, 배우를 검색하세요" class="w-full h-9 px-4 pl-10 rounded-md border-none bg-white text-sm text-[rgba(0,0,0,0.5)] tracking-[-0.1504px] focus:outline-none">
            </div>
        </div>

        <div class="auth-buttons flex gap-2">
            <a href="#" class="btn-login bg-white text-black py-[6px] px-4 rounded-md border-none text-sm tracking-[-0.1504px] leading-5 cursor-pointer transition-opacity duration-300 hover:opacity-90">로그인</a>
            <a href="#" class="btn-signup bg-transparent text-white py-[7px] px-[17px] rounded-md border border-white text-sm tracking-[-0.1504px] leading-5 cursor-pointer transition-colors duration-300 hover:bg-[rgba(255,255,255,0.1)]">회원가입</a>
        </div>
    </div>

    <div class="search-container w-full px-4 pt-3 pb-4 lg:hidden order-3">
        <div class="search-input relative w-full">
            <svg class="search-icon absolute left-3 top-[10px] w-4 h-4" viewBox="0 0 16 16" fill="none">
                <path d="M14 14L11.1067 11.1067" stroke="#99A1AF" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M7.33333 12.6667C10.2789 12.6667 12.6667 10.2789 12.6667 7.33333C12.6667 4.38781 10.2789 2 7.33333 2C4.38781 2 2 4.38781 2 7.33333C2 10.2789 4.38781 12.6667 7.33333 12.6667Z" stroke="#99A1AF" stroke-width="1.33333" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <input type="text" placeholder="영화, 시리즈, 배우를 검색하세요" class="w-full h-9 px-4 pl-10 rounded-md border-none bg-white text-sm text-[rgba(0,0,0,0.5)] tracking-[-0.1504px] focus:outline-none">
        </div>
    </div>
</nav>