<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="page/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="page/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="page/Css/style.css" />
    <script type="text/javascript" src="page/Js/jquery.js"></script>
    <script type="text/javascript" src="page/Js/bootstrap.js"></script>
    <script type="text/javascript" src="page/Js/ckform.js"></script>
    <script type="text/javascript" src="page/Js/common.js"></script>

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


    </style>
</head>
<body>
<form class="form-inline definewidth m20" action="selectByName.do" method="get">  
    产品名称：
    <input type="text" name="name" id="name"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增产品</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>产品编号</th>
        <th>产品名称</th>
        <th>产品截图</th>
        <th>状态</th>
        <th>管理操作</th>
    </tr>
    </thead>
    <c:forEach var="list" items="${list }" >
	     <tr>
            <td><c:out value="${list.sort }"/></td>
            <td><c:out value="${list.name }"/></td>
            <%-- <td><img width="200px" height="200px" src="/<c:out value="${path }"/>\<c:out value="${list.picture }"/>" /></td> --%>
            <td><img width="100px" height="100px" src="upload/<c:out value="${list.picture }"/>" /></td>
            <td><c:out value="${list.status }"/></td>
            <td>
                  <a href="selectById.do?id=<c:out value="${list.id }"/>">编辑</a>
                  <a href="delete.do?id=<c:out value="${list.id }"/>">删除</a>
            </td>
	 	</tr>
   </c:forEach>
   </table>
<!-- <div class="inline pull-right page">
         10122 条记录 1/507 页  <a href='#'>下一页</a>     <span class='current'>1</span><a href='#'>2</a><a href='/chinapost/index.php?m=Label&a=index&p=3'>3</a><a href='#'>4</a><a href='#'>5</a>  <a href='#' >下5页</a> <a href='#' >最后一页</a>    </div> -->
</body>
</html>
<script>
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="page/Product/add.jsp";
		 });


    });

	function del(id)
	{
		
		
		if(confirm("确定要删除吗？"))
		{
		
			var url = "index.html";
			
			window.location.href=url;		
		
		}
	
	
	
	
	}
</script>