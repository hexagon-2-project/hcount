<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 상단 메뉴의 공통 스타일. 공통 CSS 이후에 읽어 상단 메뉴 크기와 배치를 적용한다. --%>
<style id="hcount-navbar-styles">
:root { -
	-header-h: 56px;
}

.hcount-navbar, .hcount-navbar * {
	box-sizing: border-box;
}

.hcount-navbar {
	display: flex;
	align-items: center;
	flex-wrap: nowrap;
	gap: 20px;
	height: 56px;
	padding: 0 20px;
	background: #f2f5fb;
	border: 0;
	border-bottom: 1px solid #dce2ea;
	box-shadow: 0 2px 6px rgb(16 32 74/ 4%);
	font-family: "Malgun Gothic", "Apple SD Gothic Neo", Arial, sans-serif;
}

.hcount-navbar .hcount-navbar__brand {
	display: flex;
	align-items: center;
	flex: 0 0 auto;
	width: auto;
	padding-right: 24px;
	border-right: 1px solid #dce2ea;
	font-family: Arial, sans-serif;
	font-size: 26px;
	font-style: italic;
	font-weight: 800;
	line-height: 1;
	letter-spacing: -2px;
	text-decoration: none;
}

.hcount-navbar__brand span {
	color: #d42034;
}

.hcount-navbar__brand b {
	color: #666971;
	font-weight: 800;
}

.hcount-navbar .hcount-navbar__menu {
	display: flex;
	align-items: center;
	flex: 1;
	flex-wrap: nowrap;
	gap: 8px;
	min-width: 0;
	height: 100%;
	margin: 0;
	padding: 0;
	overflow-x: auto;
	white-space: nowrap;
}

.hcount-navbar__menu a {
	position: relative;
	display: flex;
	align-items: center;
	flex: 0 0 auto;
	justify-content: center;
	gap: 8px;
	min-width: 120px;
	height: 36px;
	padding: 0 18px;
	background: #edf2fc;
	border: 1px solid #d2dcef;
	border-radius: 0;
	color: #495569;
	font-size: 15px;
	font-weight: 600;
	text-decoration: none;
	transition: background-color .15s, border-color .15s, color .15s;
}

.hcount-navbar__menu a:hover {
	background: #edf2fc;
	border-color: #cbd6ee;
	color: #123397;
}

.hcount-navbar__menu a.active {
	background: #dbe5fb;
	border: 1px solid #aabce4;
	color: #12379c;
	font-weight: 700;
}

.hcount-navbar a:focus-visible {
	outline: 2px solid #1f4be2;
	outline-offset: -2px;
}

@media ( max-width : 760px) {
	.hcount-navbar {
		gap: 12px;
		padding: 0 12px;
	}
	.hcount-navbar .hcount-navbar__brand {
		padding-right: 12px;
		font-size: 24px;
	}
	.hcount-navbar__menu a {
		min-width: 0;
		height: 34px;
		padding: 0 12px;
		font-size: 14px;
	}
}
</style>
