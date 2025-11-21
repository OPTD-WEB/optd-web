<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTD 메인</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        /* 랭킹 숫자 위치 조정 (왼쪽 중앙, 이미지와 살짝 떨어지도록) */
        .rank-number { 
            position: absolute; 
            top: 50%; 
            left: -20px; /* 이미지 왼쪽에서 살짝 떨어진 거리 */
            transform: translateY(-50%); 
            z-index: 30; 
            height: 100px; 
            width: 80px; 
            display: flex;
            align-items: center;
            justify-content: flex-start;
        }
        .rank-number span { 
            font-size: 80px; 
            font-weight: 900; 
            line-height: 1; 
            color: white; 
            margin-left: 20px; /* 숫자와 이미지 간 간격 */
        }

        /* 스크롤 캐러셀 */
        .hero-carousel, .ranking-carousel, .content-carousel {
            scroll-behavior: smooth;
            overflow-x: scroll;
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
        .hero-carousel::-webkit-scrollbar, .ranking-carousel::-webkit-scrollbar, .content-carousel::-webkit-scrollbar {
            display: none;
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
            <div id="heroCarousel" class="hero-carousel flex gap-4 h-[600px]"></div>

            <button class="carousel-nav-btn left absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full left-4 flex items-center justify-center z-10" data-carousel-target="#heroCarousel" data-slide-direction="prev">◀</button>
            <button class="carousel-nav-btn right absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full right-4 flex items-center justify-center z-10" data-carousel-target="#heroCarousel" data-slide-direction="next">▶</button>
        </div>
    </section>

    <section class="section ranking-section px-4 py-12 max-w-[1920px] mx-auto">
        <div class="section-header flex justify-between items-center mb-4 mt-8">
            <h2 class="text-[28px] lg:text-[28px] font-bold">이번 주 인기작 TOP 20</h2>
        </div>

        <div class="ranking-carousel-wrapper relative w-full">
            <div id="rankingCarousel" class="ranking-carousel grid grid-rows-2 grid-flow-col gap-4 px-2 h-[600px]"></div>

            <button class="carousel-nav-btn left absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full left-4 flex items-center justify-center z-10" data-carousel-target="#rankingCarousel" data-slide-direction="prev">◀</button>
            <button class="carousel-nav-btn right absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full right-4 flex items-center justify-center z-10" data-carousel-target="#rankingCarousel" data-slide-direction="next">▶</button>
        </div>
    </section>

    <section class="section content-section px-4 py-12 max-w-[1920px] mx-auto">
        <div class="section-header flex justify-between items-center mb-4 mt-8">
            <h2 class="text-[28px] lg:text-[28px] font-bold">추천 컨텐츠</h2>
        </div>

        <div class="content-carousel-wrapper relative w-full">
            <div id="contentCarousel" class="content-carousel flex gap-4"></div>

            <button class="carousel-nav-btn left absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full left-4 flex items-center justify-center z-10" data-carousel-target="#contentCarousel" data-slide-direction="prev">◀</button>
            <button class="carousel-nav-btn right absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] rounded-full right-4 flex items-center justify-center z-10" data-carousel-target="#contentCarousel" data-slide-direction="next">▶</button>
        </div>
    </section>

</main>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const carouselNavButtons = document.querySelectorAll('.carousel-nav-btn');
    const scrollAmount = 500;

    carouselNavButtons.forEach(button => {
        button.addEventListener('click', function() {
            const targetSelector = this.getAttribute('data-carousel-target');
            const direction = this.getAttribute('data-slide-direction');
            const carousel = document.querySelector(targetSelector);
            if (!carousel) return;

            const newScrollLeft = direction === 'next' 
                ? carousel.scrollLeft + scrollAmount 
                : carousel.scrollLeft - scrollAmount;

            carousel.scrollTo({ left: newScrollLeft, behavior: 'smooth' });
        });
    });

    const API_URL = '/optd-web/api/main';

    async function fetchAndRenderContents() {
        try {
            const response = await fetch(API_URL);
            if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
            const data = await response.json();

            renderTop7(data.top7 || []);
            renderTop20(data.top20 || []);
            renderRecommendations(data.recommendations || []);
        } catch (error) {
            console.error('콘텐츠 불러오기 실패:', error);
            document.getElementById('heroCarousel').innerHTML = '<p class="text-red-500 p-4">콘텐츠를 불러오는 데 실패했습니다. (TOP 7)</p>';
            document.getElementById('rankingCarousel').innerHTML = '<p class="text-red-500 p-4">콘텐츠를 불러오는 데 실패했습니다. (TOP 20)</p>';
            document.getElementById('contentCarousel').innerHTML = '<p class="text-red-500 p-4">콘텐츠를 불러오는 데 실패했습니다. (추천)</p>';
        }
    }

    function renderTop7(contents) {
        const container = document.getElementById('heroCarousel');
        container.innerHTML = '';

        if (!contents || contents.length === 0) {
            container.innerHTML = '<p class="text-gray-400 p-4">오늘의 TOP 7 콘텐츠가 없습니다.</p>';
            return;
        }

        contents.forEach(content => {
            const imgUrl = content.imageUrl || 'https://via.placeholder.com/400x600?text=No+Image';

            const card = document.createElement('div');
            card.className = 'hero-card relative min-w-[400px] h-[600px] rounded-xl overflow-hidden cursor-pointer hover:scale-[1.02] transition-transform duration-300';

            const img = document.createElement('img');
            img.src = imgUrl;
            img.alt = content.title;
            img.className = 'w-full h-full object-cover';

            const overlay = document.createElement('div');
            overlay.className = 'absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-black/80 via-transparent to-transparent';

            const title = document.createElement('h3');
            title.className = 'absolute bottom-4 left-4 text-lg font-medium z-30';
            title.textContent = content.title;

            card.append(img, overlay, title);
            container.appendChild(card);
        });
    }

    function renderTop20(contents) {
        const container = document.getElementById('rankingCarousel');
        container.innerHTML = '';
        const cardWidth = 240;
        const cardHeight = 280;

        if (!contents || contents.length === 0) {
            container.innerHTML = '<p class="text-gray-400 p-4 col-span-full">이번주 TOP 20 콘텐츠가 없습니다.</p>';
            return;
        }

        contents.forEach((content, index) => {
            const rank = index + 1;
            const url = content.imageUrl || `https://via.placeholder.com/${cardWidth}x${cardHeight}?text=No+Image`;
            const title = content.title;

            const card = document.createElement('div');
            card.className = `ranking-card relative min-w-[${cardWidth}px] h-[${cardHeight}px] rounded-xl overflow-hidden cursor-pointer hover:scale-[1.02] transition-transform duration-300`;

            // 숫자
            const rankNumber = document.createElement('div');
            rankNumber.className = 'rank-number';
            rankNumber.innerHTML = `<span>${rank}</span>`;

            const img = document.createElement('img');
            img.src = url;
            img.alt = `Rank ${rank}`;
            img.style.width = cardWidth + 'px';
            img.style.height = cardHeight + 'px';
            img.style.objectFit = 'cover';
            img.className = 'rounded-xl';

            const overlay = document.createElement('div');
            overlay.className = 'absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-black/80 via-transparent to-transparent';

            const titleElem = document.createElement('div');
            titleElem.className = 'absolute bottom-4 left-4 text-sm font-medium text-white z-40 max-w-[80%] truncate';
            titleElem.textContent = title;

            card.append(img, overlay, rankNumber, titleElem);
            container.appendChild(card);
        });
    }

    function renderRecommendations(contents) {
        const container = document.getElementById('contentCarousel');
        container.innerHTML = '';
        const defaultWidth = 400;
        const defaultHeight = 600;

        if (!contents || contents.length === 0) {
            container.innerHTML = '<p class="text-gray-400 p-4">추천 콘텐츠가 없습니다.</p>';
            return;
        }

        contents.forEach(content => {
            const url = content.imageUrl || `https://via.placeholder.com/${defaultWidth}x${defaultHeight}?text=No+Image`;
            const title = content.title;

            const card = document.createElement('div');
            card.className = `content-card relative min-w-[${defaultWidth}px] h-[${defaultHeight}px] rounded-xl overflow-hidden cursor-pointer hover:scale-[1.02] transition-transform duration-300`;

            const img = document.createElement('img');
            img.src = url;
            img.alt = content.title;
            img.className = 'w-full h-full object-cover';

            const overlay = document.createElement('div');
            overlay.className = 'absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-black/80 via-transparent to-transparent';

            const titleElem = document.createElement('h3');
            titleElem.className = 'absolute bottom-4 left-4 text-lg font-medium z-30';
            titleElem.textContent = title;

            card.append(img, overlay, titleElem);
            container.appendChild(card);
        });
    }

    fetchAndRenderContents();
});
</script>

</body>
</html>
