<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTD 회원가입 완료</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="min-h-screen bg-black text-white">

    <%-- Header --%>
    <%@ include file="../home/header.jsp" %>
            
    <!-- Main Content -->
    <main class="flex items-center justify-center py-12 px-4">
        <div class="w-full max-w-2xl">
            <!-- Success Icon -->
            <div class="flex justify-center mb-8">
                <div class="flex items-center justify-center bg-[#00a63e] rounded-full w-24 h-24">
                    <i data-lucide="check" class="w-12 h-12 text-white stroke-[6]"></i>
                </div>
            </div>

            <!-- Welcome Message -->
            <h1 class="text-center text-2xl mb-4">OPTD에 오신 것을 환영합니다!</h1>
            
            <!-- Description -->
            <div class="text-center text-[#99a1af] space-y-1 mb-12">
                <p>회원가입이 완료되었습니다.</p>
                <p>이제 OPTD에서 다양한 OTT 플랫폼의 컨텐츠를 검색하고</p>
                <p>나만의 리스트를 만들어보세요.</p>
            </div>

            <!-- Action Buttons -->
            <div class="flex gap-4 justify-center mb-16">
                <a href="/optd-web/index.jsp" class="flex-1 max-w-[170px]">
                    <button class="w-full bg-[#e7000b] text-white h-12 rounded-lg hover:bg-[#c70009] transition-colors">
                        홈으로 이동
                    </button>
                </a>
                <a href="/optd-web/explore" class="flex-1 max-w-[154px]">
                    <button class="w-full bg-[rgba(255,255,255,0.05)] text-white h-[50px] rounded-lg border border-[rgba(255,255,255,0.2)] hover:bg-[rgba(255,255,255,0.1)] transition-colors">
                        탐색하기
                    </button>
                </a>
            </div>

            <!-- Feature Cards -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-12 max-w-[514px] mx-auto">
                <!-- Content Exploration -->
                <div class="flex flex-col items-center text-center">
                    <div class="flex items-center justify-center bg-[rgba(21,93,252,0.2)] rounded-full w-16 h-16 mb-4">
                        <i data-lucide="search" class="w-8 h-8 text-[#51A2FF]"></i>
                    </div>
                    <h3 class="mb-4">컨텐츠 탐색</h3>
                    <div class="text-[#99a1af] text-sm space-y-1">
                        <p>모든 OTT 플랫폼의</p>
                        <p>컨텐츠를 한 곳에서</p>
                    </div>
                </div>

                <!-- Wishlist -->
                <div class="flex flex-col items-center text-center">
                    <div class="flex items-center justify-center bg-[rgba(152,16,250,0.2)] rounded-full w-16 h-16 mb-4">
                        <i data-lucide="heart" class="w-8 h-8 text-[#C27AFF]"></i>
                    </div>
                    <h3 class="mb-4">찜하기</h3>
                    <div class="text-[#99a1af] text-sm space-y-1">
                        <p>관심있는 컨텐츠를</p>
                        <p>찜하고 관리하세요</p>
                    </div>
                </div>

                <!-- Reviews -->
                <div class="flex flex-col items-center text-center">
                    <div class="flex items-center justify-center bg-[rgba(208,135,0,0.2)] rounded-full w-16 h-16 mb-4">
                        <i data-lucide="star" class="w-8 h-8 text-[#FDC700]"></i>
                    </div>
                    <h3 class="mb-4">리뷰 작성</h3>
                    <div class="text-[#99a1af] text-sm space-y-1">
                        <p>본 컨텐츠에 대한</p>
                        <p>리뷰를 남겨보세요</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%-- Footer  --%>
    <%@ include file="../home/footer.jsp" %>

    <script>
        // Lucide 아이콘 초기화
        lucide.createIcons();
    </script>
</body>
</html>
