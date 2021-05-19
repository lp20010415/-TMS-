<%@ page contentType="text/html" pageEncoding="UTF-8"%>
  
  <html>
    <head>
  
  
    </head>
    
    <body>
    
 <center>
 	 <h1>登陆失败!!!<%String text = request.getParameter("unwarnning"); 
 	 	if(text.equals("1")){
 	 %>
 	 <b>权限选择错误!</b>
 	 <%}else if(text.equals("2")){ 
 	 %>
 	 <b>编号或密码错误!</b>
 	 <%} %>
 	 
 	 </h1>
 	 <span>
	 	<h1>三秒后自动跳转!</h1>
		<meta http-equiv="refresh" content="3;URL=login.jsp"> 
	 </span>
     <h2><a href= "login.jsp">点击重新登陆!!!!!!!!</a></h2>
 </center>
   </body>
 </html>