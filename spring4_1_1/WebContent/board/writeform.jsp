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
<title>Insert title here</title>
<!-- jEasyUI 시작 -->
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/icon.css"> 
<!-- jEasyUI JS 시작 -->
<script type="text/javascript" src="<%=path.toString() %>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path.toString() %>js/jquery.easyui.min.js"></script>  
	<script type="text/javascript">
	  function insAction(){
		    console.log("입력action 호출");
		    $('#board_ins').submit();
		  }
	</script>
</head>
<body>
    <!--=========================== [[글쓰기 화면 시작]] =============================-->   
    <div id="dlg_ins" class="easyui-dialog" title="글쓰기" data-options="iconCls:'icon-save', closed:false, footer:'#ft_ins'" style="width:600px;height:350px;padding:10px">
        <form id="board_ins" method="post" enctype="multipart/form-data" action="boardInsert.sp4">  
        <input type="hidden" name="bm_no" value ="0">        
        <input type="hidden" name="bm_pos" value ="0">        
        <input type="hidden" name="bm_group" value ="0">        
        <input type="hidden" name="bm_step" value ="0">             
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_title" label="제목:" labelPosition="top" data-options="prompt:'제목'" style="width:400px;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_title" label="작성자:" labelPosition="top" data-options="prompt:'작성자'" style="width:250px;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_cotent" label="내용:" labelPosition="top" data-options="prompt:'내용',multiline:true" style="width:500px;height:150px">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_email" label="Email:" labelPosition="top" data-options="prompt:'Email',validType:'email'" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_pw" label="비밀번호:" labelPosition="top" data-options="prompt:'비밀번호'" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bs_file" label="첨부파일:" labelPosition="top" data-options="width:'400px'">
        </div>
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px">Register</a>
        </div>  
        <div id="ft_ins">
			<a href="javascript:insAction()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">저장</a>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">취소</a>
		</div>
   		</form>
    </div>   
    <!--=========================== [[글쓰기 화면   끝 ]] =============================-->
</body>
</html>