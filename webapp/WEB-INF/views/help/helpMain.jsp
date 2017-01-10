<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<Link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<Link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/help.css">
<title>고객센터</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/includes/header.jsp" />
		</div>

		<div id="wrapper">
			<div id="navigation">
				<c:import url="/WEB-INF/views/includes/navigation.jsp">
					<c:param name="menu" value="help" />
				</c:import>
			</div>
		</div>

		<div id="content">
			<br>
			<!-- 총 리스트 수 -->
			<h2 align="right">
				총 : <fmt:formatNumber value="${helpListCount }" pattern="###,###,###" /> 건
			</h2>
			<br>

			<!-- 고객센터 리스트  -->
			<table class="helptable table">
				<tr>
					<th align="center"> 번 호	</th>
					<th align="center"> 제 목	</th>
					<th align="center"> 작성일	</th>
					<th align="center"> 글쓴이	</th>
				</tr>

				<c:forEach items="${map.list }" var="vo">
					<!-- 주소창 물음표(?)뒤에 값이 붙어오면 get방식 -->
					<tbody onclick="location.href='${pageContext.request.contextPath }/help/view?no=${vo.NO }'">
						<tr>
							<td align="center" width="100"> ${vo.NO}	 	</td>
							<td align="center" width="400"> ${vo.TITLE } 	</td>
							<td align="center" width="100"> ${vo.REGDATE} 	</td>
							<td align="center" width="100"> ${vo.ID }		</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

			<!-- 페이지 구현하려면 필요한 거... -->
			<!-- 12345(pageno) 첫페이지(firstpage), 마지막페이지(lastpage), 한페이지에10개씩(pagesize=5), 전체페이지(allpage), <이전페이지(beforepage), >다음페이지(nextpage) -->
			<div>
			<h3 align="center"> ＜	1	2	3	4	5	＞ </h3>
			
			<c:if test= "">
			</c:if>
			<c:forEach begin="" end="" >
				<c:choose>
					<c:when test="">
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			</div>
			<br>
			<!-- 카테고리 ㆍ 검색 -->
			<div class="dropdown">
				<form id="search_form" action="${pageContext.request.contextPath }/help" method="get" class="navbar-search">
					<select name="searchCondition" onChange="redirect(this.options.selectedIndex)" class="search-query">
						<option value="1"> 전체 </option>
						<option value="2"> 제목 </option>
						<option value="3"> 내용 </option>
					</select> 
					<input type="text" id="kwd" name="searchKeyword" value="" placeholder="검색" class="search-query"> 
					<input type="submit" value="검색" />
				</form>
			</div>
			<br>
		</div>
	</div>

	<div id="footer">
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>

</body>
</html>
