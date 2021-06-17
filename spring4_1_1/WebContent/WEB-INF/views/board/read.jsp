<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> boardDetail = null;
	boardDetail = (List<Map<String,Object>>)request.getAttribute("boardDetail");
	int size = 0;
	String bm_email 	= null;
	String bs_file 		= null;
	String bm_title 	= null;
	String bm_writer 	= null;
	String bm_content 	= null;
	String bm_pwd 		= null;
	String bm_no		= null;
	String bm_group 	= null;
	String bm_pos 		= null;
	String bm_step 		= null;
	if(boardDetail!=null){
		size = boardDetail.size();		
		bm_email = boardDetail.get(0).get("BM_EMAIL").toString();
		bs_file = boardDetail.get(0).get("BS_FILE").toString();
		bm_title = boardDetail.get(0).get("BM_TITLE").toString();
		bm_writer = boardDetail.get(0).get("BM_WRITER").toString();
		bm_content = boardDetail.get(0).get("BM_CONTENT").toString();
		bm_pwd = boardDetail.get(0).get("BM_PW").toString();
		bm_no = boardDetail.get(0).get("BM_NO").toString();
		bm_group = boardDetail.get(0).get("BM_GROUP").toString();
		bm_pos = boardDetail.get(0).get("BM_POS").toString();
		bm_step = boardDetail.get(0).get("BM_STEP").toString();
	}
	out.print("boardDetail : "+boardDetail);
	//out.print("boardDetail:"+boardDetail); <-주소번지 알려주는 코드>
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
//댓글쓰기
	function repleForm(){
		$("#dlg_ins").dialog('open');
	}
	function insAction(){
		console.log("입력액션 호출");
		$('#board_ins').submit();
	}
	function updateForm(){
		console.log("저장액션 호출");
		$('#dlg_upd').dialog({
		    title: '글수정',
		    width: 600,
		    height: 600,
		    closed: false,
		    cache: false,
		    href: 'updateForm.sp4?bm_writer=<%=bm_writer%>&bm_content=<%=bm_content%>&bm_no=<%=bm_no%>&bs_file=<%=bs_file%>',
		    modal: true
		});
	}
	function boardList(){
		location.href="./getBoardList.sp4";
	}
</script>
</head>
<body>
	<table align="center" id="p" class="easyui-panel" title="글상세보기" data-options="footer:'#tb_read'"
        style="width:670px;height:380px;padding:10px;background:#fafafa;">
	    	<tr>
	    		<td>제목</td>
	    		<td><input id="bm_title" value="<%=bm_title%>" name="bm_title" data-options="width:'450px'" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    		<td>작성자</td>
	    		<td><input id="bm_writer" value="<%=bm_writer%>" name="bm_writer" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    		<td>이메일</td>
	    		<td><input id="bm_email" value="<%=bm_email%>" name="bm_email" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    		<td>내용</td>
	    		<td><input id="bm_content" value="<%=bm_content%>" name="bm_content" data-options="multiline:'true', width:'570px', height:'90px'" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    		<td>비밀번호</td>
	    		<td><input id="bm_pw" value="<%=bm_pwd%>" name="bm_pw" class="easyui-passwordbox"></td>
	    	</tr>	    	
	   </table>
	 <div id="tb_read" style="padding:2px 5px;" align="center">
	    <a href="javascript:repleForm()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">댓글쓰기</a>
	    <a href="javascript:updateForm()" class="easyui-linkbutton" iconCls="icon-add" plain="true">수정</a>
	    <a href="javascript:boardDelView()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
	    <a href="javascript:boardList()" class="easyui-linkbutton" iconCls="icon-search" plain="true">목록</a>
	</div>
		<!--=========================== [[글쓰기 화면 시작]] =============================-->
    <div id="dlg_ins" class="easyui-dialog" title="글쓰기" data-options="iconCls:'icon-save', closed:'false', footer:'#ft_ins'" style="width:600px;height:650px;padding:10px">
    	<form id="board_ins" method="get" action="boardInsert.sp4">
    	<input type="hidden" name = bm_no" value="0">
    	<input type="hidden" name = bm_group" value="0">
    	<input type="hidden" name = bm_pos" value="0">
    	<input type="hidden" name = bm_step" value="0">
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
    <!--=========================== [[글쓰기 화면   끝 ]] =============================--> 
	<div id=dlg_upd></div>
</body>
</html>