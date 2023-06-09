<%@page import="com.smhrd.entity.Project"%>
<%@page import="com.smhrd.entity.Evaluation"%>
<%@page import="com.smhrd.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


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

  .close:hover,
  .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
  }
  eval_btn {
    padding: 0;
    border: none;
    background: none;
    cursor: pointer;
  }

  .eval_form {
    display: none;
    margin-left: 10px;
  }

  .eval_btn:focus + .eval_form {
    display: inline-block;
  }
  
</style>
</head>
<body>
<div class="table-container"> 
	<% User user = (User) session.getAttribute("user"); %>
	<% Project view_leader = (Project) request.getAttribute("view_leader");	%>

	<table border="1">
		<thead>
			<tr>
				<td>팀장 아이디</td>
				<td>평가하기</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<%=view_leader.gett_Id()%>
					 <button class="info_btn" data-modal-id="<%=view_leader.gett_Id()%>_modal">Info</button>
          <!-- Modal -->
          <div id="<%=view_leader.gett_Id()%>_modal" class="modal">
            <div class="modal-content">
              <span class="close" data-modal-id="<%=view_leader.gett_Id()%>_modal">&times;</span>
              <h3>leader information</h3>
              <p>저는 시켜만 주시면 뭐든 잘합니다!</p>
            </div> 
          </div>
				</td>
				<% if(view_leader.gett_Id()!=null){ %>
				<td>
					<button class="eval_btn">평가하기</button>
					<form class="eval_form" action="submit_eval_leader.do" method="POST"
						style="display: none;">
						 <input type="hidden" name="t_id" value="<%=user.getT_id()%>">
						<input type="hidden" name="prj_seq" value="<%=view_leader.getPrj_seq()%>">
						<input type="hidden" name="leader_id" value="<%=view_leader.gett_Id() %>">
						<button type="submit" style="float:right;" >제출</button>
						<select style="float:right;" name="ev_rating">
							<%
							for (int i = 1; i <= 5; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
						</select>
					</form>
				</td>
			</tr>
			<%}else{ %>
			<tr>
				<td>데이터가 없습니다.</td>
			</tr>
			<%} %>
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
        var ev_rating = form.find('select[name=ev_rating]').val();
        var t_id = form.find('input[name=t_id]').val();
        var prj_seq = form.find('input[name=prj_seq]').val()
        var leader_id = form.find('input[name=leader_id]').val()
        console.log(ev_rating);
        console.log(t_id);
        console.log(prj_seq);
        console.log(leader_id);
        $.ajax({
          url: form.attr('action'),
          method: form.attr('method'),
          data: form.serialize(),
          success: function(response) {
            console.log("전송완료");
            form.css('display', 'block');
            form.find('select').focus();
          },
          error: function(e) {
            console.error("띠바");
          }
        });
      }
      return false;
    });

    // Modal functionality
    $('.info_btn').on('click', function() {
      var modalId = $(this).data('modal-id');
      var modal = document.getElementById(modalId);
      modal.style.display = "block";
    });

    $('.close').on('click', function() {
      var modalId = $(this).data('modal-id');
      var modal = document.getElementById(modalId);
      modal.style.display = "none";
    });

    window.onclick = function(event) {
      if (event.target.classList.contains("modal")) {
        var modalId = event.target.id;
        var modal = document.getElementById(modalId);
        modal.style.display = "none";
      }
    }
  });
  
  
  
  
  
  
</script>
</body>
</html>
