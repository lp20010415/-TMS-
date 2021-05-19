<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
    
<%
request.setCharacterEncoding("utf-8");
int i = Integer.parseInt(request.getParameter("all"));

while(i>1){
	
	String test = request.getParameter("input"+i);
	if(test != ""){
		out.println("成功!");
		out.println(test);
	}
	i--;
}
out.println(request.getParameter("input1"));

Calendar cal=Calendar.getInstance();
int y=cal.get(Calendar.YEAR);
int m=cal.get(Calendar.MONTH); 
int d=cal.get(Calendar.DATE); 
int h=cal.get(Calendar.HOUR_OF_DAY);
int mi=cal.get(Calendar.MINUTE);
int s=cal.get(Calendar.SECOND);
String date = y+"年"+m+"月"+d+"日"+h+"时"+mi+"分"+s+"秒";%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="">

<a href="土匪土匪.jsp">啊哈哈哈</a>

</body>
</html>