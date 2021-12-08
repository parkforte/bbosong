<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$('#storeList li').on('click', function() {
			$(this).addClass('active');
			$('#storeList li').not(this).removeClass('active');
			
			changeMap(this);
		});
		
		function changeMap(target) {
			var x = $(target).find('span:eq(0)').html();
			var y = $(target).find('span:eq(1)').html();
			
			showMap(x, y);
		}
	});
</script>
<script type="text/javascript">
	function showMap(x, y) {
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(x, y),
			level: 3
		};
		
		var map = new kakao.maps.Map(container, options);
		var markerPosition  = new kakao.maps.LatLng(x, y); 

		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		marker.setMap(map);
	}
</script>
</head>
<body>
<%

%>
<section class="section_padding">
	<div class="container">
		<div class="mt20 display_map">
			<!-- <div class="seoul">
				<h3>서비스 지역</h3>
				<img src="../img/seoul.png">
			</div> -->
			<div id="storeList">
				<ul>
					<li id="a" class="active">
						<span class="coordinate">37.517525</span><span class="coordinate">127.046369</span>
						<h4>강남지점</h4>
						<p>서울 강남구 선릉로130길 56 1층 4호</p>
						<p>02-111-2222</p>
					</li>
					<li id="b">
						<span class="coordinate">37.484654</span><span class="coordinate">127.032438</span>
						<h4>서초지점</h4>
						<p>서울 서초구 남부순환로 2579 1층</p>
						<p>02-333-4444</p>
					</li>
					<li id="c">
						<span class="coordinate">37.512885</span><span class="coordinate">126.938957</span>
						<h4>동작지점</h4>
						<p>서울 동작구 노량진로 114 지하 1층 12호</p>
						<p>02-555-6666</p>
					</li>
					<li id="d">
						<span class="coordinate">37.515100</span><span class="coordinate">127.107230</span>
						<h4>송파지점</h4>
						<p>서울 송파구 오금로 87 2층</p>
						<p>02-777-8888</p>
					</li>
				</ul>
			</div>
			<div id="map"></div>
			<div id="showMap">
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28f1ff4d42e7380c65ecb41d603da956"></script>
				<script>
					showMap(37.517525, 127.046369);
				</script>
			</div>
		</div>
	</div>
</section>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>