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
        url:'jsonGetBoardList.sp4'
    });    
  }
</script>
</head>
<body>
<script type="text/javascript">
	$(documnet).ready(funcion(){
		 $('#dg_board').datagrid({
		       toolbar:'#tb_board2'
		});		 
	});
</script>
<table id="dg_board" class="easyui-datagrid" data-options="title:'게시판',toolbar:'#tb_board'" style="width:500px;height:350px">
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
    <div id="tb_board" style="padding:2px 5px;">
     <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">삭제</a>
           </div>  
           <!-- =======================[[글쓰기 화면 시작]]======================= --> 
               <div id="dlg_ins" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save'" style="width:400px;height:200px;padding:10px">
        			The dialog content.
        		</div>
           <!-- =======================[[글쓰기 화면 끝]]======================= --> 
</body>
</html> 