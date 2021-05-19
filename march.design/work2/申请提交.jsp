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
     


	 String bianhao = request.getParameter("bianhao");
	 String mingcheng = request.getParameter("mingcheng");
	 String family = request.getParameter("family");
	 String model = request.getParameter("model");
	 String partNo = request.getParameter("partNo");
	 String productdate = request.getParameter("productdate");
	 String setdate = request.getParameter("setdate");
	 String buyNo = request.getParameter("buyNo");
	 String man = request.getParameter("man");
	 String kuwei = request.getParameter("kuwei");
	 String imgurl = request.getParameter("imgurl");
	 String submitman = request.getParameter("submitman");
	 
     
     
     if(bianhao != "" && mingcheng != "" && family != "" && model != "" && partNo != "" && productdate != "" && setdate != "" && buyNo != "" && man != "" && kuwei != "" && imgurl != "" && submitman != ""){
	     ps.addBatch("insert into data_jiaju_applied_1 (状态,照片,库位,经办人,采购单据号,建档日期,生产日期,PartNo,Model,Family,名称,夹具编号) values ('申请中','"+imgurl+"','"+kuwei+"','"+man+"','"+buyNo+"','"+setdate+"','"+productdate+"','"+partNo+"','"+model+"','"+family+"','"+mingcheng+"','"+bianhao+"')");     
	     ps.addBatch("update data_jiaju_applied_1 set 申请人='"+submitman+"',"+"申请时间='"+date+"' where 夹具编号='"+bianhao+"'");
	     ps.addBatch("insert into data_jiaju_all_applied_1 select * from data_jiaju_applied_1 where 夹具编号='"+bianhao+"'");
	     ps.executeBatch();
	     message="提交成功!";
     }if(bianhao == ""){
    	 message = "编号未填写";
     }if(mingcheng == ""){
    	 message = "名称未填写";
     }if(family == ""){
    	 message = "Family未填写";
     }if(model == ""){
    	 message = "Model未填写";
     }if(partNo == ""){
    	 message = "PartNo未填写";
     }if(productdate == ""){
    	 message = "生产日期未填写";
     }if(setdate == ""){
    	 message = "建档日期未填写";
     }if(buyNo == ""){
    	 message = "采购单据号未填写";
     }if(man == ""){
    	 message = "经办人未填写";
     }if(kuwei == ""){
    	 message = "库位未填写";
     }if(imgurl == ""){
    	 message = "图片地址未填写";
     }if(submitman == ""){
    	 message = "申请人未填写";
     }
    
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="refresh" content="0.01;url=work-2-4.jsp">
</head>
<body onload="alert('<%=message%>')">

</body>
</html>