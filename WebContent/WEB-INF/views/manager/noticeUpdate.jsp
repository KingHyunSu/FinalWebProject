<%@ page language="java" contentType="text/html; charset=UTF-16"
    pageEncoding="UTF-16"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-16">
<title>Insert title here</title>

	<script type ="text/javascript" src = "<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type ="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">		
	<script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>			
	<link rel="stylesheet" type="text/css" href="resources/css/notice.css">
	<script type="text/javascript">
		function checkForm(){
			var result= true;					
			if($("#notice_title").val()==""){
				$("noticetitleError").text("*제목을 입력해주세요.");
			}
			if($("#notice_content").val()==""){
				$("noticecontentError").text("*내용을 입력해주세요.");
			}			
			return result;
		}
	</script>		


</head>
<body>
		<jsp:include page="../common/header.jsp"/>
		<div class="body">
			<div class="body_sub">
			
			<form method="post" action="noticeUpdate" onsubmit="return checkForm()">
				<div class="bor_title">
					<div class="subject">공지사항 글작성</div>
					
				</div>

				<div class = "mail_list">
					<table cellspacing="0" border="1" class="frt_tbl_type" style="width:100%;">
						<colgroup>
							<col width="10%"/><col width="23%"/><col width="10%"/>
							<col width="23%"/><col width="10%"/><col width="24%"/>
						</colgroup>
							<tr>
								<th scope="col">제목</th>
								<td colspan="5">
									<input type="text" name="notice_title" value="${notice.notice_title} " style="border:0;width: 98%;">
									<span id="noticetitleError" class="error" style="color:red"></span>
								</td>
							</tr>
							<tr>
								<th scope="col">작성자</th>
								<td>${memberInfo.mname }</td>
								<th scope="col">부서</th>
								<td>${memberInfo.dept_id}</td>
								<th scope="col">작성일</th>
								<td>${notice.notice_date}</td>
							</tr>
							<tr>
								<th scope="col">첨부파일</th>
								<td colspan="5"></td>
							</tr>
							<tr>
							<td colspan="6">
								<textarea name="notice_content" rows="30" cols="5" style="width: 100%;">${notice.notice_content}</textarea>
								<span id="noticecontentError" class="error" style="color:red"></span>
							</td>
							</tr>
					</table>
						<input type="hidden" name="notice_id" value="${notice.notice_id}">
						<input type="submit" value="수정" onClick="checkForm()"></input>
					</div>
					
				</form> 
				
				
			</div>
		</div>


</body>
</html>