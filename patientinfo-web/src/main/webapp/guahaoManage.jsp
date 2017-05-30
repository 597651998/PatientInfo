<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>挂号信息管理</title>

<script type="text/javascript">
var url;
//打开新增患者对话框
function openGhAddDialog(){
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","开始挂号");
}
//重置对话框内数据
function resetValue(){
	$("#patientId").combobox("setValue","");
	$("#ghDate").datebox("setValue","");
	$("#officeName").combobox("setValue","");
	$("#ghDesc").val("");
}
//关闭对话框
function closeGhDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
//提交新增患者挂号的数据
function saveGh(){
	$("#fm").form("submit",{
		url:'http://localhost:8080/patientinfo-web/gh_save',
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			if(result.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","保存成功，请牢记您的流水号");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}
		}
	});
}
//修改选中的患者
function guahao_upd(){
	$("#fm").form("submit",{
		url:'http://localhost:8080/patientinfo-web/guahao_upd',
		onSubmit:function(){
			if($('#patientName').combobox("getValue")==""){
				$.messager.alert("系统提示","请选择用户");
				return false;
			}
			return $(this).form("validate");
		},
		success:function(result){
			if(result.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","修改成功");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
				doSearch();
			}
		}
	}); 
 }
//删除选中的挂号数据
function deleteGh(){
	//获得选中数据对象
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];//要删除的序号组合
	for(var i=0;i<selectedRows.length;i++){
		//选择选中的行数g_Id
		strIds.push(selectedRows[i].g_Id);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			//ajax提交 delIds
			$.post("http://localhost:8080/patientinfo-web/guahao_del",{id:ids},function(result){
			},"json");
		}
		$("#dg").datagrid("reload");
		$.messager.alert("系统提示","您已成功删除数据！");
	});
	searchGh();
}
//修改挂号信息
function openGhModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑患者资料");
	$("#patientName").combobox("setValue",row.patientName);
	$("#g_tiem").datebox("setValue",row.g_tiem);
	$("#g_officeName").combobox("setValue",row.g_officeName);
	$("#g_Desc").val(row.g_Desc);
	url="http://localhost:8080/patientinfo-web/guahao_upd";
}
//查询符合条件的挂号信息
function searchGh(){
/* 	$('#dg').datagrid('load',{
		s_patientName:$('#s_patientName').val(),
		s_sex:$('#s_sex').combobox("getValue"),
		s_bGhDate:$('#s_bGhDate').datebox("getValue"),
		s_eGhDate:$('#s_eGhDate').datebox("getValue"),
		s_userId:$('#s_userId').combobox("getValue"),
		s_officeName:$('#s_officeName').combobox("getValue")
	}); */
}
	function searchGh(){
		  $("#dg").datagrid({
		        url: "http://localhost:8080/patientinfo-web/guahao_list",
		        method: "POST",
		        pagination: true	    
		    });
	}
</script>
<link rel="stylesheet" type="text/css" href="style/easyui.css">
<link rel="stylesheet" type="text/css" href="style/icon.css">
<script type="text/javascript" src="style/jquery.min.js"></script>
<script type="text/javascript" src="style/jquery.easyui.min.js"></script>
<script type="text/javascript" src="style/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin:5px">
<table id="dg" title="挂号信息" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true" url="GuaHao" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="g_Id" width="50"  align="center">编号</th>
				<th field="g_No" width="100"  align="center">流水号</th>
				<th field="id" width="100" align="center" hidden="true">患者ID</th>
				<th field="userName" width="100" align="center">所属用户</th>
				<th field="patientName" width="100"  align="center">患者姓名</th>
				<th field="sex" width="100"  align="center">性别</th>
				<th field="idNumber" width="100"  align="center">身份证号</th>
				<th field="g_tiem" width="100" align="center">挂号日期</th>
				<th field="g_officeName" width="150" align="center">挂号科室</th>
				<th field="g_Desc" width="250" align="center">病情描述</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openGhAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openGhModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteGh()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
		&nbsp;患者姓名：&nbsp;<input type="text" name="s_patientName" id="s_patientName" size="10"/>
		&nbsp;性别：&nbsp;<select class="easyui-combobox" id="s_sex" name="s_sex" editable="false" panelHeight="auto">
		    <option value="">请选择...</option>
			<option value="男">男</option>
			<option value="女">女</option>
		</select>
		&nbsp;挂号日期：&nbsp;<input class="easyui-datebox" name="s_bGhDate" id="s_bGhDate" editable="false" size="10"/>-><input class="easyui-datebox" name="s_eGhDate" id="s_eGhDate" editable="false" size="10"/>
		&nbsp;所属用户：&nbsp;<input class="easyui-combobox" id="s_userId" name="s_userId" size="10" data-options="panelHeight:'auto',editable:false,valueField:'userId',textField:'userName',url:'http://localhost:8080/patientinfo-web/patient_submitpatient'"/> 
		&nbsp;所属科室：&nbsp;<select class="easyui-combobox" id="s_officeName" name="s_officeName" editable="false" panelHeight="auto">
		    <option value="">请选择...</option>
			<option value="外科">外科</option>
			<option value="儿科">儿科</option>
			<option value="精神科">精神科</option>
			<option value="五官科">五官科</option>
		</select>
		<a href="javascript:searchGh()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 340px;height: 340px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>		
					<td valign="top">患者编号：</td>
					<td><select class="easyui-combobox"  id="g_Id" name="g_Id" size="10" style="width: 155px" data-options="panelHeight:'auto',editable:false,valueField:'g_Id',textField:'g_Id',url:'http://localhost:8080/patientinfo-web/guahao_list'"/>   </td>
				</tr>
				<tr>		
					<td>患者姓名：</td>
					<td><input class="easyui-combobox" id="patientName" name="patientName" style="width: 155px" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'patientName',url:'http://localhost:8080/patientinfo-web/patients_list'"/></td>
				</tr>
				<tr>
					<td>选择日期：</td>
					<td><input class="easyui-datebox" name="g_tiem" id="g_tiem" required="true" editable="false" /></td>
				</tr>
				<tr>
				<td>选择科室：</td>
				<td>
				<select class="easyui-combobox" id="g_officeName" name="g_officeName" editable="false" panelHeight="auto" style="width: 155px">
			    <option value="">请选择...</option>
				<option value="外科">外科</option>
				<option value="儿科">儿科</option>
				<option value="精神科">精神科</option>
				<option value="五官科">五官科</option>
				</select>
				</td>
				</tr>
				<tr>
					<td valign="top">患者备注：</td>
					<td colspan="4"><textarea rows="4" cols="15" name="g_Desc" id="g_Desc"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a  href="javascript:saveGh()"class="easyui-linkbutton"   iconCls="icon-ok">挂号</a>
		<a  href="javascript:guahao_upd()"class="easyui-linkbutton"   iconCls="icon-ok">修改</a>
		<a href="javascript:closeGhDialog()" class="easyui-linkbutton" iconCls="icon-cancel">放弃</a>
	</div>
</body>
</html>