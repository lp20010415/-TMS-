<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>维修人员操作界面</title>
<link rel="stylesheet" href="../resource/layui/css/layui.css">
<style type="text/css">
.logo {
    position: absolute;
	margin-left:3px;
	margin-top:6px;
    width:105px;
    height:40px;
}

.layui-layout-admin .layui-header {
    background-color: #f9e9c3;
    float:top;
}
.layui-header {
    z-index: 1000;
}
.header .layui-nav {
    position: absolute;
    right: 0;
    padding: 0;
}
.layui-nav {
    color: #fff;
    border-radius: 2px;
    font-size: 0;
    box-sizing: border-box;
}
.form a{
	border-left:1px solid black;border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black;		
	display:inline-block;
	width:80px;
	font-size:12px;
	margin-right:1px;
	height:35px;
	text-align:center;
	overflow-y:auto
}
img{
	width:auto;
	height:auto;
}

button{
		margin-top:2px;
        left: 0;
}


</style>

</head>
<body>

<!--
夹具情况		
	上报夹具-data_jiaju_repair,状态暂停,两个选项(维修完成，报废->data_jiaju_bad_1);
	已维修夹具-data_jiaju_repaired,(入库)->data_jiaju_all_repaired(记录,维修完成时间,入库时间);
	已上报的报废夹具-data_jiaju_bad_1
采购入库夹具
	申请入库夹具(填写信息);-this
	已申请的夹具-data_jiaju_applied
	不同意入库-data_jiaju_applied_disagree
	

  -->

<div style="background-color:#f9e9c3;float:top;" class="layui-header header header-demo" spring>
  <div class="layui-main">
    <a class="logo">
      <img class="logo" src="../resource/images/jiepu1(已去底).jpg" alt="layui">
    </a>
    
    <ul class="layui-nav " >
      <li class="layui-nav-item layui-this">
        <a href="/doc/" style="background-color: #f9e9c3;"><font color="black">操作界面</font></a> 
      </li>
      <li class="layui-nav-item">
        <a href="/demo/" style="background-color: #f9e9c3;"><font color="black">休闲</font></a>
      </li>
    </ul>
  </div>
</div>

	<div style="">
		<ul class="layui-nav layui-nav-tree layui-bg-blue" lay-filter="test" style="float:left;width:auto">
		  <li class="layui-nav-item"  >
		    <a href="javascript:;"><font color="black"><b>夹具情况</b></font></a>
		    <dl style="background-color:#fff;" class="layui-nav-child layui-bg-blue">
		      <dd><a href="work-2-1.jsp" >上报的夹具</a></dd>
		      <dd><a href="work-2-2.jsp" >已维修夹具</a></dd>
		      <dd><a href="work-2-3.jsp" >已上报的报废夹具</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item layui-nav-itemed">
		    <a href="javascript:;"><font color="black"><b>采购入库夹具</b></font></a>
		    <dl class="layui-nav-child">
		      <dd><a href="work-2-4.jsp" class="layui-this">申请采购入库夹具</a></dd>
		      <dd><a href="work-2-5.jsp" >已申请的夹具</a></dd>
		      <dd><a href="work-2-6.jsp" >不同意采购入库夹具</a></dd>
		    </dl>
		  </li>
		  <img alt="" src="../resource/images/logo.png" style="height:350px;margin-top:20px;">
		</ul>
	</div>

<div style="border:1px solid black;width:auto;float:right;margin:3px;margin-right:20px;">
	<form name="form1" class="form" action="申请提交.jsp" method="post" id="form1" style="float:right;border:1px solid black;margin:2px;overflow:auto;white-space:nowarp;width:1020px;height:490px;background:white;">
				<nobr><a>夹具编号</a><a>名称</a><a>Family</a><a>Model</a><a>PartNo</a><a>生产日期</a><a>建档日期</a><a>采购单据号</a><a>经办人</a><a>库位</a><a>照片地址</a><a>状态<br>(自动填写)</a><a>申请人</a><a>操作</a></nobr>
	    		
	    		<nobr><a><input style="border:0px;width:76px;height:31px;" name="bianhao"></a><a><input style="border:0px;width:76px;height:31px;" name="mingcheng"></a><a><input style="border:0px;width:76px;height:31px;" name="family"></a><a><input style="border:0px;width:76px;height:31px;" name="model"></a><a><input style="border:0px;width:76px;height:31px;" name="partNo"></a><a><input style="border:0px;width:76px;height:31px;" name="productdate"></a><a><input style="border:0px;width:76px;height:31px;" name="setdate"></a><a><input style="border:0px;width:76px;height:31px;" name="buyNo"></a><a><input style="border:0px;width:76px;height:31px;" name="man"></a><a><input style="border:0px;width:76px;height:31px;" name="kuwei"></a><a><input style="border:0px;width:76px;height:31px;" name="imgurl"></a><a>申请中</a><a><input style="border:0px;width:76px;height:31px;" name="submitman"></a><a><button style="margin:3px;width:66px;height:28px" type="submit">提交</button></a></nobr>
	 </form>
</div>



<script src="../resource/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(["element","jquery","form"],function(){
		var $ = layui.jquery;
		var element = layui.element;
		var form = layui.form;
		
	})


</script>
</body>
</html>