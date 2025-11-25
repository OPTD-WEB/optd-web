<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTD 로그인</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Noto+Sans+KR:wght@400;500;700&display=swap');
        
        body {
            font-family: 'Inter', 'Noto Sans KR', sans-serif;
        }
    </style>
</head>
<body class="min-h-screen bg-black text-white">

    <%-- Header --%>
    <%@ include file="../home/header.jsp" %>
            
    <!-- Main Content -->
    <main class="flex items-center justify-center py-12 px-4">
        <div class="w-full max-w-md">
            <!-- Title -->
            <h1 class="font-['Inter:Bold','Noto_Sans_KR:Bold',sans-serif] text-white text-center mb-12 text-[40px]">OPTD 로그인</h1>

            <!-- Login Form -->
            <form action="loginProcess.jsp" method="POST" class="flex flex-col" id="loginForm">
                <!-- ID Input -->
                <div class="relative mb-3">
                    <input
                        type="text"
                        name="userId"
                        id="userId"
                        placeholder="아이디"
                        class="w-full h-[60px] bg-[#191919] rounded-[10px] px-5 font-['Inter:Medium','Noto_Sans_KR:Medium',sans-serif] text-[#afafaf] text-[15px] outline-none focus:ring-2 focus:ring-gray-600 transition-all"
                        required
                    />
                </div>

                <!-- Password Input -->
                <div class="relative mb-4">
                    <input
                        type="password"
                        name="userPassword"
                        id="userPassword"
                        placeholder="비밀번호"
                        class="w-full h-[60px] bg-[#191919] rounded-[10px] px-5 font-['Inter:Medium','Noto_Sans_KR:Medium',sans-serif] text-[#afafaf] text-[15px] outline-none focus:ring-2 focus:ring-gray-600 transition-all"
                        required
                    />
                </div>

                <!-- Auto Login Checkbox -->
                <div class="flex items-center gap-3 mb-6 cursor-pointer" id="autoLoginWrapper">
                    <input type="hidden" name="autoLogin" id="autoLoginValue" value="false" />
                    <div class="relative w-[22px] h-[22px] flex-shrink-0">
                        <svg class="block size-full" fill="none" preserveAspectRatio="none" viewBox="0 0 22 22">
                            <circle cx="11" cy="11" fill="#404040" r="11" />
                        </svg>
                        <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[11px] h-[10px] hidden" id="checkmark">
                            <svg class="block size-full" fill="none" preserveAspectRatio="none" viewBox="0 0 11 10">
                                <path d="M3.79408 9.05193L0 4.7612L0.948519 3.68852L3.79408 6.90657L9.90121 0L10.8497 1.07268L3.79408 9.05193Z" fill="white" />
                            </svg>
                        </div>
                    </div>
                    <label class="font-['Inter:Medium','Noto_Sans_KR:Medium',sans-serif] text-[#afafaf] text-[15px] cursor-pointer select-none">
                        자동 로그인
                    </label>
                </div>

                <!-- Login Button -->
                <button 
                    type="submit"
                    class="w-full h-[52px] bg-neutral-700 hover:bg-[#8D2622] rounded-[10px] font-['Inter:Medium','Noto_Sans_KR:Medium',sans-serif] text-[#afafaf] hover:text-white text-[15px] transition-all duration-300 mb-8"
                >
                    로그인하기
                </button>

                <!-- Links: Find ID/PW, Signup -->
                <div class="flex items-center justify-center gap-5">
                    <a href="findId.jsp" class="font-['Inter:Bold','Noto_Sans_KR:Bold',sans-serif] text-white text-[13px] hover:opacity-80 transition-opacity">
                        아이디 찾기
                    </a>
                    <div class="w-[1px] h-[12px] bg-white opacity-50"></div>
                    <a href="findPassword.jsp" class="font-['Inter:Bold','Noto_Sans_KR:Bold',sans-serif] text-white text-[13px] hover:opacity-80 transition-opacity">
                        비밀번호 찾기
                    </a>
                    <div class="w-[1px] h-[12px] bg-white opacity-50"></div>
                    <a href="signup.jsp" class="font-['Inter:Bold','Noto_Sans_KR:Bold',sans-serif] text-white text-[13px] hover:opacity-80 transition-opacity">
                        회원가입
                    </a>
                </div>
            </form>
        </div>
    </main>

    <%-- Footer  --%>
    <%@ include file="../home/footer.jsp" %>

    <!-- JavaScript -->
    <script>
        // Auto Login Checkbox Toggle
        let autoLoginChecked = false;
        const autoLoginWrapper = document.getElementById('autoLoginWrapper');
        const checkmark = document.getElementById('checkmark');
        const autoLoginValue = document.getElementById('autoLoginValue');

        autoLoginWrapper.addEventListener('click', function() {
            autoLoginChecked = !autoLoginChecked;
            
            if (autoLoginChecked) {
                checkmark.classList.remove('hidden');
                autoLoginValue.value = 'true';
            } else {
                checkmark.classList.add('hidden');
                autoLoginValue.value = 'false';
            }
        });

        // Form Submission
        function handleSubmit(event) {
            event.preventDefault();
            
            const userId = document.getElementById('userId').value.trim();
            const userPassword = document.getElementById('userPassword').value.trim();
            
            if (!userId || !userPassword) {
                alert('아이디와 비밀번호를 모두 입력해주세요.');
                return false;
            }
            
            const formData = {
                userId: userId,
                userPassword: userPassword,
                autoLogin: autoLoginChecked
            };
            
            // 서블릿으로 전송
            fetch('/optd-web/LoginServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('로그인 성공!');
                    window.location.href = '/home';
                } else {
                    alert('로그인 실패: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('로그인 중 오류가 발생했습니다.');
            });
        }

        // Form 제출 이벤트 리스너
        document.getElementById('loginForm').addEventListener('submit', handleSubmit);

        // Auto-focus on first input
        window.addEventListener('load', function() {
            document.getElementById('userId').focus();
        });

        // Enter key navigation
        document.getElementById('userId').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                document.getElementById('userPassword').focus();
            }
        });
    </script>
</body>
</html>