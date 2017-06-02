<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医生信息管理</title>

<script type="text/javascript">
var url;
//打开新增医生对话框
function openGhAddDialog(){
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","开始挂号");
}
//重置对话框内数据
function resetValue(){
	$("#doctorName").val("");
	$("#doctorhospital").val("");
	$("#officeName").val("");
	$("#timeDesc").val("");
	$("#guahaomoney").val("");
}
//关闭对话框
function closeGhDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
//提交新增医生挂号的数据
function saveGh(){
	$("#fm").form("submit",{
		url:'http://localhost:8080/patientinfo-web/doctor_save',
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
//修改选中的医生
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
		strIds.push(selectedRows[i].doctor_id);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			//ajax提交 delIds
			$.post("http://localhost:8080/patientinfo-web/doctor_del",{id:ids},function(result){
			},"json");
		}
		searchGh();
		$("#dg").datagrid("reload");
		$.messager.alert("系统提示","您已成功删除数据！");
		
	});
}
//修改挂号信息
function openGhModifyDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑医生资料");
	$("#doctorName").val(row.doctorName);
	$("#doctorhospital").val(row.doctorhospital);
	$("#officeName").val(row.officeName);
	$("#timeDesc").val(row.timeDesc);
	$("#guahaomoney").val(row.guahaomoney);
	$("#doctor_id").val(row.doctor_id);
}
//查询符合条件的挂号信息
	function searchGh(){
		  $("#dg").datagrid({
		        url: "http://localhost:8080/patientinfo-web/doctor/doctor_findAllhospital",
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
<table id="dg" title="医生信息信息" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true" url="GuaHao" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="doctor_id" width="50"   align="center">编号</th>
				<th field="doctorhospital" width="100"  align="center">医生归属医院</th>
				<th field="officeName" width="100" align="center">所属科室</th>
				<th field="doctorName" width="100"  align="center">医生姓名</th>
				<th field="timeDesc" width="100" align="center">医生空余时间</th>
				<th field="guahaomoney" width="50" align="center">费用</th>
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
		<a href="javascript:searchGh()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 340px;height: 340px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>		
					<td><input class="easyui-textbox" id="doctor_id" name="doctor_id"  style="width: 155px;" type="hidden" /></td>
				</tr>
				<tr>		
					<td>医生姓名：</td>
					<td><input class="easyui-textbox" id="doctorName" name="doctorName" style="width: 155px" /></td>
				</tr>
				<tr>		
					<td>医生归属医院：</td>
					<td><input class="easyui-textbox" id="doctorhospital" name="doctorhospital" style="width: 155px" /></td>
				</tr>
					<tr>		
					<td>医生科室：</td>
					<td><input class="easyui-textbox" id="officeName" name="officeName" style="width: 155px" /></td>
				</tr>
					<tr>		
					<td>医生时间简介：</td>
					<td><input class="easyui-textbox" id="timeDesc" name="timeDesc" style="width: 155px" /></td>
				</tr>
				<tr>		
					<td>医生费用：</td>
					<td><input class="easyui-textbox" id="guahaomoney" name="guahaomoney" style="width: 155px" /></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a  href="javascript:saveGh()"class="easyui-linkbutton"   iconCls="icon-ok">新增医生</a>
		<a  href="javascript:guahao_upd()"class="easyui-linkbutton"   iconCls="icon-ok">修改</a>
		<a href="javascript:closeGhDialog()" class="easyui-linkbutton" iconCls="icon-cancel">放弃</a>
	</div>
</body>
</html>