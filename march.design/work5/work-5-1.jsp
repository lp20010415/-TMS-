<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %>     
    
<%
	
	
	String driverName="com.mysql.jdbc.Driver"; 
		  //数据库名 
	String dbName="user"; 
	//表名 
	String userName="root";
	String userPasswd="root";
	String tableName="user"; 
	String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=UTF-8";
	
	
%><%
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	Connection connection=DriverManager.getConnection(url); 
	Statement statement = connection.createStatement(); 
	String sql="SELECT * FROM "+tableName; 
	ResultSet rs = statement.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统管理员操作界面</title>
<link rel="stylesheet" href="../resource/layui/css/layui.css">
<style type="text/css">
.logo {
    position: absolute;
	margin-left:3px;
	margin-top:6px;
    width:105px;
    height:40px;
}

.layui-layout-admin .layui-header {
    background-color: #f9e9c3;
    float:top;
}
.layui-header {
    z-index: 1000;
}
.header .layui-nav {
    position: absolute;
    right: 0;
    padding: 0;
}
.layui-nav {
    color: #fff;
    border-radius: 2px;
    font-size: 0;
    box-sizing: border-box;
}
.form a{
	border-left:1px solid black;border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black;		
	display:inline-block;
	width:120px;
	font-size:12px;
	margin-right:1px;
	height:30px;
	text-align:center;
	overflow-y:auto
}
img{
	width:auto;
	height:auto;
}

button{
		margin-top:2px;
        left: 0;
}
input{
	margin:2px;
}

</style>

</head>
<body>

<!--
用户权限
	添加或删除用户、更改用户权限。user-user(全都是input框，包含密码(password),权限等级(users),编号(id), 使用人(use_name))
仓管员相关记录
	借出记录-data_jiaju_all_borrowed
	归还记录-data_jiaju_all_giveback
	维修上报记录-data_jiaju_all_repair
维修员相关记录
	维修完成记录-data_jiaju_all_repaired
	维修完成入库记录-data_jiaju_all_repaired_ru
	报废上报记录-data_jiaju_all_bad_1_1
	采购入库上报记录-data_jiaju_all_applied_1
	出库记录-data_jiaju_chu
监管员相关记录
	采购申请处理记录(通过)-data_jiaju_all_applied_2
	采购申请处理记录(不通过)-data_jiaju_all_applied_disagree
	报废申请处理记录(通过)-data_jiaju_all_bad_2
Workcell经理相关记录
	采购申请处理记录(通过)-data_jiaju_all_applied_3
	报废申请处理记录(通过)-data_jiaju_all_bad_3
	
  -->

<div style="background-color:#f9e9c3;float:top;" class="layui-header header header-demo" spring>
  <div class="layui-main">
    <a class="logo">
      <img class="logo" src="../resource/images/jiepu1(已去底).jpg" alt="layui">
    </a>
    
    <ul class="layui-nav " >
      <li class="layui-nav-item layui-this">
        <a href="work-5-1.jsp" style="background-color: #f9e9c3;"><font color="black">操作界面</font></a> 
      </li>
      <li class="layui-nav-item">
        <a href="/demo/" style="background-color: #f9e9c3;"><font color="black">休闲</font></a>
      </li>
    </ul>
  </div>
</div>

	<div style="">
		<ul class="layui-nav layui-nav-tree layui-bg-blue" lay-filter="test" style="float:left;width:auto">
		  <li class="layui-nav-item layui-nav-itemed" >
		    <a href="javascript:;"><font color="black"><b>用户权限</b></font></a>
		    <dl style="background-color:#fff;" class="layui-nav-child layui-bg-blue">
		      <dd><a href="work-5-1.jsp" class="layui-this">用户权限相关操作</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;"><font color="black"><b>仓管员相关记录</b></font></a>
		    <dl class="layui-nav-child">
		      <dd><a href="work-5-2.jsp" >借出记录</a></dd>
		      <dd><a href="work-5-3.jsp" >归还记录</a></dd>
		      <dd><a href="work-5-4.jsp" >维修上报记录</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;"><font color="black"><b>维修员相关记录</b></font></a>
		    <dl class="layui-nav-child">
		      <dd><a href="work-5-5.jsp" >维修完成记录</a></dd>
		      <dd><a href="work-5-6.jsp" >维修完成入库记录</a></dd>
		      <dd><a href="work-5-7.jsp" >报废上报记录</a></dd>
		      <dd><a href="work-5-8.jsp" >采购入库上报记录</a></dd>
		      <dd><a href="work-5-9.jsp" >出库记录</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;"><font color="black"><b>监管员相关记录</b></font></a>
		    <dl class="layui-nav-child">
		      <dd><a href="work-5-10.jsp" >采购申请处理记录(通过)</a></dd>
		      <dd><a href="work-5-11.jsp" >采购申请处理记录(不通过)</a></dd>
		      <dd><a href="work-5-12.jsp" >报废申请处理记录(通过)</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;"><font color="black"><b>Workcell经理相关记录</b></font></a>
		    <dl class="layui-nav-child">
		      <dd><a href="work-5-13.jsp" >采购申请处理记录(通过)</a></dd>
		      <dd><a href="work-5-14.jsp" >报废申请处理记录(通过)</a></dd>
		    </dl>
		  </li>
		  <img alt="" src="../resource/images/logo.png" style="height:350px;margin-top:20px;">
		</ul>
	</div>


<div style="border:1px solid black;width:auto;float:right;margin:3px;margin-right:5px;">
	<div style="height:30px;display:block;border:1px solid black;margin:2px;text-align:center">
		<b style="">权限说明:0是仓管员,1是维修员,2是监管员,3是workcell经理,4是总管理</b>
	</div>
	<form name="form1" class="form" action="" method="post" id="form1" style="float:right;border:1px solid black;margin:2px;overflow:auto;white-space:nowarp;width:1000px;height:550px;background:white;text-align:center;">
				<nobr><a>编号</a><a>密码</a><a>权限等级</a><a>使用人</a><a>删除码(666)/更改码(999)</a><a>操作</a></nobr>
	    		<%
	    		int i = 0;
	    		int k = 0;
	    		while(rs.next()){ 
	    			i++;
	    		%>
	    		<br><a><input style="border:0px;width:78px;height:26px;"  name="id<%=i%>" value="<%=rs.getString("id")%>"></a><a><input style="border:0;width:78px;height:26px;" name="password<%=i%>" value="<%=rs.getString("password")%>"></a><a><input style="border:0;width:78px;height:26px;" name="users<%=i%>" value="<%=rs.getString("users")%>"></a><a><input style="border:0;width:78px;height:26px;" name="useman<%=i%>" value="<%=rs.getString("useman")%>"></a><a><input style="border:0px;width:78px;height:26px;" name="deleteNo<%=i%>"></a><a><button style="margin:4.5px;" onclick="delete<%=i%>()">删除</button>&nbsp;<button style="margin:4.5px;" onclick="change<%=i%>()">更改</button></a>
	    		
	    		<%} %>
	    		<input name="all" value="<%=i %>" hidden="">
	    		<br><a><input placeholder="编号为10位数字" style="border:0;width:110px;height:26px;" name="addid"></a><a><input style="border:0;width:110px;height:26px;" name="addpassword" placeholder="默认密码为123456"></a><a><input style="border:0;width:110px;height:26px;" name="addusers"></a><a><input style="border:0;width:110px;height:26px;" name="adduseman"></a><a><input readonly="" style="border:0;width:78px;height:26px;" placeholder="无需填写"></a><a><button style="margin:4.5px;width:60px;">添加</button></a>
	 </form>
</div>


<script src="../resource/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(["element","jquery","form","table"],function(){
		var $ = layui.jquery;
		var element = layui.element;
		var form = layui.form;
		var table = layui.table;
		
		
		$(function () {
		    $("#form1 img").on('click', function () {
		    	var url=$("#form1 img").attr("src");
		        layer.photos({
		            photos: '#form1',
		            shadeClose: false,
		            src: url,
		            area:['auto','auto'],
		            closeBtn: 2,
		            anim: 0
		        });
		    })
		    
		})
			
	})
<%
k=i;
while(k>=1){%>	
function delete<%=k%>(){
		document.form1.action="删除用户.jsp";
		document.form1.submit();
	}
function change(){
	document.form1.action="更改用户.jsp";
	document.form1.submit();
}
	
<%k--;}%> 

</script>
</body>
</html>