<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	//이전 화면[reqd.jsp : href의 속성에서 updateForm.jsp?bm=5]에서의 값을 받아오자. 
	String bm_title = request.getParameter("bm_title");
	String bm_no = request.getParameter("bm_no");
	String bm_writer = request.getParameter("bm_writer");
	String bm_content = request.getParameter("bm_content");
	String bs_file = request.getParameter("bs_file");
	out.print(bm_no+","+bm_writer+","+bm_content+","+bs_file);	
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

<!--  여기 있으면 undefined 걸린다. 
<script type="text/javascript">
	function updAction(){
		console.log("수정액션 호출");
		$("#board_upd").submit();
	}
</script>
 -->
</head>
<body>
	<script type="text/javascript">
			$(document).ready(function(){
				/* $('#dm_writer').<- 이렇게 하면 id 가 겹쳐서 망한다.  */
				$('#ubm_title').textbox('setValue','<%=bm_title%>');
				$('#ubm_writer').textbox('setValue','<%=bm_writer%>');
				$('#ubm_content').textbox('setValue','<%=bm_content%>');			
			});
		</script>
		<!--=========================== [[글수정 화면 시작]] =============================-->
    	<form id="board_upd" method="post" action="boardUpdate.sp4">
    	<input type="hidden" name = "bm_no" value="<%=bm_no%>">
    	<input type="hidden" name = "bs_file" value="<%=bs_file%>">
    	<div style="margin-bottom:20px">
           <!--  <input class="easyui-textbox" name="bm_title" label="제목:" labelPosition="top" data-options="prompt:'제목'" style="width:400px;"> -->
            <!-- read.jsp의 id와 겹치면 안되기 때문에 u붙여줌. -->
            <input class="easyui-textbox" id="ubm_title" name="bm_title" label="제목:" labelPosition="top" data-options="prompt:'제목'" style="width:400px;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="ubm_writer" name="bm_writer" label="작성자:" labelPosition="top" data-options="prompt:'작성자'" style="width:250px;">
        </div>        
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="ubm_content" name="bm_content" label="내용:" labelPosition="top" data-options="prompt:'내용',multiline:true, width:500, height:120">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="ubm_email" name="bm_email" label="Email:" labelPosition="top" data-options="prompt:'Enter a email address...'" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id = "ubm_pw" name="bm_pw" label="비밀번호:" labelPosition="top" style="width:200;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-filebox" id="ubs_file" name="bs_file" label="첨부파일:" labelPosition="top" data-options="width:'400px'" >
        </div>
    	</form>
    <div id="ft_ins">
		<a href="javascript:updAction()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">수정</a>
		<a href='javascript:$("#dlg_upd").dialog("close");' class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">닫기</a>
	</div>   
    <!--=========================== [[글수정 화면   끝 ]] =============================--> 
</body>
</html>