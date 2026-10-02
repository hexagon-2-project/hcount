<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 모든 화면에서 jsp:include로 사용하는 상단 메뉴. param.module로 현재 메뉴를 표시한다. --%>
<header class="global-header hcount-navbar">
	<a class="ecount-logo hcount-navbar__brand"
		href="${pageContext.request.contextPath}/" aria-label="HCOUNT 홈"><span>HC</span><b>OUNT</b></a>
	<nav class="global-nav hcount-navbar__menu" aria-label="주요 메뉴">
		<a class="${param.module eq 'basic' ? 'active' : ''}"
			data-module="basic" href="${pageContext.request.contextPath}/">기초등록</a>
		<a class="${param.module eq 'sales' ? 'active' : ''}"
			data-module="sales"
			href="${pageContext.request.contextPath}/sale/sale-input">영업관리</a>
	</nav>
</header>
