<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String text = "black1";
    String gogogo = text.replaceAll(".*[^\\d](?=(\\d+))","");
    out.print(gogogo+"-----");
    String url= request.getRequestURI();
    url=java.net.URLDecoder.decode(new String(url.getBytes("ISO-8859-1"), "UTF-8"), "UTF-8");
    out.print(url);
    %>
<html>    
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>demo</title>

</head>
<body >
	<table>
		<tr>
			<td>
				<input type="text" id="demo_input" value="demo">
				<input type="button" onclick="show();" value="show">
			</td>
		</tr>
	</table>
	<a id="aa">哈哈</a>
	<button onclick="test()">获取a标签值测试</button>
	<form name="form1" id="form1" action="" method="post">
	<%
	int i = 0;
	int k = 0;
	while(i<5) {
		i++;
		out.println(i);
		k = i;
	%>
		
		<input id="input1" name="input<%=i %>" type="text" value=""/>
		<button type="button" onclick="btn<%=i%>()"></button>
	<%}%>
		<input name="all" value="<%=i %>">
	</form>
	<script type="text/javascript">
	
function test(){
	alert(document.getElementById('aa').text)
}	
	
function show(){
var value = document.getElementById('demo_input').value;//重点在此
alert(value);
}
<%while(k>=1){

%>
function btn<%=k%>(){
	document.form1.action="test-time.jsp";
	document.form1.submit();
}
<%k--;}%>

</script>
</body>
</html>