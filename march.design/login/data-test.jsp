<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
     public static final String tableName="data_jiaju"; 
     public static final String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=UTF-8";
     
     String url_1 = null;
     boolean flag = false;
     int test = 1;
     int warnning = 0;
     int choose;
     String data_id;
     %><%
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection connection=DriverManager.getConnection(url); 
     Statement statement = connection.createStatement(); 
     String sql="SELECT * FROM "+tableName; 
     ResultSet rs = statement.executeQuery(sql); 
     //获得数据结果集合 
     ResultSetMetaData rmeta = rs.getMetaData(); 
     //确定数据集的列数，亦字段数 
     int numColumns=rmeta.getColumnCount(); 
     
%><%
	while(rs.next()){
	out.println(rs.getString(1));
	out.println(rs.getString(2));
	out.println(rs.getString(3));
	out.println(rs.getString(4));
}
%>