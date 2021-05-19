<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %>     
    
<%
	String searchValue = request.getParameter("SearchValue");
	
	String driverName="com.mysql.jdbc.Driver"; 
		  //数据库名 
	String dbName="jiaju"; 
	//表名 
	String userName="root";
	String userPasswd="root";
	String tableName="data_jiaju_giveback"; 
	String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=UTF-8";
	
	
%><%
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	Connection connection=DriverManager.getConnection(url); 
	Statement statement = connection.createStatement(); 
	String sql="select * from "+tableName+" where 夹具编号 like "+"'%"+searchValue+"%'"; 
	ResultSet rs = statement.executeQuery(sql);
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	<div style="text-align:center;">
		<button style="float:left" onclick="back()">返回</button>
		<b><font>查询内容</font></b>
	</div>
	<hr/>
	<form name="form1" class="form" action="" method="post" id="form1" style="float:right;border:1px solid black;margin:2px;overflow:auto;white-space:nowarp;width:auto;height:490px;background:white;text-align:center">
				<nobr><a >夹具编号</a><a>名称</a><a>Family</a><a>Model</a><a>PartNo</a><a>生产日期</a><a>建档日期</a><a>采购单据号</a><a>经办人</a><a>库位</a><a>照片</a><a>状态</a><a>所借人</a><a>归还人</a><a>借出时间</a><a>归还时间</a><a style="border-right:1px solid black;">操作</a></nobr>
	    		<%
	    		int i = 0;
	    		int k = 0;
	    		while(rs.next()){ 
	    			i++; 
	    			%>
	    		
	    		<nobr><a ><input readonly="true" style="border:0;width:78px;;height:30px;" name="bianhao<%=i %>" value="<%=rs.getString("夹具编号") %>"></a><a><%=rs.getString("名称") %></a><a><%=rs.getString("Family") %></a><a><%=rs.getString("Model") %></a><a><%=rs.getString("PartNo") %></a><a><%=rs.getString("生产日期") %></a><a><%=rs.getString("建档日期") %></a><a><%=rs.getString("采购单据号") %></a><a><%=rs.getString("经办人") %></a><a><%=rs.getString("库位") %></a><a><img style="width:79px;height:45px;margin:0;" src="<%=rs.getString("照片") %>"></a><a><%=rs.getString("状态") %></a><a><%=rs.getString("所借人或上报人")%></a><a><%=rs.getString("归还人") %></a><a><%=rs.getString("借出时间") %></a><a><%=rs.getString("归还时间")%></a><a style="border-right:1px solid black;"><button onclick="btn入库<%=i %>()" type="button" id="btn" style="width:45px;height:25px;">入库</button></a></nobr>
	    		
	    		<%} %>
	    		<input name="all" value="<%=i %>" hidden="">
	 </form>




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
function back(){
		history.go(-1);
	}	
	
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