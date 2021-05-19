<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<li id="haha">
	<a id="haha1" href="www.123.com" class="yeah"></a>
	<a id="haha12" href="www.1236.com" class="yeah2" recatid="123"></a>
	<button onclick="cesi()">哈哈</button>
</li>

<script type="text/javascript">
	function cesi(){
		document.getElementsByTagName("")//获取某标签
		//.getAttribute();获取标签里的属性
		var ces = new Array();
		var ce = document.getElementById("haha1").attributes["href"].nodeValue;
		/* var ce1 = ce.attributes["href"].nodeValue;
		console.log(ce1); */
		console.log(document.getElementById("haha1").attributes["href"].nodeValue);
		console.log("哈哈");
		var a = document.getElementById("haha12");
		console.log(a.getAttribute("href"));
		
		/*document.write("");
		console.log(ce); */
	}
</script>
</body>
</html>