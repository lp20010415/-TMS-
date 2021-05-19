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
	String tableName="data_jiaju"; 
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
<title>仓管员操作界面</title>
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


</style>

</head>
<body>

<!--

夹具库
	可上线使用-data_jiaju
	维修夹具-data_jiaju_repair(暂停)
借/还夹具
	借出夹具-data_jiaju_borrowed(已借出)
	归还夹具-data_jiaju_giveback(已归还)
	

  -->

<div style="background-color:#f9e9c3;float:top;" class="layui-header header header-demo" spring>
  <div class="layui-main">
    <a class="logo">
      <img class="logo" src="../resource/images/jiepu1(已去底).jpg" alt="layui">
    </a>
    
    <ul class="layui-nav " >
      <li class="layui-nav-item layui-this">
        <a href="/doc/" style="background-color: #f9e9c3;"><font color="black">操作界面</font></a> 
      </li>
      <li class="layui-nav-item">
        <a href="/demo/" style="background-color: #f9e9c3;"><font color="black">休闲</font></a>
      </li>
    </ul>
  </div>
</div>

	<div style="">
		<ul class="layui-nav layui-nav-tree layui-bg-blue" lay-filter="test" style="float:left;width:auto">
		  <li class="layui-nav-item" >
		    <a href="javascript:;"><font color="black"><b>夹具库</b></font></a>
		    <dl style="background-color:#fff;" class="layui-nav-child layui-bg-blue">
		      <dd><a href="javascript:;" >可上线使用</a></dd>
		      <dd><a href="javascript:;" >不可上线使用</a></dd>
		      <dd><a href="" >已上报夹具</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;"><font color="black"><b>借/还夹具</b></font></a>
		    <dl class="layui-nav-child">
		      <dd><a href="" ><font>借出夹具</font></a></dd>
		      <dd><a href="" ><font>归还夹具</font></a></dd>
		    </dl>
		  </li>
		  <img alt="" src="../resource/images/logo.png" style="height:350px;margin-top:20px;">
		</ul>
	</div>


<div style="border:1px solid black;width:auto;float:right;margin:3px;margin-right:20px;">
	<div style="height:30px;display:block;border:1px solid black;margin:2px;">
		<form style="height:20px;margin-top:5px;float:right;" method="post" action="查询.jsp">
			<input style="width:100px;height:20px;float:left;border:1px solid black" type="text" name="SearchValue" placeholder="请输入夹具编号">
			<input name="2" value="1" hidden=""> 
			<input style="width:76px;height:22px;" type="submit" value="查找" /> 			
		</form>
	</div>
	<form name="form1" class="form" action="" method="post" id="form1" style="float:right;border:1px solid black;margin:2px;overflow:auto;white-space:nowarp;width:1020px;height:410px;background:white;">
				<nobr><a >夹具编号</a><a>名称</a><a>Family</a><a>Model</a><a>PartNo</a><a>生产日期</a><a>建档日期</a><a>采购单据号</a><a>经办人</a><a>库位</a><a>照片</a><a>状态</a><a>所借人</a><a style="border-right:1px solid black;width:">操作</a></nobr>
	    		<%while(rs.next()){ %>
	    		<input name="1" value="0" hidden=""/>
	    		<nobr><a ><input readonly="true" style="border:0;width:78px;;height:30px;" name="bianhao" value="<%=rs.getString(13) %>"></a><a><%=rs.getString(12) %></a><a><%=rs.getString(11) %></a><a><%=rs.getString(10) %></a><a><%=rs.getString(9) %></a><a><%=rs.getString(8) %></a><a><%=rs.getString(7) %></a><a><%=rs.getString(6) %></a><a><%=rs.getString(5) %></a><a><%=rs.getString(4) %></a><a><img style="width:79px;height:45px;margin:0;" src="<%=rs.getString(3) %>"></a><a><%=rs.getString(2) %></a><a><input style="border:0;width:78px;;height:30px;" name="borrower" /></a><a style="border-right:1px solid black;"><button onclick="btn1()" type="button" id="btn" style="width:30px;height:25px;">维修</button>&nbsp;<button onclick="btn2()" type="button" id="btn" style="width:30px;height:25px;">借出</button></a></nobr>
	    		
	    		<%} %>
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
function btn1(){
		document.form1.action="维修.jsp";
		document.form1.submit();
	}
function btn2(){
	document.form1.action="借.jsp";
	document.form1.submit();
	}

</script>
</body>
</html>