<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"	%>
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
     
     
     String url1 = request.getParameter("url");
     
     
     int i = Integer.parseInt(request.getParameter("all"));
	 String borrower = null;
	 String bianhao = null;
	 String badreason = null;
	 String badimg = null;
     while(i>=1){
     	
     	String test = request.getParameter("bianhao"+i);
     	String test2 = request.getParameter("borrower"+i);
		String test3 = request.getParameter("badreason"+i);
		String test4 = request.getParameter("badimg"+i);
     	if(test != "" && test2 != "" && test3 != ""){
     		badimg = test4;
     		badreason = test3;
     		borrower = test2;
     		bianhao = test;
     		i = 0;
     	}
     	i--;
     }
     
     Statement ps = conn.createStatement();
     if(borrower != null){
	     ps.addBatch("INSERT INTO data_jiaju_repair (状态,照片,库位,经办人,采购单据号,建档日期,生产日期,PartNo,Model,Family,名称,夹具编号) SELECT 状态,照片,库位,经办人,采购单据号,建档日期,生产日期,PartNo,Model,Family,名称,夹具编号 FROM data_jiaju WHERE 夹具编号="+"'"+bianhao+"'");
	     ps.addBatch("UPDATE data_jiaju_repair set 状态='暂停',上报时间 ='"+date+",所借人或上报人='"+borrower+"',故障描述='"+badreason+"',故障图片='"+badimg+"' WHERE 夹具编号="+"'"+bianhao+"'");
	     ps.addBatch("insert into data_jiaju_all_repair select * from data_jiaju_repair where 夹具编号="+"'"+bianhao+"'");
	     ps.addBatch("DELETE FROM data_jiaju WHERE 夹具编号="+"'"+bianhao+"'");
	     
	     ps.executeBatch();
	     message="上报成功!";
     }if(borrower == null){
    	 message="上报失败，上报人未写!";
     }if(badreason == null){
    	 message="上报失败，故障描述未写!";
     }
    
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta http-equiv="refresh" content="0.01;url=<%=url1%>">
</head>
<body onload="alert('<%=message%>')">

	
</body>
</html>