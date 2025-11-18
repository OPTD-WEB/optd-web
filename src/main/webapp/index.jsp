<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTD - 스트리밍 서비스</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        /* 커스텀 폰트 및 글로벌 스타일 유지 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', 'Noto Sans KR', sans-serif;
            overflow-x: hidden;
        }

        /* 랭킹 번호에 대한 커스텀 CSS 유지 */
        .rank-number span {
            position: absolute;
            font-size: 23px;
            line-height: 23px;
            letter-spacing: -0.1011px;
            font-family: 'Inter', sans-serif;
        }

        .rank-blur-1 {
            color: #fb2c36;
            opacity: 0.7;
            filter: blur(4px);
            left: 0;
            top: 0;
        }

        .rank-blur-2 {
            color: #fb2c36;
            opacity: 0.5;
            filter: blur(8px);
            left: 2px;
            top: 2px;
        }

        .rank-blur-3 {
            color: #fb2c36;
            opacity: 0.3;
            filter: blur(12px);
            left: 4px;
            top: 4px;
        }

        .rank-main {
            color: white;
            text-shadow: 0px 4px 8px rgba(0, 0, 0, 0.15);
            left: 0;
            top: 0;
        }

        /* 스크롤바 숨기기 */
        .hero-carousel, .content-carousel {
            scrollbar-width: none; /* Firefox */
            -ms-overflow-style: none;  /* IE and Edge */
        }
        .hero-carousel::-webkit-scrollbar, .content-carousel::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera */
        }

        /* Tailwind 컨피그 확장 */
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'black': '#000000',
                        'red-primary': '#e7000b',
                        'gray-dark': '#101828',
                        'gray-medium': '#1e2939',
                        'gray-light': '#2a3847',
                    },
                    spacing: {
                        '61px': '61px',
                    }
                },
            }
        }
    </style>
</head>
<body class="bg-black text-white">
    <div class="homepage relative w-full h-full">
        <div class="app bg-black flex flex-col w-full min-h-screen">
            
            <%-- Header --%>
            <%@ include file="./pages/home/header.jsp" %>
            
            <%-- Main Content --%>
            <%@ include file="./pages/home/mainContent.jsp" %>

            <%-- Footer  --%>
            <%@ include file="./pages/home/footer.jsp" %>

        </div>
    </div>
</body>
</html>