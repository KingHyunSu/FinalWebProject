<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/packaging.css">

   <script type="text/javascript"
      src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css"
      href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
   <script type="text/javascript"
      src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css" rel="stylesheet">

<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>

<script type="text/javascript">
   
   //이기능
   function weight_check(){
      
      var total = [];
      var check = 0;
      
      $('input:checkbox:checked').each(function(){
         total.push(parseInt($(this).attr('value')));
      });
      
      total_weight = 0;
      
      for(var i = 0; i < total.length; i++){
         total_weight += total[i];
      }
   
      $("#total_weight").text(total_weight+'g');
      console.log($("#total_weight").text());
   }
   
   function Auto_weight_check(){
         //if($("#chk_auto").prop("checked")){
            //if(parseInt($("input[name='chk_auto']:checked")) < parseInt($("#total_weight"))){
               var len = $(("#mailTable tr").length)-1;
               for(var i = 0; i < len; i++) {
                  $("#chk"+i).prop("checked",true);
               }
            //}
         //}
         
         //if{
         //   $("#chk").prop("checked",false);
         //}
   }
   
   function packaging(){
      var Array = [];
      
      $('input:checkbox:checked').each(function(){
         check = $(this).attr('name');
         Array.push(check);
      });
      
      for(var i= 0; i < Array.length; i++){
         console.log('array' + Array[i]);
      };
      
      
      $.ajax({
         url:"packaging",
         data:{"mailIdList":Array,"totalWeight":$("#total_weight").text()},
         success:function(data){
            console.log('성공');
            location.reload();
         }
      });
   }
   
   function pack_mailList(value){
      var url = 'pack_mailList?package_id='+value;
      window.open(url,"","width=800,height=700,right=300")
   }
   
</script>
<script type="text/javascript">
   function mailReceive(){
      var clientToname = new Array();
      var clientFromname = new Array();
      var clientToaddress = new Array();
      var clientFromaddress = new Array();
      var clentMailweight = new Array();
      
      var array = new Array();
      
      var ranNum =Math.random()*10+4;
      
      var num= parseInt(ranNum);
      
      
      
      clientToname = ['송인성','양관우','안소영','이명상','김현수','신용권','이상엽','염현지','이민호','김태희','김민지','김갑수','김영희','김남수'];
      clientFromname=['송인성','양관우','안소영','이명상','김현수','신용권','이상엽','염현지','이민호','김태희','김민지','김갑수','김영희','김남수'];
      clientToaddress=[
               '경기도 의정부시',
               '경기도 남양주시',
               '서울특별시 면목동',
               '서울특별시 망우동',
               '서울특별시 상봉동',
               '서울특별시 중계동',
               '서울특별시 대치동',
               '서울특별시 양서구',
               '강원도 양구',
               '경기도 파주',
               '경기도 하남시',
               '경기도 성남',
               '경기도 수원',
               '강원도 철원군'
               
            ];
      clientFromaddress=[
            '경기도 의정부시',
            '경기도 남양주시',
            '서울특별시 면목동',
            '서울특별시 망우동',
            '서울특별시 상봉동',
            '서울특별시 중계동',
            '서울특별시 대치동',
            '서울특별시 양서구',
            '강원도 양구',
            '경기도 파주',
            '경기도 하남시',
            '경기도 성남',
            '경기도 수원',
            '강원도 철원군'
         ];
      
      clientMailweight=[
                        30,20,40,50,60,80,100,200,300,1,2,3,4,5
                        ];
      
      clientVillageName=['v001','v002','v003',
								  'v001','v002','v003',
		  						  'v001','v002','v003',
		  						  'v001','v002','v003',
		      					  'v001','v002','v003'
		  						];
      
      for(i = 0; i < 5; i++){
      $.ajax({
         url:"clientInfo",
         data:{"to_name":clientToname[num],"from_name":clientFromname[num],"to_address":clientToaddress[num],"from_address":clientFromaddress[num],"vid":clientVillageName[num],"mail_weight":clientMailweight[num]},   
         success:function(){
        	 location.href="mailCheck"
            
         }
      });
       ranNum =Math.random()*10+4;
       num= parseInt(ranNum);
      }
   }
</script>
<script type="text/javascript">
   
</script>

<script type="text/javascript">
	function click(){
		location.href="hello";
	}
</script>
</head>
<body>

	<jsp:include page = "../common/manageHeader.jsp"/>
	<div class="body">
		<div class="body_sub">
			<div class="pack_left">
				<div class="bor_title">
					<div class="subject">우편 목록</div>
					<div class="searching">
						<form action="pack_search" method="post">
							<input type="text" name="search_text" class="input_text">
							<input type="submit" value="조회" class="input_submit">
						</form>
					</div>
				</div>
				<div class = "mail_list">
					<table cellspacing="0" border="1" summary="명단관리  리스트" class="frt_tbl_type" style="width:100%;padding-right:15px;">
						<colgroup>
							<col width="50" /><col width="80" /><col width="200" /><col width="80" /><col width="*" /><col width="100" />
							<col width="50"/><col width="70"><col width="15">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" rowspan="2">NO</th>
								<th scope="col" colspan="2">발신자</th>
								<th scope="col" colspan="2">수신자</th>
								<th scope="col" rowspan="2">도착 마을</th>
								<th scope="col" rowspan="2">무게</th>
								<th scope="col" rowspan="2" colspan="2"><button type="button" name="chk_auto" id='chk_auto' value="" onclick="Auto_weight_check()">자동 선택</button></th>
							</tr>
							<tr>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
							</tr>
						</thead>
					</table>
					<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
						<table cellspacing="0" id="mailTable" border="1" summary="명단관리 리스트" class="frt_tbl_type" style="border-top:0px;">
						
							<colgroup>
								<col width="50" /><col width="80" /><col width="200" /><col width="80" /><col width="*" /><col width="100" />
								<col width="50" /><col width="70">
							</colgroup>
							<tbody>	
							<c:choose>
								<c:when test="${mailList.size() lt 1}">									
									<tr>
										<td class="num" colspan="8" style="height:30px; background:#fbfbf9;">우편이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${clientInfoList}" var="ins">							
										<tr>
											<td class="num">${ins.from_name}</td>
											
											<td>마을명</td>
											
											<%-- <td class="frm"><input type="checkbox" id="chk" name="${mail.mail_id}"  value="${mail.mail_weight}" onclick="weight_check()"/></td> --%>
										</tr>
	
									</c:forEach>
								</c:otherwise>
							</c:choose> 
							</tbody>
						</table>
					</div>
					<table border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;border-top: 1px solid #999;">
						<colgroup>
							<col width="*" /><col width="50" /><col width="100" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="5">총 무게</th>
								<th scope="col" id="total_weight"></th>
								<th scope="col"><button type="button"  onclick="mailReceive()">우편물 받기</button></th>
								<th scope="col"><button type="button" name="" id='chk_all' value="" onclick="packaging()">패키징</button></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			
			<div class="pack_right">
				<div class="bor_title">
					<div class="subject">패키지 목록</div>
				</div>
				<div class = "mail_list" style="border-bottom:1px solid #999;">
					<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;padding-right:15px;">
						<colgroup>
							<col width="100" /><col width="*" /><col width="80" /><col width="100" /><col width="100" /><col width="100"><col width="15">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">마을 이름</th>
								<th scope="col">총 무게</th>
								<th scope="col">상태</th>
								<th scope="col" style="border-right:0;">포장 날짜</th>
								<th scope="col" colspan="2"></th>
							</tr>
						</thead>
					</table>
					<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
						<table cellspacing="0" border="1" summary="명단관리 리스트" class="frt_tbl_type" style="border-top:0px;">
						
							<colgroup>
								<col width="100" /><col width="*" /><col width="80" /><col width="100" /><col width="100"><col width="100" />
							</colgroup>
							<tbody>		
								<c:forEach items="${packageList}" var="pack">										
									<tr>
										<td class="num">${pack.package_id}</td>
										<td class="title">${pack.villageList.get(0).vname}</td>
										<td class="date">${pack.package_weight}</td>
										<td class="writer">${pack.stateList.get(0).state_name}</td>
										<td class="writer">${pack.arrival_date}</td>
										<td class="title"><button type="button" value="${pack.package_id}" onclick="pack_mailList(value)">우편 목록</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>