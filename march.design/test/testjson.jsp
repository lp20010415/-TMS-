<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%out.print(request.getParameter("s")); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>从mysql数据库中读取出数据并封装成json,显示在jsp页面上(数据库中的数据值中带了双引号和斜杠等这些特殊字符)</title>
<style type="text/css">
div {
background-color: #71C671;
border-radius:5px;
border:4px solid green;
}
</style>
<script type="text/javascript">
	var testJson = {"userName":"t\om"};
	//经过测试，会打印出tom
	console.log(testJson.userName);
	//从request中取出json数据
	var myJsonStr = ${requestScope.jsonStr}
	window.onload = function() {
		// 	alert(myJsonStr.length);
		var div1Node = document.getElementById("div1");
		for (var index = 0; index < myJsonStr.length; index++) {
			var inputNode = document.createElement("input");
			var brNode = document.createElement("br");
			var br2Node = document.createElement("br");
			inputNode.type = "text";
			inputNode.size = 50;
			inputNode.value = myJsonStr[index];
			div1Node.appendChild(inputNode);
			div1Node.appendChild(brNode);
			div1Node.appendChild(br2Node);
		}
	} 
	
	//给文本框赋值
	function setInputNodeValue(){
		var inputNode = document.getElementById("input1");
		inputNode.size = 60;
		//节点.value这种写法，效果是，直接给节点赋值(不会给节点添加value属性)
		inputNode.value = "江西省赣州市于都县";
	}
	
	//给文本框赋值
	function setInput2NodeValue(){
		var input2Node = document.getElementById("input2");
		input2Node.setAttribute("size", "60");
		//节点.setAttribute("value", "")这种写法，效果是，不但给节点赋值，还会给节点添加value属性
		input2Node.setAttribute("value", "我的家乡在江西省赣州市于都县");
	}
</script>
</head>
<body>
<h2>从mysql数据库中读取出数据并封装成json,显示在jsp页面上(数据库中的数据值中带了双引号和斜杠等这些特殊字符)</h2>
<div id="div1"></div>
<input type="button" οnclick="setInputNodeValue()" value="点击我，给文本框赋值">
<input type="text" id="input1">
<br>
<input type="button" οnclick="setInput2NodeValue()" value="点击我，给文本框赋值">
<input type="text" id="input2">
</body>
</html>
