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
<form action="http://localhost:8080/EdianManage/update.do?id=<c:out value="${product.id }"/>" method="post" class="definewidth m20">
<input type="hidden" name="id" value="" />
<table class="table table-bordered table-hover ">
    <tr>
        <td width="10%" class="tableleft">产品类型</td>
        <td><input type="text" name="type" value="<c:out value='${product.type }' />" ></td>
    </tr>
    <tr>
        <td class="tableleft">产品序号</td>
        <td><input type="text" name="sort" value="<c:out value='${product.sort }' />" ></td>
    </tr>
    <tr>
        <td class="tableleft">产品名称</td>
        <td><input type="text" name="name" value="<c:out value='${product.name }' />" ></td>
    </tr>
    <tr>
        <td class="tableleft">产品截图</td>
        <td><img width="100px" height="100px" src="upload/<c:out value="${product.picture }"/>" /></td>
    </tr>    
    <tr>
        <td class="tableleft">状态</td>
        <td>
        <c:choose>
        <c:when test="${product.status==1 }">
            <input type="radio" name="status" value="1" checked/> 启用
            <input type="radio" name="status" value="0" /> 禁用
        </c:when>
        <c:otherwise>
        	<input type="radio" name="status" value="1" /> 启用
            <input type="radio" name="status" value="0" checked/> 禁用
        </c:otherwise>
        </c:choose>
        </td>
        
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });

    });
</script>