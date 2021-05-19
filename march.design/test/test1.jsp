<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
%>
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %> 


     <%!//定义若干个数据库连接常量
     
   //驱动程序名 
     String driverName="com.mysql.jdbc.Driver"; 
   	  //数据库名 
     public static final String dbName="jiaju"; 
     //表名 
     public static final String userName="root";
     public static final String userPasswd="root";
     public static final String tableName="data_jiaju_borrowed"; 
     public static final String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=UTF-8";
     
    
     
     %><%
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection conn = DriverManager.getConnection(url);
     request.setCharacterEncoding("UTF-8");
     String url = request.getParameter("test");
     String bianhao = request.getParameter("SearchValue");

     
     Statement ps = conn.createStatement();
     ps.addBatch("select * from data_jiaju where 夹具编号="+"'"+bianhao+"'");
     
     /* ps.addBatch("DELETE FROM data_jiaju WHERE 夹具编号="+"'"+bianhao+"'"); */
     
     ps.executeBatch();
     //获得数据结果集合 
     
     //确定数据集的列数，亦字段数 
     
    
%>    





    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="test2.jsp">
		<input name="1" value="1" hidden=""/>
		<input type="submit" value="哈哈"/>
	</form>


</body>
</html>