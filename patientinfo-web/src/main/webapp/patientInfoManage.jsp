<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息管理</title>
<script type="text/javascript">
var url;
//打开新增患者对话框
function openPatientAddDialog(){
	$("#save_a").css("display","inline");
	$("#update_a").css("display","none");
	
	$("#patientid").css("display","none");
	//在勾选情况下点击新增要先清除数据
	resetValue();
	$("#dlg").dialog("open").dialog("setTitle","添加患者信息");
	url="patient!save";//为url赋值
}
//重置对话框内数据
function resetValue(){
	$("#patientName").val("");
	$("#sex").combobox("setValue","");
	$("#birthday").datebox("setValue","");
	$("#userId").combobox("setValue","");
	$("#patientDesc").val("");
	$("#tel").val("");
	$("#idNumber").val("");
}
//关闭对话框
function closePatientDialog(){
	$("#dlg").dialog("close");
	resetValue();
}
 function savePatient(){
	$("#fm").form("submit",{
		url:'http://localhost:8080/patientinfo-web/patientSave',
		onSubmit:function(){
			if($('#sex').combobox("getValue")==""){
				$.messager.alert("系统提示","请选择性别");
				return false;
			}
			if($('#userId').combobox("getValue")==""){
				$.messager.alert("系统提示","请选择所属用户");
				return false;
			}
			return $(this).form("validate");
		},
		success:function(result){
			if(result.errorMsg){
				$.messager.alert("系统提示",result.errorMsg);
				return;
			}else{
				$.messager.alert("系统提示","添加成功");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
				location.reload(false) ; 
				doSearch();
			}
		}
	});
} 
 //修改选中的患者
function updatePatient(){
	$("#fm").form("submit",{
		url:'http://localhost:8080/patientinfo-web/updatePatient',
		onSubmit:function(){
			if($('#sex').combobox("getValue")==""){
				$.messager.alert("系统提示","请选择性别");
				return false;
			}
			if($('#userId').combobox("getValue")==""){
				$.messager.alert("系统提示","请选择所属用户");
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
//删除选中的患者数据
function deletePatient(){
	//获得选中数据对象
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];//要删除的序号组合
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].id);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			//ajax提交 delIds
			$.post("http://localhost:8080/patientinfo-web/patient_del",{id:ids},function(result){
				console.log(result);
			},"json");
			$.messager.alert("系统提示","您已成功删除数据！");
			doSearch();
		}
	});
}
//修改患者资料
function openPatientModifyDialog(){
	$("#save_a").css("display","none");
	$("#update_a").css("display","inline");
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑患者资料");
	$("#patientName").val(row.patientName);
	$("#sex").combobox("setValue",row.sex);
	$("#birthday").datebox("setValue",row.birthday);
	$("#userId").combobox("setValue",row.userId);
	$("#patientDesc").val(row.patientDesc);
	$("#tel").val(row.tel);
	$("#idNumber").val(row.idNumber);
	url="http://localhost:8080/patientinfo-web/patient_upd";
}


	// 任何需要执行的js特效 
function doSearch(){
	  $("#dg").datagrid({
	        url: "http://localhost:8080/patientinfo-web/patients_list",
	        method: "POST",
	        pagination: true	    
	    });
}
//倒出excel数据
function exportPatient(){
	$('#export').form("submit",{
		url:"patient!exportPatient"
	})
	//window.location.href="employee!ExportEmployee";
}
</script>
<link rel="stylesheet" type="text/css" href="style/easyui.css">
<link rel="stylesheet" type="text/css" href="style/icon.css">
<script type="text/javascript" src="style/jquery.min.js"></script>
<script type="text/javascript" src="style/jquery.easyui.min.js"></script>
<script type="text/javascript" src="style/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin:5px">
<table id="dg" title="患者信息：保存操作时请无视患者编号，修改操作时请选择对应患者编号，否则无效" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50"  align="center">编号</th>
				<th field="userId" width="100" align="center" hidden="true">用户ID</th>
				<th field="userName" width="100" align="center" >所属用户</th>
				<th field="patientName" width="100"  align="center">患者名称</th>
				<th field="sex" width="100"  align="center">性别</th>
				<th field="birthday" width="100" align="center">出生日期</th>
				<th field="idNumber" width="100" align="center">身份证号</th>
				<th field="tel" width="100" align="center">联系电话</th>
				<th field="patientDesc" width="250" align="center">家庭住址</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openPatientAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openPatientModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deletePatient()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:exportPatient()" class="easyui-linkbutton" iconCls="icon-export" plain="true">导出Execl</a>
		</div>
		<div>
			<form id="export" method="post">
			&nbsp;姓名：&nbsp;<input type="text" name="s_patientName" id="s_patientName" size="10"/>
			&nbsp;性别：&nbsp;<select class="easyui-combobox" id="s_sex" name="s_sex" editable="false" panelHeight="auto">
			    <option value="">请选择...</option>
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
			&nbsp;出生日期：&nbsp;<input class="easyui-datebox" name="s_bbirthday" id="s_bbirthday" editable="false" size="10"/>-><input class="easyui-datebox" name="s_ebirthday" id="s_ebirthday" editable="false" size="10"/>
			&nbsp;所属用户：&nbsp;<input class="easyui-combobox" id="s_userId" name="s_userId" size="10" data-options="panelHeight:'auto',editable:false,valueField:'userId',textField:'userName',url:'http://localhost:8080/patientinfo-web/patient_submitpatient'"/>   
			<a href="javascript:doSearch()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			</form>
		</div>
	</div>
		
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 340px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>		
					<td>患者姓名：</td>
					<td><input type="text" name="patientName" id="patientName" class="easyui-validatebox" required="true"/></td>
					<td>身份证号：</td>
					<td><input type="text" name="idNumber" id="idNumber" class="easyui-validatebox" data-options="required:true,validType:'length[15,18]'"/></td>
				
				</tr>
				<tr>
					<td>性别：</td>
					<td><select class="easyui-combobox" id="sex" name="sex" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select></td>
					<td>出生日期：</td>
					<td><input class="easyui-datebox" name="birthday"id="birthday" required="true" editable="false"/></td>
				</tr>
				<tr>
					<td>所属用户：</td>
					<td><select class="easyui-combobox"  id="userId" name="userId" size="10" style="width: 155px" data-options="panelHeight:'auto',editable:false,valueField:'userId',textField:'userName',url:'http://localhost:8080/patientinfo-web/patient_submitpatient'"/>   </td>
					<td>联系电话：</td>
					<td><input type="text" name="tel" id="tel" class="easyui-validatebox" data-options="required:true"/></td>
				
				</tr>
				<tr>
					<td valign="top">家庭住址：</td>
					<td colspan="4"><textarea rows="7" cols="46" name="patientDesc" id="patientDesc"></textarea></td>
				</tr>
				<tr>		
					<td valign="top">患者编号：</td>
					<td><select class="easyui-combobox"  id="id" name="id" size="10" style="width: 155px" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'id',url:'http://localhost:8080/patientinfo-web/patient_idlist'"/>   </td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:savePatient()" class="easyui-linkbutton" id = "save_a"iconCls="icon-ok">保存</a>
		<a href="javascript:updatePatient()" id="update_a" class="easyui-linkbutton" iconCls="icon-ok">修改</a>
		<a href="javascript:closePatientDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>