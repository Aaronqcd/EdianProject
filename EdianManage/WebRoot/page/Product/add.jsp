<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.validate.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
		
		#addform label.error {
			padding-left: 16px;
			font: normal 10px/12px Verdana, Geneva, sans-serif;
			color: red;
		}
		
		/*  input.error
        {
            border: dashed 1px red;
        } */
    </style>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#addform").validate({
    			event: "blur",
    			rules:{
    				type: "required",
    				sort: {
    					required: true,
    					digits: true
    				},
    				name: "required"
    			},
    			messages:{
    				type: "产品类型不能为空",
    				sort: {
    					required: "产品序号不能为空",
    					digits: "请输入一个整数"
    				},
    				name: "产品名称不能为空"
    			}
    		});
    	}); 
    	/* $(function(){
			$("#username").blur(function(){
				var username = $.trim($("#username").val());
    			$.ajax({
    				type: "POST",
    				url: "checkSort.do",
    				data: "name="
    		});
    	}); */
    	$(function(){
			$("#save").blur(function(){
				var sort = $.trim($("#sort").val());
				 /* $.post("checkusername.action", {userName:username}, function(data,state){
					if(data.result=="ok"){
						$("#span").html("<font size=\"1px\" color=\"red\">用户名可以使用</font>");
						document.getElementById("submit").removeAttribute("disabled");
					}
					else if(data.result=="no"){
						$("#span").html("<font size=\"1px\" color=\"red\">用户名已存在</font>");
						document.getElementById("submit").disabled = "true";
					}
					else if(data.result=="no1"){
						$("#span").html("<font size=\"1px\" color=\"red\">用户名不能为空</font>");
						document.getElementById("submit").disabled = "true";
					}
					return false;},'json'); */
					$.ajax({
	    				type: "POST",
	    				url: "../../checkSort.do",
	    				dataType: "text",
	    				data: "sort="+sort,
	    				success:function(msg){
	    					//alert('产品序号可以填写');
	    					$("#sort").html('此序号可以使用');
	    				},
	    				error:function(msg){
	    					alert(msg);
	    				}  
    		});
			}); 
		});
    </script>
</head>
<form id="addform" action="http://localhost:8080/EdianManage/upload.do" method="post" enctype="multipart/form-data">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft"><label for="type">产品类型</label></td>
        <td><input id="type" type="text" name="type"/></td>
    </tr>
    <tr>
        <td class="tableleft"><label for="sort">产品序号</label></td>
        <td><input id="sort" type="text" name="sort"/><span id=""></span></td>
    </tr>
    <tr>
        <td class="tableleft"><label for="name">产品名称</label></td>
        <td><input id="name" type="text" name="name"/></td>
    </tr>
    <tr>
        <td class="tableleft"><label for="image">产品截图</label></td>
        <td><input id="image" type="file" name="file"/></td>
    </tr>    
    <tr>
        <td class="tableleft"><label for="status">状态</label></td>
        <td>
            <input type="radio" name="status" value="1" checked/> 启用
            <input type="radio" name="status" value="0"/> 禁用
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button id="save" type="submit" class="btn btn-primary">保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
<!-- <form action="http://localhost:8080/EdianManage/helloWorld.do" method="post">
    	<input type="submit" value="提交">
    </form> -->
    
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });

    });
</script>