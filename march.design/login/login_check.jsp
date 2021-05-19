
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" %> 
<%@ page import="com.mysql.jdbc.Driver" %> 
<%@ page import="java.sql.*" %> 

  

     <%!//定义若干个数据库连接常量
     
   //驱动程序名 
     String driverName="com.mysql.jdbc.Driver"; 
   	  //数据库名 
     public static final String dbName="user"; 
     //表名 
     public static final String userName="root";
     public static final String userPasswd="root";
     public static final String tableName="user"; 
     public static final String url="jdbc:mysql://127.0.0.1/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=UTF-8";
     
     String url_1 = null;
     boolean flag = false;
     int test = 1;
     int warnning = 0;
     int choose;
     int num;
     
     
     %><%
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection conn=DriverManager.getConnection(url); 
     Statement statement = conn.createStatement(); 
     String sql="SELECT * FROM "+tableName; 
     ResultSet rs = statement.executeQuery(sql); 
     //获得数据结果集合 
     ResultSetMetaData rmeta = rs.getMetaData(); 
     //确定数据集的列数，亦字段数 
     int numColumns=rmeta.getColumnCount(); 
     
     
%><%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String users = request.getParameter("users");
	int checknum = Integer.parseInt(users);
	
	List<Map<String,String>> list = new ArrayList<Map<String,String>>();
	Map<String,String> map1 =  new HashMap<String,String>();
	map1.put("id",request.getParameter("id"));
	map1.put("users",request.getParameter("users"));
	map1.put("password",request.getParameter("password"));
	list.add(map1);

	
 	String[] data_id = new String[numColumns];
	String[] data_password = new String[numColumns];
	String[] data_users = new String[numColumns];
	
	String test=null;

	List<Map<String,String>> list1 = new ArrayList<Map<String,String>>();
	while(rs.next()){
		
		Map<String,String> map2 = new HashMap<String,String>();
		map2.put("id",rs.getString("id"));
		map2.put("users",rs.getString("users"));
		map2.put("password",rs.getString("password"));
		list1.add(map2);
		
		
	}
	System.out.println(list.get(0));
	System.out.println(list1.get(0));
	System.out.println(checknum);
	

	String te = list.get(0).toString();
	String pe = list1.get(checknum).toString();
	System.out.print(te+"------"+pe);
		if(te.equals(pe)){
			flag = true;
			choose = Integer.parseInt(users);
			warnning = 0;
			
		}else{
			warnning = 2;
		}
	
	
	
%><%if(flag == true && warnning == 0){
	choose = choose + 1;
	url_1 = "../work"+choose+"/work-"+choose+"-1.jsp";
	%>
	<span style="font-size:18px;">   
		</span><span style="font-size:24px;">
		<meta http-equiv="refresh" content="3;URL=<%=url_1 %>"> 
	</span>
	<%}else if(warnning == 1){ %>
	<jsp:forward page="login_failure.jsp">
         <jsp:param name="unwarnning" value="<%=warnning %>" />
     </jsp:forward>
	<%}else if (warnning == 2){ %>
	 <jsp:forward page="login_failure.jsp">
         <jsp:param name="unwarnning" value="<%=warnning %>" />
     </jsp:forward>
	<%} %>
<html>
  <head>
  </head>
  	<body>
		  <center>
		         <h1>登录成功，三秒自动跳转!</h1>
		         <h2><a href="<%=url_1%>">点击直接跳转!!!!!!!!</a></h2>
		  </center>
     </body>
</html>   
<hr>
 	
