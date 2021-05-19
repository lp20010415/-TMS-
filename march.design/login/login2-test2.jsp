
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
	/* String id = request.getParameter("id");
	String password = request.getParameter("password");
	String users = request.getParameter("users"); */
	String[] id = new String[numColumns];
	List<Map<String,String>> list = new ArrayList<Map<String,String>>();//创建Arraylist
    while(rs.next()) {
        Map<String,String> map = new HashMap<String,String>();//要每次创建一个新的映射表，不然只会保存最后一组数据。
        Map<String,String> map2 = new HashMap<String,String>();
        map.put("borrower",rs.getString(1));
        map.put("state",rs.getString(2));
        map.put("photo",rs.getString(3));
        map.put("size",rs.getString(4));
        map.put("man",rs.getString(5));
        map.put("buyNo",rs.getString(6));
        map.put("setDate",rs.getString(7));
        map.put("ProDate",rs.getString(8));
        map.put("PartNo",rs.getString(9));
        map.put("Model",rs.getString(10));
        map.put("Family",rs.getString(11));
        map.put("name",rs.getString(12));
        map.put("jiaju-id",rs.getString(13));
        list.add(map);//数据保存在list中
        
    }

    //用GSON包中的方法序列化json字符串
    Gson gson = new Gson();
    String json = null;
    json = gson.toJson(list);
    boolean test1 = true;
    System.out.println(json);
    request.setCharacterEncoding("UTF-8") ;
%>
<%if(flag == true){
	choose = choose + 1;
	url_1 = "../work/work-"+choose+".jsp";
	%>
	<span style="font-size:18px;">   
	</span><span style="font-size:24px;">
		<meta http-equiv="refresh" content="3;URL=../work/work-<%=choose %>.jsp"> 
	</span>
	<%}else if(warnning == 1){ %>
	<jsp:forward page="login_failure.jsp">
         <jsp:param name="unwarnning" value="<%=warnning %>" />
     </jsp:forward>
	<%}if (test1 = true){%>
	<jsp:forward page="../work/index1.jsp">
         <jsp:param name="unwarnning" value="<%=json %>" />
     </jsp:forward>
	<%} %>


 	
