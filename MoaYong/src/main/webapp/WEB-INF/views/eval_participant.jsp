<%@page import="com.smhrd.entity.JoinParty"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Additional style for the modal */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 500px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 테이블 컨테이너 스타일 */
.table-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

/* 테이블 스타일 */
table {
	width: 50%;
	border-collapse: collapse;
	font-family: Arial, sans-serif;
	color: #333;
	background-color: #f9f9f9;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* 테이블 헤더 스타일 */
thead {
	background-color: #007bff;
	color: #fff;
}

/* 테이블 헤더 셀 스타일 */
th {
	padding: 10px;
	text-align: left;
	border-bottom: 2px solid #fff;
}

/* 테이블 데이터 셀 스타일 */
td {
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

/* 첫 번째 데이터 셀 스타일 */
td:first-child {
	font-weight: bold;
}

/* 버튼 스타일 */
button {
	padding: 5px 10px;
	background-color: #17a2b8;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

/* 버튼에 호버 효과 */
button:hover {
	background-color: #138496;
}
</style>
</head>
<body>


	<div class="table-container">
		<% List<JoinParty> joinList = (List<JoinParty>) request.getAttribute("joinList"); %>

		<table border="1">
			<thead>
				<tr>
					<td>참가자 아이디</td>
					<td>평가하기</td>
				</tr>
			</thead>
			<tbody>
				<% if (joinList != null) { %>
				<% for (JoinParty vo : joinList) { %>
				<tr>
					<td><%=vo.getT_id()%>
						<button class="info_btn" data-modal-id="<%=vo.getT_id()%>_modal">Info</button>
						<!-- Modal -->
						<div id="<%=vo.getT_id()%>_modal" class="modal">
							<div class="modal-content">
								<span class="close" data-modal-id="<%=vo.getT_id()%>_modal">&times;</span>
								<h3>participant information</h3>
								<p>저는 시켜만 주시면 뭐든 잘합니다!</p>
							</div>
						</div>
						</td>
					<td>
						<button class="eval_btn">평가하기</button>
						<form class="eval_form" action="submit_eval_participant.do"
							method="POST" style="display: none;">
							<button type="submit" style="float: right;">제출</button>
							<select name="prj_rating" style="float: right;">
								<% for (int i = 1; i <= 5; i++) { %>
								<option value="<%=i%>"><%=i%></option>
								<% } %>
							</select> <input type="hidden" name="t_id" value="<%=vo.getT_id()%>">
							<input type="hidden" name="prj_seq" value="<%=vo.getPrj_seq()%>">
							<input type="hidden" name="p_seq" value="<%=vo.getP_seq()%>">
						</form>
					</td>
				</tr>
				<% } %>
				<% } else { %>
				<tr>
					<td>데이터가 없습니다.</td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>


	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {
      $('.eval_btn').on('click', function() {
        var form = $(this).next('.eval_form');
        form.css('display', 'inline');
        form.find('select').focus();
      });

      $('.eval_form').on('submit', function(e) {
        e.preventDefault();
        var form = $(this);
        var confirmMessage = "평가 완료";
        if (confirm(confirmMessage)) {
          $.ajax({
            url : form.attr('action'),
            method : form.attr('method'),
            data : form.serialize(),
            success : function(response) {
              console.log(response);
              form.css('display', 'block');
              form.find('select').focus();
            },
            error : function(e) {
              console.error("띠바");
            }
          });
        }
        return false;
      });

      $('.info_btn').on('click', function() {
          var modalId = $(this).data('modal-id');
          var modal = $('#' + modalId);
          modal.css('display', 'block');
      });

      $('.close').on('click', function() {
          var modalId = $(this).data('modal-id');
          var modal = $('#' + modalId);
          modal.css('display', 'none');
      });

      $(window).on('click', function(event) {
          if ($(event.target).hasClass('modal')) {
              var modalId = $(event.target).attr('id');
              var modal = $('#' + modalId);
              modal.css('display', 'none');
          }
      });
  });
      
  </script>
</body>
</html>
