<%@page language="java" pageEncoding="UTF-8"%>
<%
	String rootPath_js = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ request.getContextPath() + "/";
	String version_js = "20160606011";
%>
		<script>
			var rootPath = '<%=rootPath_js%>'; //js中如果需要获取项目根路径，请调用rootPath变量获取
			document.onkeyup=function(event){
			    if(event.keyCode='13'){
				    return false;
			    }
			}
		</script>
		<script src="<%=rootPath_js%>jquery-easyui-1.3.3/jquery-1.4.2.js?v=<%=version_js%>"></script>
		<%-- <script src="<%=rootPath_js%>assets/js/librarys/bootstrap.min.js?v=<%=version_js%>"></script>
		<script src="<%=rootPath_js%>assets/js/plugins/messenger.min.js?v=<%=version_js%>"></script>
		<script src="<%=rootPath_js%>assets/js/plugins/messenger-theme-flat.js?v=<%=version_js%>"></script>
		<script src="<%=rootPath_js%>assets/js/plugins/jquery.datetimepicker.full.min.js?v=<%=version_js%>"></script>
		<script src="<%=rootPath_js%>assets/js/common/common.js?v=<%=version_js%>"></script>
		<script src="<%=rootPath_js%>assets/js/plugins/Util.js?v=<%=version_js%>"></script> --%>
		