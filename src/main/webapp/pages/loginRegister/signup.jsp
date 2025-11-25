<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTD 회원가입</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        .clip-triangle {
            clip-path: polygon(0 0, 100% 50%, 0 100%);
        }
    </style>
</head>
<body class="min-h-screen bg-black text-white">

    <%-- Header --%>
    <%@ include file="../home/header.jsp" %>
            
    <!-- Main Content -->
    <main class="flex items-center justify-center py-12 px-4">
        <div class="w-full max-w-md">
            <h1 class="text-center text-2xl mb-2">OPTD 회원가입</h1>
            <p class="text-center text-gray-400 text-sm mb-8">
                아래대로 이메일로 간편하게 OPTD를 시작해보세요!
            </p>

            <form id="signupForm" class="space-y-4" onsubmit="handleSubmit(event)">
                <!-- 아이디 -->
                <div>
                    <label class="block text-sm mb-2 text-gray-300">아이디</label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="영문 소문자만 입력 가능, 숫자 조합 6~12자리"
                        class="w-full bg-zinc-800 border border-zinc-700 text-white placeholder:text-gray-500 h-11 rounded-md px-3 focus:outline-none focus:ring-2 focus:ring-red-600"
                        oninput="handleUsernameInput(this)"
                        onblur="validateUsername(this)"
                    />
                    <p id="usernameError" class="text-red-500 text-xs mt-1 hidden"></p>
                </div>

                <!-- 비밀번호 -->
                <div>
                    <label class="block text-sm mb-2 text-gray-300">비밀번호</label>
                    <div class="relative">
                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="영문, 숫자, 특수문자(~!@#$%^&*) 조합 8~15 자리"
                            class="w-full bg-zinc-800 border border-zinc-700 text-white placeholder:text-gray-500 h-11 rounded-md px-3 pr-10 focus:outline-none focus:ring-2 focus:ring-red-600"
                            oninput="handlePasswordInput(this)"
                            onblur="validatePassword(this)"
                        />
                        <button
                            type="button"
                            onclick="togglePassword('password', 'passwordIcon')"
                            class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-300"
                        >
                            <i id="passwordIcon" data-lucide="eye" class="w-5 h-5"></i>
                        </button>
                    </div>
                    <p id="passwordError" class="text-red-500 text-xs mt-1 hidden"></p>
                </div>

                <!-- 비밀번호 확인 -->
                <div>
                    <label class="block text-sm mb-2 text-gray-300">비밀번호 확인</label>
                    <div class="relative">
                        <input
                            type="password"
                            id="passwordConfirm"
                            name="passwordConfirm"
                            placeholder="영문, 숫자, 특수문자(~!@#$%^&*) 조합 8~15 자리"
                            class="w-full bg-zinc-800 border border-zinc-700 text-white placeholder:text-gray-500 h-11 rounded-md px-3 pr-10 focus:outline-none focus:ring-2 focus:ring-red-600"
                            oninput="handlePasswordInput(this)"
                            onblur="validatePasswordConfirm(this)"
                        />
                        <button
                            type="button"
                            onclick="togglePassword('passwordConfirm', 'passwordConfirmIcon')"
                            class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-300"
                        >
                            <i id="passwordConfirmIcon" data-lucide="eye" class="w-5 h-5"></i>
                        </button>
                    </div>
                    <p id="passwordConfirmError" class="text-red-500 text-xs mt-1 hidden"></p>
                </div>

                <!-- 이메일 -->
                <div>
                    <label class="block text-sm mb-2 text-gray-300">이메일</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="example@email.com"
                        class="w-full bg-zinc-800 border border-zinc-700 text-white placeholder:text-gray-500 h-11 rounded-md px-3 focus:outline-none focus:ring-2 focus:ring-red-600"
                        onblur="validateEmail(this)"
                    />
                    <p id="emailError" class="text-red-500 text-xs mt-1 hidden"></p>
                </div>

                <!-- 핸드폰 번호 -->
                <div>
                    <label class="block text-sm mb-2 text-gray-300">핸드폰 번호</label>
                    <input
                        type="tel"
                        id="phone"
                        name="phone"
                        placeholder="010-0000-0000"
                        class="w-full bg-zinc-800 border border-zinc-700 text-white placeholder:text-gray-500 h-11 rounded-md px-3 focus:outline-none focus:ring-2 focus:ring-red-600"
                        oninput="handlePhoneInput(this)"
                        onblur="validatePhone(this)"
                    />
                    <p id="phoneError" class="text-red-500 text-xs mt-1 hidden"></p>
                </div>

                <!-- 닉네임 -->
                <div>
                    <label class="block text-sm mb-2 text-gray-300">닉네임</label>
                    <input
                        type="text"
                        id="nickname"
                        name="nickname"
                        placeholder="닉네임을 입력하세요 (3글자 이상)"
                        class="w-full bg-zinc-800 border border-zinc-700 text-white placeholder:text-gray-500 h-11 rounded-md px-3 focus:outline-none focus:ring-2 focus:ring-red-600"
                        onblur="validateNickname(this)"
                    />
                    <p id="nicknameError" class="text-red-500 text-xs mt-1 hidden"></p>
                </div>

                <!-- 프로필 이미지 -->
                <div>
                    <label class="block text-sm mb-2 text-gray-300">프로필 이미지</label>
                    <input type="hidden" id="profileImage" name="profileImage" value="">
                    <div class="grid grid-cols-3 gap-4">
                        <button
                            type="button"
                            onclick="selectProfileImage(this, 'https://images.unsplash.com/photo-1702914954859-f037fc75b760?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwY2F0JTIwcG9ydHJhaXR8ZW58MXx8fHwxNzYzMzAxMjkzfDA&ixlib=rb-4.1.0&q=80&w=1080')"
                            class="profile-option relative aspect-square rounded-full overflow-hidden border-2 border-zinc-700 hover:border-red-600 transition-all bg-zinc-800"
                        >
                            <img
                                src="https://images.unsplash.com/photo-1702914954859-f037fc75b760?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwY2F0JTIwcG9ydHJhaXR8ZW58MXx8fHwxNzYzMzAxMjkzfDA&ixlib=rb-4.1.0&q=80&w=1080"
                                alt="프로필 이미지 1"
                                class="w-full h-full object-cover"
                            />
                        </button>
                        <button
                            type="button"
                            onclick="selectProfileImage(this, 'https://images.unsplash.com/photo-1554235386-82e08c80c3ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwZG9nJTIwcG9ydHJhaXR8ZW58MXx8fHwxNzYzMzA2NTE0fDA&ixlib=rb-4.1.0&q=80&w=1080')"
                            class="profile-option relative aspect-square rounded-full overflow-hidden border-2 border-zinc-700 hover:border-red-600 transition-all bg-zinc-800"
                        >
                            <img
                                src="https://images.unsplash.com/photo-1554235386-82e08c80c3ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwZG9nJTIwcG9ydHJhaXR8ZW58MXx8fHwxNzYzMzA2NTE0fDA&ixlib=rb-4.1.0&q=80&w=1080"
                                alt="프로필 이미지 2"
                                class="w-full h-full object-cover"
                            />
                        </button>
                        <button
                            type="button"
                            onclick="selectProfileImage(this, 'https://images.unsplash.com/photo-1688472977827-c7e446e49efe?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwcmFiYml0JTIwYnVubnl8ZW58MXx8fHwxNzYzMzU1NzQ4fDA&ixlib=rb-4.1.0&q=80&w=1080')"
                            class="profile-option relative aspect-square rounded-full overflow-hidden border-2 border-zinc-700 hover:border-red-600 transition-all bg-zinc-800"
                        >
                            <img
                                src="https://images.unsplash.com/photo-1688472977827-c7e446e49efe?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwcmFiYml0JTIwYnVubnl8ZW58MXx8fHwxNzYzMzU1NzQ4fDA&ixlib=rb-4.1.0&q=80&w=1080"
                                alt="프로필 이미지 3"
                                class="w-full h-full object-cover"
                            />
                        </button>
                    </div>
                </div>

                <!-- 약관 동의 -->
                <div class="space-y-3 pt-4">
                    <div class="flex items-center gap-2">
                        <input
                            type="checkbox"
                            id="all"
                            class="w-4 h-4 rounded border-gray-400 text-white focus:ring-red-600"
                            onchange="handleAllAgreement(this)"
                        />
                        <label for="all" class="text-sm cursor-pointer">
                            모든 약관을 동의 또한 선택항목 동의합니다.
                        </label>
                    </div>

                    <div class="flex items-center gap-2">
                        <input
                            type="checkbox"
                            id="age14"
                            name="age14"
                            class="agreement-checkbox w-4 h-4 rounded border-gray-400 text-white focus:ring-red-600"
                            onchange="checkAllAgreements()"
                        />
                        <label for="age14" class="text-sm cursor-pointer">
                            [필수] 만 14세 이상입니다.
                        </label>
                    </div>

                    <div class="flex items-center justify-between w-full text-sm text-gray-300 hover:text-white">
                        <div class="flex items-center gap-2">
                            <input
                                type="checkbox"
                                id="service"
                                name="service"
                                class="agreement-checkbox w-4 h-4 rounded border-gray-400 text-white focus:ring-red-600"
                                onchange="checkAllAgreements()"
                            />
                            <label for="service" class="cursor-pointer">
                                [필수] 서비스 이용 약관 동의
                            </label>
                        </div>
                        <i data-lucide="chevron-right" class="w-4 h-4"></i>
                    </div>

                    <div class="flex items-center justify-between w-full text-sm text-gray-300 hover:text-white">
                        <div class="flex items-center gap-2">
                            <input
                                type="checkbox"
                                id="privacy"
                                name="privacy"
                                class="agreement-checkbox w-4 h-4 rounded border-gray-400 text-white focus:ring-red-600"
                                onchange="checkAllAgreements()"
                            />
                            <label for="privacy" class="cursor-pointer">
                                [필수] 개인정보 수집 및 이용 동의
                            </label>
                        </div>
                        <i data-lucide="chevron-right" class="w-4 h-4"></i>
                    </div>

                    <div class="flex items-center justify-between w-full text-sm text-gray-300 hover:text-white">
                        <div class="flex items-center gap-2">
                            <input
                                type="checkbox"
                                id="marketing"
                                name="marketing"
                                class="agreement-checkbox w-4 h-4 rounded border-gray-400 text-white focus:ring-red-600"
                                onchange="checkAllAgreements()"
                            />
                            <label for="marketing" class="cursor-pointer">
                                [선택] 마케팅 정보 수신 동의
                            </label>
                        </div>
                        <i data-lucide="chevron-right" class="w-4 h-4"></i>
                    </div>
                </div>

                <!-- 가입하기 버튼 -->
                <button
                    type="submit"
                    id="submitBtn"
                    class="w-full bg-zinc-700 text-white h-11 mt-6 rounded-md hover:bg-zinc-600 transition-colors"
                >
                    가입하기
                </button>
            </form>
        </div>
    </main>

    <%-- Footer  --%>
    <%@ include file="../home/footer.jsp" %>

    <script>
        // Lucide 아이콘 초기화
        lucide.createIcons();

        // 비밀번호 표시/숨김 토글
        function togglePassword(inputId, iconId) {
            const input = document.getElementById(inputId);
            const icon = document.getElementById(iconId);
            
            if (input.type === 'password') {
                input.type = 'text';
                icon.setAttribute('data-lucide', 'eye-off');
            } else {
                input.type = 'password';
                icon.setAttribute('data-lucide', 'eye');
            }
            lucide.createIcons();
        }

        // 아이디 입력 처리
        function handleUsernameInput(input) {
            let value = input.value.toLowerCase().replace(/[^a-z0-9]/g, '').slice(0, 12);
            input.value = value;
            hideError('usernameError');
            input.classList.remove('border-red-500');
        }

        // 비밀번호 입력 처리
        function handlePasswordInput(input) {
            let value = input.value.replace(/[^a-zA-Z0-9~!@#$%^&*]/g, '').slice(0, 15);
            input.value = value;
            hideError(input.id + 'Error');
            input.classList.remove('border-red-500');
        }

        // 전화번호 입력 처리
        function handlePhoneInput(input) {
            const numbers = input.value.replace(/[^0-9]/g, '');
            let formatted = '';
            
            if (numbers.length <= 3) {
                formatted = numbers;
            } else if (numbers.length <= 7) {
                formatted = numbers.slice(0, 3) + '-' + numbers.slice(3);
            } else {
                formatted = numbers.slice(0, 3) + '-' + numbers.slice(3, 7) + '-' + numbers.slice(7, 11);
            }
            
            input.value = formatted;
            hideError('phoneError');
            input.classList.remove('border-red-500');
        }

        // 유효성 검사 함수들
        function isUsernameValid(username) {
            const regex = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,12}$/;
            return regex.test(username);
        }

        function isPasswordValid(password) {
            const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*])[a-zA-Z\d~!@#$%^&*]{8,15}$/;
            return regex.test(password);
        }

        function isEmailValid(email) {
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return regex.test(email);
        }

        function isPhoneValid(콜) {
            const regex = /^010-\d{4}-\d{4}$/;
            return regex.test(콜);
        }

        // 개별 필드 검증
        function validateUsername(input) {
            const value = input.value.trim();
            if (value !== '' && !isUsernameValid(value)) {
                showError('usernameError', '영문 소문자와 숫자 조합 6~12자리를 입력해주세요.');
                input.classList.add('border-red-500');
            }
        }

        function validatePassword(input) {
            const value = input.value.trim();
            if (value !== '' && !isPasswordValid(value)) {
                showError('passwordError', '영문, 숫자, 특수문자(~!@#$%^&*) 조합 8~15자리를 입력해주세요.');
                input.classList.add('border-red-500');
            }
        }

        function validatePasswordConfirm(input) {
            const password = document.getElementById('password').value;
            const value = input.value.trim();
            if (value !== '' && value !== password) {
                showError('passwordConfirmError', '비밀번호가 일치하지 않습니다.');
                input.classList.add('border-red-500');
            }
        }

        function validateEmail(input) {
            const value = input.value.trim();
            if (value !== '' && !isEmailValid(value)) {
                showError('emailError', '올바른 이메일 형식을 입력해주세요.');
                input.classList.add('border-red-500');
            }
        }

        function validatePhone(input) {
            const value = input.value.trim();
            if (value !== '' && !isPhoneValid(value)) {
                showError('phoneError', '010-0000-0000 형식으로 입력해주세요.');
                input.classList.add('border-red-500');
            }
        }

        function validateNickname(input) {
            const value = input.value.trim();
            if (value !== '' && value.length < 3) {
                showError('nicknameError', '닉네임은 3글자 이상 입력해주세요.');
                input.classList.add('border-red-500');
            }
        }

        // 에러 메시지 표시/숨김
        function showError(errorId, message) {
            const errorEl = document.getElementById(errorId);
            errorEl.textContent = message;
            errorEl.classList.remove('hidden');
        }

        function hideError(errorId) {
            const errorEl = document.getElementById(errorId);
            errorEl.classList.add('hidden');
        }

        // 프로필 이미지 선택
        function selectProfileImage(button, imageUrl) {
            // 모든 프로필 옵션에서 선택 상태 제거
            document.querySelectorAll('.profile-option').forEach(opt => {
                opt.classList.remove('border-red-600', 'ring-2', 'ring-red-600');
                const overlay = opt.querySelector('.absolute');
                if (overlay) overlay.remove();
            });
            
            // 선택된 옵션에 스타일 적용
            button.classList.add('border-red-600', 'ring-2', 'ring-red-600');
            
            // 체크마크 오버레이 추가
            const overlay = document.createElement('div');
            overlay.className = 'absolute inset-0 bg-red-600 bg-opacity-20 flex items-center justify-center';
            overlay.innerHTML = `
                <div class="w-6 h-6 bg-red-600 rounded-full flex items-center justify-center">
                    <svg class="w-4 h-4 text-white" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                        <path d="M5 13l4 4L19 7"></path>
                    </svg>
                </div>
            `;
            button.appendChild(overlay);
            
            // hidden input에 이미지 URL 저장
            document.getElementById('profileImage').value = imageUrl;
        }

        // 전체 동의 체크박스 처리
        function handleAllAgreement(checkbox) {
            const isChecked = checkbox.checked;
            document.querySelectorAll('.agreement-checkbox').forEach(cb => {
                cb.checked = isChecked;
            });
            updateSubmitButton();
        }

        // 개별 체크박스 변경 시 전체 동의 체크박스 업데이트
        function checkAllAgreements() {
            const allCheckbox = document.getElementById('all');
            const checkboxes = document.querySelectorAll('.agreement-checkbox');
            const allChecked = Array.from(checkboxes).every(cb => cb.checked);
            allCheckbox.checked = allChecked;
            updateSubmitButton();
        }

        // 제출 버튼 활성화 상태 업데이트
        function updateSubmitButton() {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const passwordConfirm = document.getElementById('passwordConfirm').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;
            const nickname = document.getElementById('nickname').value;
            const age14 = document.getElementById('age14').checked;
            const service = document.getElementById('service').checked;
            const privacy = document.getElementById('privacy').checked;
            
            const isValid = isUsernameValid(username) &&
                           isPasswordValid(password) &&
                           password === passwordConfirm &&
                           passwordConfirm.trim() !== '' &&
                           isEmailValid(email) &&
                           isPhoneValid(콜) &&
                           nickname.trim() !== '' &&
                           nickname.length >= 3 &&
                           age14 && service && privacy;
            
            const submitBtn = document.getElementById('submitBtn');
            if (isValid) {
                submitBtn.classList.remove('hover:bg-zinc-600');
                submitBtn.classList.add('hover:bg-red-600');
            } else {
                submitBtn.classList.remove('hover:bg-red-600');
                submitBtn.classList.add('hover:bg-zinc-600');
            }
        }

        // 모든 입력 필드에 이벤트 리스너 추가
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('input', updateSubmitButton);
            input.addEventListener('blur', updateSubmitButton);
        });

        
        
        // 폼 제출 처리
        function handleSubmit(event) {
            event.preventDefault();
            
            const formData = {
                username: document.getElementById('username').value,
                password: document.getElementById('password').value,
                passwordConfirm: document.getElementById('passwordConfirm').value,
                email: document.getElementById('email').value,
                phone: document.getElementById('phone').value,
                nickname: document.getElementById('nickname').value,
                profileImage: document.getElementById('profileImage').value,
                age14: document.getElementById('age14').checked,
                service: document.getElementById('service').checked,
                privacy: document.getElementById('privacy').checked,
                marketing: document.getElementById('marketing').checked
            };
            
            // 서블릿으로 전송
            fetch('/optd-web/SignUpServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('회원가입이 완료되었습니다!');
                    window.location.href = '/optd-web/pages/loginRegister/signupSuccess.jsp';
                } else {
                    alert('회원가입 실패: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('회원가입 중 오류가 발생했습니다.');
            });
        }
    </script>
</body>
</html>