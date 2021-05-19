<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %> 

<% //获取时间
request.setCharacterEncoding("utf-8");
SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss");
String date = df.format(new Date());%>  

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
     String message;
    
     
     %><%
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection conn = DriverManager.getConnection(url);
     Statement ps = conn.createStatement();
     
     int i = Integer.parseInt(request.getParameter("all"));
	 String checkman = null;
	 String bianhao = null;
	 
     while(i>=1){
     	
     	String test = request.getParameter("bianhao"+i);
     	String test2 = request.getParameter("checkman"+i);

     	if(test != "" && test2 != ""){
     		checkman = test2;
     		bianhao = test;
     		i = 0;
     	}
     	i--;
     }
     
     
     if(checkman != null){
    	 ps.addBatch("insert into data_jiaju_applied_2 (申请人,申请时间,状态,照片,库位,经办人,采购单据号,建档日期,生产日期,PartNo,Model,Family,名称,夹具编号) select 申请人,申请时间,状态,照片,库位,经办人,采购单据号,建档日期,生产日期,PartNo,Model,Family,名称,夹具编号 from data_jiaju_applied_1 where 夹具编号='"+bianhao+"'");     
	     ps.addBatch("update data_jiaju_applied_2 set 状态='一审通过',一审审核人='"+checkman+"',"+"一审提交时间='"+date+"' where 夹具编号='"+bianhao+"'");
	     ps.addBatch("update data_jiaju_all_applied_1 set 状态='一审通过' where 夹具编号='"+bianhao+"'");
	     ps.addBatch("insert into data_jiaju_all_applied_2 select * from data_jiaju_applied_2 where 夹具编号='"+bianhao+"'");
	     ps.addBatch("delete from data_jiaju_applied_1 where 夹具编号='"+bianhao+"'");
	     ps.executeBatch();
	     message="成功!";
     }else{
    	 message="失败,审核人未写!";
     }
    
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="refresh" content="0.01;url=work-3-1.jsp">
</head>
<body onload="alert('<%=message%>')">

</body>
</html>