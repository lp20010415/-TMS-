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
<title>display普通表格</title>  
<style type="text/css">  

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
<div>
	<div style="height:30px;">
		<form style="height:20px;margin:0;float:right;" method="post" action="查询.jsp">
			<input style="width:100px;height:20px;float:left;border:1px solid black" type="text" name="SearchValue" placeholder="请输入夹具编号">
			<input name="2" value="1" hidden=""> 
			<input style="width:76px;height:24px;" type="submit" value="查找" /> 			
		</form>
	</div>
  
    <form class="form" action="../work/借.jsp" method="post" id="photo-list" style="float:right;overflow:auto;white-space:nowarp;width:500px;margin-top:0;">
			<nobr><a >夹具编号</a><a>名称</a><a>Family</a><a>Model</a><a>PartNo</a><a>生产日期</a><a>建档日期</a><a>采购单据号</a><a>经办人</a><a>库位</a><a>照片</a><a>状态</a><a>所借人</a><a style="border-right:1px solid black;">操作</a></nobr>
    		<%while(rs.next()){ %>
    		<input name="1" value="0" hidden=""/>
    		<nobr><a ><input readonly="true" style="border:0;width:78px;;height:30px;" name="bianhao" value="<%=rs.getString(13) %>"></a><a><%=rs.getString(12) %></a><a><%=rs.getString(11) %></a><a><%=rs.getString(10) %></a><a><%=rs.getString(9) %></a><a><%=rs.getString(8) %></a><a><%=rs.getString(7) %></a><a><%=rs.getString(6) %></a><a><%=rs.getString(5) %></a><a><%=rs.getString(4) %></a><a><img style="width:79px;height:45px;margin:0;" src="<%=rs.getString(3) %>"></a><a><%=rs.getString(2) %></a><a><input style="border:0;width:78px;;height:30px;" name="borrower" /></a><a style="border-right:1px solid black;"><button value="<%=request.getRequestURL()%>" name="test" type="submit" id="btn" style="width:50px;height:25px;">借&nbsp;&nbsp;出</button></a></nobr>
    		
    		<%} %>
    </form>
</div>    
    
    <script src="../resource/layui/layui.js"></script>
		<script type="text/javascript">
		layui.use(["jquery","layer"],function(){
			var $ = layui.jquery;
			var layer = layui.layer;
			var test = window.location.href;
			$(function () {
			    $("#photo-list img").on('click', function () {
			    	var url=$("#photo-list img").attr("src");
			        layer.photos({
			            photos: '#photo-list',
			            shadeClose: false,
			            src: url,
			            area:['auto','auto'],
			            closeBtn: 2,
			            anim: 0
			        });
			    })
			    
			})
			
			    
			    /* $(function amplificationImg(url) {
			    	$("#photo-list img").on('click', function () {
			        	var url=$("#photo-list img").attr("src");
			        	alert(url);
				        layer.open({
				            type: 1,
				            title: false,
				            closeBtn: 0,
				            shadeClose: true,
				            area: ['400px','400px'], //宽高
				            content: "<img src=" + url + ";style=width:400px;height:400px"+" />"
				        });
			    	})
				}); */
				
				
				
				
			
		})

		</script>
    
    
       
</body>  
</html>   

