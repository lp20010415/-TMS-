<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %>     
    
<%
	
	
	String driverName="com.mysql.jdbc.Driver"; 
		  //数据库名 
	String dbName="jiaju"; 
	//表名 
	String userName="root";
	String userPasswd="root";
	String tableName="data_jiaju_applied_2"; 
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
<!-- Workcell经理 -->
<head>
<meta charset="UTF-8">
<title>Workcell经理操作界面</title>
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
	width:80px;
	font-size:12px;
	margin-right:1px;
	height:35px;
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


</style>

</head>
<body>

<!--
夹具处理
	采购入库申请-data_jiaju_applied_2
	报废申请-data_jiaju_bad_2

  -->

<div style="background-color:#f9e9c3;float:top;" class="layui-header header header-demo" spring>
  <div class="layui-main">
    <a class="logo">
      <img class="logo" src="../resource/images/jiepu1(已去底).jpg" alt="layui">
    </a>
    
    <ul class="layui-nav " >
      <li class="layui-nav-item layui-this">
        <a href="work-4-1.jsp" style="background-color: #f9e9c3;"><font color="black">操作界面</font></a> 
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
		    <a href="javascript:;"><font color="black"><b>夹具处理</b></font></a>
		    <dl style="background-color:#fff;" class="layui-nav-child layui-bg-blue">
		      <dd><a href="work-4-1.jsp" class="layui-this">采购入库申请</a></dd>
		      <dd><a href="work-4-2.jsp" >报废申请</a></dd>
		    </dl>
		  </li>
		  <img alt="" src="../resource/images/logo.png" style="height:350px;margin-top:20px;">
		</ul>
	</div>


<div style="border:1px solid black;width:auto;float:right;margin:3px;margin-right:20px;">
	<div style="height:30px;display:block;border:1px solid black;margin:2px;">
		<form style="height:20px;margin-top:5px;float:right;" method="post" action="查询4.jsp">
			<input style="width:100px;height:20px;float:left;border:1px solid black" type="text" name="SearchValue" placeholder="请输入夹具编号">
			<input name="2" value="1" hidden=""> 
			<input style="width:76px;height:22px;" type="submit" value="查找" /> 			
		</form>
	</div>
	<form name="form1" class="form" action="" method="post" id="form1" style="float:right;border:1px solid black;margin:2px;overflow:auto;white-space:nowarp;width:1020px;height:490px;background:white;">
				<nobr><a>夹具编号</a><a>名称</a><a>Family</a><a>Model</a><a>PartNo</a><a>生产日期</a><a>建档日期</a><a>采购单据号</a><a>经办人</a><a>库位</a><a>照片</a><a>状态</a><a>申请人</a><a>申请时间</a><a>一审审核人</a><a>一审提交时间</a><a>审核人</a><a>操作</a></nobr>
	    		<%
	    		int i = 0;
	    		int k = 0;
	    		while(rs.next()){ 
	    			i++;
	    		%>
	    		<nobr><a><input readonly="true" style="border:0;width:78px;;height:30px;" name="bianhao<%=i %>" value="<%=rs.getString("夹具编号") %>"></a><a><%=rs.getString("名称") %></a><a><%=rs.getString("Family") %></a><a><%=rs.getString("Model") %></a><a><%=rs.getString("PartNo") %></a><a><%=rs.getString("生产日期") %></a><a><%=rs.getString("建档日期") %></a><a><%=rs.getString("采购单据号") %></a><a><%=rs.getString("经办人") %></a><a><%=rs.getString("库位") %></a><a><img style="width:79px;height:45px;margin:0;" src="<%=rs.getString("照片") %>"></a><a><%=rs.getString("状态") %></a><a><%=rs.getString("申请人")%></a><a><%=rs.getString("申请时间") %></a><a><%=rs.getString("一审审核人") %></a><a><%=rs.getString("一审提交时间") %><a><input name="checkman<%=i %>" style="width:76px;height:35px;border:0;"></a><a><button onclick="btn入库<%=i %>()" type="button" id="btn" style="width:55px;height:25px;margin:5px;">入&nbsp;&nbsp;库</button></a></nobr>
	    		
	    		<%} %>
	    		<input name="all" value="<%=i %>" hidden="">
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
function btn入库<%=k%>(){
		document.form1.action="入库.jsp";
		document.form1.submit();
	}

	
<%k--;}%>

</script>
</body>
</html>