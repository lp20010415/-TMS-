<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html> 
<html>
<head>
<script type="text/javascript">

var a = 0;
var haha = document.getElementById("haha");
function test(){
			a = 1;
			check();
			
		}
function check(){
	alert("成功!");
	alert(a);
	/* if(document.getElementById("test").value == "维修"){
		document.form1.action="1.htm"
	}
	if(document.getElementById("test").value == "借出"){
		document.form1.action="2.htm"
	} */
	if(a == 1){
		document.form1.action="1.htm";
		document.form1.submit();
	}
		
}



</script>
</head>
<body>
<form id="ha" name="form1" method="post" action="">

	<button  id="haha" type="button" onclick="test()">哈哈</button>
</form>

</body>
</html> 