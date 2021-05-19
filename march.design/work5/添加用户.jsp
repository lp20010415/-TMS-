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
	    	
     	String adduseman = request.getParameter("adduseman"+i);
     	String addid = request.getParameter("addid"+i);
     	String addpassword = request.getParameter("addpassword"+i);
     	String addusers = request.getParameter("addusers"+i);     	
     if(addpassword == "") {addpassword = "123456";}
     if(addid != ""){if(addid != "^[0-9]*$"){message="编号里有非数字!";}}
     if(adduseman != "" && addid.length() == 10 && addpassword != "" && addusers != ""){
	     ps.addBatch("insert into user (id,pasword,users,useman) values '"+addid+"'"+addpassword+"'"+addusers+"'"+"'"+adduseman+"'");     
	     ps.executeBatch();
	     message="添加成功!";
     }if(adduseman == ""){
    	 message="更改失败,使用人未填写";
     }if(addid == ""){
    	 message="更改失败,编号未填写";
     }if(addusers == ""){
    	 message="更改失败,权限等级未填写";
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