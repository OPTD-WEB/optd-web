<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main class="main-content flex-1 p-0">
    
    <!-- 오늘의 TOP -->
    <section class="section hero-section relative px-4 py-6 max-w-[1920px] mx-auto sm:px-4 sm:py-6 lg:px-4 lg:py-6">
        <div class="section-header flex justify-between items-center mb-4">
            <h2 class="text-[24px] sm:text-[28px] lg:text-[36px] font-bold tracking-[0.3418px] leading-[32px] sm:leading-[40px] lg:leading-[62.5px]">오늘의 TOP</h2>
            <!-- <div class="carousel-controls flex gap-2">
                <button class="control-btn w-8 h-8 bg-[#1e2939] border-none rounded-full text-white cursor-pointer flex items-center justify-center text-sm transition-colors duration-300 hover:bg-[#2a3847]">←</button>
                <button class="control-btn w-8 h-8 bg-[#1e2939] border-none rounded-full text-white cursor-pointer flex items-center justify-center text-sm transition-colors duration-300 hover:bg-[#2a3847">→</button>
            </div> -->
        </div>
        
        <!--가로 슬라이드 + 내부 버 -->
        <div class="hero-carousel-wrapper relative w-full overflow-hidden">
            <div class="hero-carousel flex gap-4 h-[400px] overflow-x-auto scroll-smooth">
                <div class="hero-card relative min-w-[250px] sm:min-w-[300px] md:min-w-[400px] lg:min-w-[600px] h-[300px] sm:h-[300px] md:h-[380px] lg:h-[380px] rounded-xl overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.02]">
                    <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=600&h=380&fit=crop" alt="The Last Kingdom" class="w-full h-full object-cover">
                    <div class="hero-card-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.8)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
                    <h3 class="hero-card-title absolute bottom-4 left-4 text-lg font-medium tracking-[-0.4395px] leading-7 z-10">The Last Kingdom</h3>
                </div>
                <div class="hero-card relative min-w-[250px] sm:min-w-[300px] md:min-w-[400px] lg:min-w-[600px] h-[300px] sm:h-[300px] md:h-[380px] lg:h-[380px] rounded-xl overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.02]">
                    <img src="https://images.unsplash.com/photo-1485846234645-a62644f84728?w=600&h=380&fit=crop" alt="Stranger Things" class="w-full h-full object-cover">
                    <div class="hero-card-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.8)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
                    <h3 class="hero-card-title absolute bottom-4 left-4 text-lg font-medium tracking-[-0.4395px] leading-7 z-10">Stranger Things</h3>
                </div>
                <div class="hero-card relative min-w-[250px] sm:min-w-[300px] md:min-w-[400px] lg:min-w-[600px] h-[300px] sm:h-[300px] md:h-[380px] lg:h-[380px] rounded-xl overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.02]">
                    <img src="https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=600&h=380&fit=crop" alt="The Crown" class="w-full h-full object-cover">
                    <div class="hero-card-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.8)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
                    <h3 class="hero-card-title absolute bottom-4 left-4 text-lg font-medium tracking-[-0.4395px] leading-7 z-10">The Crown</h3>
                </div>
                <div class="hero-card relative min-w-[250px] sm:min-w-[300px] md:min-w-[400px] lg:min-w-[600px] h-[300px] sm:h-[300px] md:h-[380px] lg:h-[380px] rounded-xl overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.02]">
                    <img src="https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=600&h=380&fit=crop" alt="Dark Waters" class="w-full h-full object-cover">
                    <div class="hero-card-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.8)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
                    <h3 class="hero-card-title absolute bottom-4 left-4 text-lg font-medium tracking-[-0.4395px] leading-7 z-10">Dark Waters</h3>
                </div>
                <div class="hero-card relative min-w-[250px] sm:min-w-[300px] md:min-w-[400px] lg:min-w-[600px] h-[300px] sm:h-[300px] md:h-[380px] lg:h-[380px] rounded-xl overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.02]">
                    <img src="https://images.unsplash.com/photo-1446776653964-20c1d3a81b06?w=600&h=380&fit=crop" alt="Modern Space" class="w-full h-full object-cover">
                    <div class="hero-card-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.8)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
                    <h3 class="hero-card-title absolute bottom-4 left-4 text-lg font-medium tracking-[-0.4395px] leading-7 z-10">Modern Space</h3>
                </div>
                <div class="hero-card relative min-w-[250px] sm:min-w-[300px] md:min-w-[400px] lg:min-w-[600px] h-[300px] sm:h-[300px] md:h-[380px] lg:h-[380px] rounded-xl overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.02]">
                    <img src="https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=600&h=380&fit=crop" alt="Portal" class="w-full h-full object-cover">
                    <div class="hero-card-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.8)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
                    <h3 class="hero-card-title absolute bottom-4 left-4 text-lg font-medium tracking-[-0.4395px] leading-7 z-10">Portal</h3>
                </div>
            </div>
            
            
            <button class="carousel-nav-btn left absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] border-none rounded-full text-white cursor-pointer flex items-center justify-center transition-colors duration-300 hover:bg-[rgba(0,0,0,0.7)] z-10 left-4">
                <svg class="w-6 h-6" viewBox="0 0 8 14" fill="none">
                    <path d="M7 13L1 7L7 1" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
            <button class="carousel-nav-btn right absolute top-1/2 -translate-y-1/2 w-10 h-10 bg-[rgba(0,0,0,0.5)] border-none rounded-full text-white cursor-pointer flex items-center justify-center transition-colors duration-300 hover:bg-[rgba(0,0,0,0.7)] z-10 right-4">
                <svg class="w-6 h-6" viewBox="0 0 8 14" fill="none">
                    <path d="M1 13L7 7L1 1" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
        </div>
    </section>
    
    <!-- 이번주 TOP 20 -->
	<section class="section ranking-section px-4 py-12 max-w-[1920px] mx-auto sm:px-4 lg:px-4">
	    <div class="section-header flex justify-between items-center mb-4">
	        <h2 class="text-[24px] sm:text-[28px] lg:text-[36px] font-bold tracking-[0.3418px] leading-[32px] sm:leading-[40px] lg:leading-[62.5px]">
	            이번주 TOP 20
	        </h2>

	        <!--버튼 미구현  -->
	        <!-- 
	        <div class="carousel-controls flex gap-2">
	            <button class="control-btn w-8 h-8 bg-[#1e2939] border-none rounded-full text-white cursor-pointer flex items-center justify-center text-sm transition-colors duration-300 hover:bg-[#2a3847]">←</button>
	            <button class="control-btn w-8 h-8 bg-[#1e2939] border-none rounded-full text-white cursor-pointer flex items-center justify-center text-sm transition-colors duration-300 hover:bg-[#2a3847">→</button>
	        </div> 
	        -->
	    </div>

	    <div class="ranking-carousel-wrapper w-full overflow-x-auto scroll-smooth whitespace-nowrap">
	        <div class="ranking-carousel grid grid-rows-3 grid-flow-col gap-6 px-2">
	        
	        
	            <div class="ranking-card relative w-[300px] h-[160px] rounded-xl overflow-hidden shadow-2xl shadow-[rgba(0,0,0,0.25)] cursor-pointer flex-shrink-0 transition-transform duration-300 hover:-translate-y-1">
	                <div class="rank-number absolute top-[73.5px] left-0 z-10">
	                    <span class="rank-blur-1">1</span>
	                    <span class="rank-blur-2">1</span>
	                    <span class="rank-blur-3">1</span>
	                    <span class="rank-main">1</span>
	                </div>
	                <img 
	                    src="https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=170&fit=crop" 
	                    alt="Rank 1" 
	                    class="w-full h-full object-cover"
	                >
	                <div class="ranking-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.6)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
	            </div>

	            <div class="ranking-card relative w-[300px] h-[160px] rounded-xl overflow-hidden shadow-2xl shadow-[rgba(0,0,0,0.25)] cursor-pointer flex-shrink-0 transition-transform duration-300 hover:-translate-y-1">
	                <div class="rank-number absolute top-[73.5px] left-0 z-10">
	                    <span class="rank-blur-1">1</span>
	                    <span class="rank-blur-2">1</span>
	                    <span class="rank-blur-3">1</span>
	                    <span class="rank-main">1</span>
	                </div>
	                <img 
	                    src="https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=170&fit=crop" 
	                    alt="Rank 1" 
	                    class="w-full h-full object-cover"
	                >
	                <div class="ranking-overlay absolute bottom-0 left-0 right-0 h-full bg-gradient-to-t from-[rgba(0,0,0,0.6)] via-[rgba(0,0,0,0)] to-[rgba(0,0,0,0)]"></div>
	            </div>

	        </div>
	    </div>
	</section>
    
    <!-- 슬라이드1 -->
    <section class="section content-section px-4 py-12 max-w-[1920px] mx-auto sm:px-4 lg:px-4">
        <div class="section-header flex justify-between items-center mb-4">
            <h2 class="text-[24px] sm:text-[28px] lg:text-[36px] font-bold tracking-[0.3418px] leading-[32px] sm:leading-[40px] lg:leading-[62.5px]">슬라이드</h2>
            <!-- <div class="carousel-controls flex gap-2">
                <button class="control-btn w-8 h-8 bg-[#1e2939] border-none rounded-full text-white cursor-pointer flex items-center justify-center text-sm transition-colors duration-300 hover:bg-[#2a3847]">←</button>
                <button class="control-btn w-8 h-8 bg-[#1e2939] border-none rounded-full text-white cursor-pointer flex items-center justify-center text-sm transition-colors duration-300 hover:bg-[#2a3847">→</button>
            </div> -->
        </div>
        <div class="content-carousel flex gap-4 overflow-x-auto scroll-smooth pb-[10px]">
            <div class="content-card min-w-[150px] sm:min-w-[180px] md:min-w-[240px] h-[225px] sm:h-[270px] md:h-[360px] rounded-lg overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.05]">
                <img src="https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=240&h=360&fit=crop" alt="영화 1" class="w-full h-full object-cover">
            </div>
            <div class="content-card min-w-[150px] sm:min-w-[180px] md:min-w-[240px] h-[225px] sm:h-[270px] md:h-[360px] rounded-lg overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.05]">
                <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=240&h=360&fit=crop" alt="영화 2" class="w-full h-full object-cover">
            </div>
            <div class="content-card min-w-[150px] sm:min-w-[180px] md:min-w-[240px] h-[225px] sm:h-[270px] md:h-[360px] rounded-lg overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.05]">
                <img src="https://images.unsplash.com/photo-1485846234645-a62644f84728?w=240&h=360&fit=crop" alt="영화 3" class="w-full h-full object-cover">
            </div>
            <div class="content-card min-w-[150px] sm:min-w-[180px] md:min-w-[240px] h-[225px] sm:h-[270px] md:h-[360px] rounded-lg overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.05]">
                <img src="https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=240&h=360&fit=crop" alt="영화 4" class="w-full h-full object-cover">
            </div>
            <div class="content-card min-w-[150px] sm:min-w-[180px] md:min-w-[240px] h-[225px] sm:h-[270px] md:h-[360px] rounded-lg overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.05]">
                <img src="https://images.unsplash.com/photo-1446776653964-20c1d3a81b06?w=240&h=360&fit=crop" alt="영화 5" class="w-full h-full object-cover">
            </div>
            <div class="content-card min-w-[150px] sm:min-w-[180px] md:min-w-[240px] h-[225px] sm:h-[270px] md:h-[360px] rounded-lg overflow-hidden cursor-pointer transition-transform duration-300 hover:scale-[1.05]">
                <img src="https://images.unsplash.com/photo-1446776653964-20c1d3a81b06?w=240&h=360&fit=crop" alt="영화 5" class="w-full h-full object-cover">
            </div>
        </div>
    </section>

</main>