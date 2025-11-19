<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTD 메인</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        /* TOP20 순위 번호 블러 효과 */
        .rank-blur-1 { position: absolute; font-size: 90px; font-weight: 900; color: rgba(255,255,255,0.2); transform: translate(6px, 6px);}
        .rank-blur-2 { position: absolute; font-size: 90px; font-weight: 900; color: rgba(255,255,255,0.15); transform: translate(3px, 3px);}
        .rank-blur-3 { position: absolute; font-size: 90px; font-weight: 900; color: rgba(255,255,255,0.1);}
        .rank-main { position: absolute; font-size: 90px; font-weight: 900; color: white;}

        /* CSS 추가: 스크롤 애니메이션 및 스크롤바 숨기기 */
        .hero-carousel, .ranking-carousel, .content-carousel {
            scroll-behavior: smooth; /* 부드러운 스크롤 애니메이션 */
            overflow-x: scroll; /* 가로 스크롤 가능하게 설정 */
            -ms-overflow-style: none;  /* IE and Edge */
            scrollbar-width: none;  /* Firefox */
        }
        .hero-carousel::-webkit-scrollbar, .ranking-carousel::-webkit-scrollbar, .content-carousel::-webkit-scrollbar {
            display: none; /* Chrome, Safari and Opera 스크롤바 숨기기 */
        }
    </style>
</head>
<body class="bg-black text-white">

<main class="main-content flex-1 p-0">

    <section class="section hero-section relative px-4 py-6 max-w-[1920px] mx-auto">
        <div class="section-header flex justify-between items-center mb-4 mt-8">
            <h2 class="text-[28px] lg:text-[28px] font-bold">오늘의 TOP 7</h2>
        </div>

        <div class="hero-carousel-wrapper relative w-full">
            <div class="hero-carousel flex gap-4 h-[400px]">
                <% for(int i=0;i<7;i++) { %>
                    <div class="hero-card relative min-w-[400px] h-[380px] rounded-xl overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.02]">
                        <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=600&h=380&fit=crop" alt="콘텐츠 <%=i+1%>" class="w-full h-full object-cover">
                        <div class="hero-card-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.8)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
                        <h3 class="absolute bottom-4 left-4 text-lg font-medium z-10">콘텐츠 <%=i+1%></h3>
                    </div>
                <% } %>
            </div>

            <button class="carousel-nav-btn left absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full left-4 flex items-center justify-center z-10" data-carousel-target=".hero-carousel" data-slide-direction="prev">◀</button>
            <button class="carousel-nav-btn right absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full right-4 flex items-center justify-center z-10" data-carousel-target=".hero-carousel" data-slide-direction="next">▶</button>
        </div>
    </section>

    <section class="section ranking-section px-4 py-12 max-w-[1920px] mx-auto">
        <div class="section-header flex justify-between items-center mb-4 mt-8">
            <h2 class="text-[28px] lg:text-[28px] font-bold">이번주 TOP 20</h2>
        </div>

        <div class="ranking-carousel-wrapper relative w-full">
            <div class="ranking-carousel grid grid-rows-3 grid-flow-col gap-6 px-2">
                <% for(int i=1;i<=20;i++) { %>
                    <div class="ranking-card relative w-[300px] h-[160px] rounded-xl overflow-hidden shadow-2xl shadow-[rgba(0,0,0,0.25)] cursor-pointer flex-shrink-0">
                        <div class="rank-number absolute top-[73.5px] left-0 z-10">
                            <span class="rank-blur-1"><%=i%></span>
                            <span class="rank-blur-2"><%=i%></span>
                            <span class="rank-blur-3"><%=i%></span>
                            <span class="rank-main"><%=i%></span>
                        </div>
                        <img src="https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=170&fit=crop" alt="Rank <%=i%>" class="w-full h-full object-cover">
                        <div class="ranking-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.6)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
                    </div>
                <% } %>
            </div>

            <button class="carousel-nav-btn left absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full left-4 flex items-center justify-center z-10" data-carousel-target=".ranking-carousel" data-slide-direction="prev">◀</button>
            <button class="carousel-nav-btn right absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full right-4 flex items-center justify-center z-10" data-carousel-target=".ranking-carousel" data-slide-direction="next">▶</button>
        </div>
    </section>

    <section class="section content-section px-4 py-12 max-w-[1920px] mx-auto">
        <div class="section-header flex justify-between items-center mb-4 mt-8">
            <h2 class="text-[28px] lg:text-[28px] font-bold">추천 컨텐츠</h2>
        </div>

        <div class="content-carousel-wrapper relative w-full">
            <div class="content-carousel flex gap-4">
                <% for(int i=1;i<=6;i++) { %>
                    <div class="content-card min-w-[300px] h-[160px] rounded-lg overflow-hidden cursor-pointer">
                        <img src="https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=170&fit=crop" alt="영화 <%=i%>" class="w-full h-full object-cover">
                    </div>
                <% } %>
            </div>

            <button class="carousel-nav-btn left absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full left-4 flex items-center justify-center z-10" data-carousel-target=".content-carousel" data-slide-direction="prev">◀</button>
            <button class="carousel-nav-btn right absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full right-4 flex items-center justify-center z-10" data-carousel-target=".content-carousel" data-slide-direction="next">▶</button>
        </div>
    </section>

</main>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const navButtons = document.querySelectorAll('.carousel-nav-btn');
        const scrollAmount = 500; // 한 번 클릭 시 스크롤 이동량 (픽셀)

        navButtons.forEach(button => {
            button.addEventListener('click', function() {
                const targetSelector = this.getAttribute('data-carousel-target');
                const direction = this.getAttribute('data-slide-direction');
                
                const carousel = document.querySelector(targetSelector);
                
                if (!carousel) {
                    console.error('Target carousel not found:', targetSelector);
                    return;
                }

                let newScrollLeft;
                if (direction === 'next') {
                    newScrollLeft = carousel.scrollLeft + scrollAmount;
                } else if (direction === 'prev') {
                    newScrollLeft = carousel.scrollLeft - scrollAmount;
                }

                carousel.scrollTo({
                    left: newScrollLeft,
                    behavior: 'smooth'
                });
            });
        });
    });
</script>

</body>
</html>