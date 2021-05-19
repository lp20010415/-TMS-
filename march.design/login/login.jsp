<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" %> 
<%@ page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" href="../resource/layui/css/layui.css">
<style type="text/css">
.layui-input-block{
	width:190px;
}
.layui-form-item{
	margin-left:-15px;
	
}
.layui-form-label{
	font-weight:bolder;
}

</style>
</head>
<body>
<div style="postion:relative;">
	<img src="../resource/images/jiepu1.jpg" style="margin-top:5%;background:center;width:100%;height:100%;">
	<div class="t" style="opacity:0.3;position: absolute;top: 0; left: 0;margin-left:35%;margin-top:10%;border-radius:3px;border:2px solid #CFCFCF;width:330px;height:240px;background:#DCDCDC;"></div>	
</div>
		<form action="login_check.jsp" lay-filter="user-data" action="" class="layui-form" method="post" style="position: absolute;top: 0; left: 0;margin-left:35%;margin-top:10%;">
				<div class="layui-form-item" >
					<div class="layui-inline" style="margin-top:15px;">
						<label class="layui-form-label" style="font-weight:bolder;">编号:</label>
						<div class="layui-input-inline" >
							<input lay-filter="test" lay-verify="id" type="text" name="id" placeholder="请输入编号" autocomplete="off" class="layui-input" style="height:35px;" >
						</div>
					</div>
				</div>
				
				<div class="layui-form-item" >
					<div class="layui-inline">
						<label class="layui-form-label">密码:</label>
						<div class="layui-input-inline" >
							<input  lay-verify="pass" type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input" style="height:35px;">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">管理层:</label>
					<div class="layui-input-block">
						<select id="test" name="users" lay-verify="required">
							<option value=""></option>
							<option value="0">初级用户</option>
							<option value="1">高级用户</option>
							<option value="2">监管员</option>
							<option value="3">Workcell经理</option>
							<option value="4">系统管理员</option>
						</select>
					</div>
				</div>
				
				<div class="layui-form-item">
					
				    <div class="layui-input-block">
				    	<img src="../resource/images/login-log.jpg" style="margin-left:-60px;width:130px;height:45px;">
				    	<!-- <input type="submit" value = "登陆!"> -->
				    	<button lay-submit="" type="submit" class="layui-btn layui-btn-normal" id="login" style="margin-left:52px;margin-top:10px;font-weight:bolder;">登录</button>
				    </div>
				</div>
		</form>

<script language="javascript">
function checkForm(){
	alert("测试")
}
</script>

<script src="../resource/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(["jquery","element","form"],function(){
		var $ = layui.jquery;
		var element = layui.element;
		var form = layui.form;
		$("#test").click(function(){
			alert($(this).html())
			location.href="/work/work.jsp";
		})
		
		form.on('submit(formDemo)', function(data){
		    layer.msg(JSON.stringify(data.field));
		    return false;
		    
		    
		  });
		form.verify({
			
			id:[
				/^\d+$|^\d+[.]?\d+$/
				,"编号必须为数字!"
			]
			,pass:[
				/^[\S]{6,12}$/
			    ,'密码必须6到12位，且不能出现空格'
			]
		});
		
		layui.$('#login').on('click', function(){
		    var data = form.val('user-data');
		    /* alert(JSON.stringify(data.id));*/
		    let users = data.users;
		    let id = data.id;
		    let password = data.password;
		     
		    console.info(users)
		  });
	})
</script>
</body>
</html>