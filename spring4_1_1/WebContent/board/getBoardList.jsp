<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록[WebContent]</title>
<!-- jEasyUI 시작 -->
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/icon.css"> 
<!-- jEasyUI JS 시작 -->
<script type="text/javascript" src="<%=path.toString() %>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path.toString() %>js/jquery.easyui.min.js"></script>   
<script>
	function search(){
		console.log("조회 호출");
		$('#dg_board').datagrid({
			url:'jsonGetBoardList.sp4',
		});
	}
	function ins(){
	    console.log("입력창 호출");
	    $('#dlg_ins').dialog('open')
	}
	function insAction(){
		console.log("입력액션 호출");
	    $('#board_ins').submit();
	}
</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#dg_board').datagrid({
				toolbar:'#tb_board2'
				,onDblClickCell: function(index, field, value){
					if("BS_FILE" == field){
						location.href="download.jsp?bs_file="+value;
					}
				}
			});
			
		});
	</script>
	<table id="dg_board" class="easyui-datagrid" data-options="title:'게시판'" style="width:500px; height:350px">
    	<thead>
	        <tr>
	            <th data-options="field:'BM_NO'">글번호</th>
	            <th data-options="field:'BM_TITLE'">제목</th>
	            <th data-options="field:'BM_DATE'">작성일</th>
	            <th data-options="field:'BS_FILE'">첨부파일</th>
	            <th data-options="field:'BM_HIT'">조회수</th>
	        </tr>
	    </thead>
	</table>
	<div id="tb_board2" style="padding:2px 5px;">
        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
        <a href="javascript:ins()" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">삭제</a>
    </div>
    <!-- ================================== [[글쓰기 화면 시작]] =============================================== -->
    <div id="dlg_ins" class="easyui-dialog" title="글쓰기" data-options="iconCls:'icon-save', closed:'false', footer:'#ft_ins'" style="width:600px;height:650px;padding:10px">
    	<form id="board_ins" method="post" enctype="multipart/form-data" action="boardInsert.sp4">
    	<input type="hidden" name="bm_no" value="0">
    	<input type="hidden" name="bm_group" value="0">
    	<input type="hidden" name="bm_pos" value="0">
    	<input type="hidden" name="bm_step" value="0">
    	<div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_title" label="제목:" labelPosition="top" data-options="prompt:'제목'" style="width:400px;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_writer" label="작성자:" labelPosition="top" data-options="prompt:'작성자'" style="width:250px;">
        </div>        
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_content" label="내용:" labelPosition="top" data-options="prompt:'내용',multiline:true, width:500, height:120">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_email" label="Email:" labelPosition="top" data-options="prompt:'Enter a email address...',validType:'email'" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_pw" label="비밀번호:" labelPosition="top" style="width:200;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-filebox" name="bs_file" label="첨부파일:" labelPosition="top" data-options="width:'400px'" >
        </div>
    	</form>
    </div>
    <div id="ft_ins">
		<a href="javascript:insAction()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">저장</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">취소</a>
	</div>
    <!-- ================================== [[글쓰기 화면   끝]] =============================================== -->
</body>
</html>