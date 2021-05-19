<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"	%>
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %> 

<% //获取时间
request.setCharacterEncoding("UTF-8");
%> 

     <%!//定义若干个数据库连接常量
     
   //驱动程序名 
     String driverName="com.mysql.jdbc.Driver"; 
   	  //数据库名 
     public static final String dbName="user"; 
     //表名 
     public static final String userName="root";
     public static final String userPasswd="root";
     public static final String tableName="user"; 
     public static final String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=UTF-8";
     String message;
    
     
     %><%
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection conn = DriverManager.getConnection(url);
     Statement ps = conn.createStatement();
     
     int i = Integer.parseInt(request.getParameter("all"));

	 String useman = null;
	 String deleteNo = null;
     while(i>=1){
     	
     	String test = request.getParameter("useman"+i);
     	String test2 = request.getParameter("deleteNo"+i);
     	if(test != ""){
     		deleteNo = test2;
     		useman = test;
     		i = 0;
     	}
     	i--;
     }
     
     
     if(useman != null && deleteNo == "666"){
	     ps.addBatch("delete from user where useman='"+useman+"'");     
	     ps.executeBatch();
	     message="删除成功!";
     }else{
    	 message="删除失败,删除码错误，或未填写";
     }
    
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="refresh" content="0.01;url=work-5-1.jsp">
</head>
<body onload="alert('<%=message%>')">

</body>
</html>