<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script type= "text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
			<link rel="stylesheet" type = "text/css" href ="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
			<script type= "text/javascript" src ="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	<style>
		.mailWrite{
			width:100%;
			height:2000px;
			border:solid 1px black;
			float:left;
		}
	</style>
	<script type="text/javascript">
		function checkForm() {
			var result=true;
			$(".error").text("");
			
			if($("#searchfrom_address").val()==""){
				$("#fromaddressError").text("*보내는 사람주소를 입력하세요.");
				result = false;
			}
			if($("#toaddress").val()==""){
				$("#toaddressError").text("*받는 사람주소를 입력하세요");
				result = false;
			}
			if($("#fromname").val()==""){
				$("#fromnameError").text("*보내는 사람이름을 입력하세요");
				result = false;
			}
			if($("#toname").val()==""){
				$("#tonameError").text("*받는 사람이름을 입력하세요");
				result = false;
			}
			if($("#mailweight").val()==""){
				$("#mailweightError").text("*우편무게를 입력하세요");
				result = false;
			}
			if($("#mailweight").val()==""){
				$("#mailweightError").text("*우편무게를 입력하세요");
				result = false;
			}
			if($("#mailweight").val()==""){
				$("#mailweightError").text("*우편무게를 입력하세요");
				result = false;
			}
			if($("#mailweight").val()==""){
				$("#mailweightError").text("*우편무게를 입력하세요");
				result = false;
			}
			return result;
		}
	</script>

	<!-- 도로명 주소 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 API KEY를 사용하세요&libraries=services"></script>
	<script>
	    function searchfromaddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("searchfrom_address").value = addr;
	            }
	        }).open();
	    }
	</script>
	<script>
	    function searchtoaddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("searchto_address").value = addr;
	            }
	        }).open();
	    }
	</script>

	</head>
	<body>
	<div class="mailWrite">
		<form id="mailWrite" name="answer" method="post" action="requestanswer" onsubmit="return checkForm()">
		 <div class="form-group">
		    <!-- 메일 고유 값 -->
		    <input type="hidden" class="form-control" id="mail_id" name="mail_id" value="${num}" >
		  </div>
		   <div class="form-group">
		    <label for="formGroupExampleInput">보내는 사람 이름</label>
		    <input type="text" class="form-control" id="from_name" name="from_name" placeholder="보내는 이름을 입력하세요">
		  	<span id="fromnameError" class="error" style="color:red">${fromnameError}</span>
		  </div>
		  <div class="form-group">
		  
		    <label for="formGroupExampleInput2">보내는 사람 주소</label><br>
		    <input type="text" id="searchfrom_address" placeholder="주소 검색" name="from_address" style="width:300px" onfocus="this.blur()">
		    <input type="text" id="searchfrom_address" placeholder="상세주소 입력" name="from_address" style="width:200px">
			<input type="button" onclick="searchfromaddress()" value="주소 검색"><br>
			<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		    <!-- <input type="text" class="form-control" name="from_address" id="from_address" placeholder="받는 사람이름을 입력하세요"> -->
		    <span id="fromaddressError" class="error" style="color:red">${fromaddressError}</span>
		  </div>
		 
		  <div class="form-group">
		    <label for="formGroupExampleInput2">받는 사람이름</label>
		    <input type="text" class="form-control" name="to_name" id="to_name" placeholder="보내는 사람주소를 입력하세요">
		    <span id="tonameError" class="error" style="color:red">${tonameError}</span>
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">받는 사람주소</label><br>
		    <input type="text" id="searchto_address" placeholder="주소 검색" name="to_address" style="width:300px" onfocus="this.blur()">
		    <input type="text" id="searchto_address" placeholder="상세주소 입력" name="to_address" style="width:200px">
			<input type="button" onclick="searchtoaddress()" value="주소 검색"><br>
		    <!-- <input type="text" class="form-control" name="to_address" id="to_address" placeholder="받는 사람주소 입력하세요"> -->
		    <span id="toaddressError" class="error" style="color:red">${toaddressError}</span>
		  </div>
		  <div class="form-group">
		    <label for="formGroupExampleInput2">마을 이름</label>
		    
		    <input type="text" class="form-control" name="vname" id="vname" value="${vmid }">
		    <span id="villagenameError" class="error" style="color:red">${villagenameError}</span>
		  </div>
		   <div class="form-group">
		    <label for="formGroupExampleInput">우편물 무게</label>
		    <input type="text" class="form-control" name="mail_weight" id="mail_weight" placeholder="우편물 무게를 입력하세요" >
		  	<span id="mailweightError" class="error" style="color:red">${mailweightError}</span>
		  </div>
		  <div class="form-group">
		    <!-- 배송 상태전달값 -->
		    <input type="hidden" class="form-control" name="state_id" id="state_name" value="${state_id }">
		  	<span id="stateError" class="error" style="color:red">${stateError}</span>
		  </div>
		  <button class="btn btn-danger">요청 저장</button>
		</form>
	</div>
	</body>
</html>