<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@include file="basic.jsp" %>

</head>

<body>
<!--header-->
<%@include file="top.jsp" %>

<!--nav-->
<%@include file="left.jsp" %>

<div class="personal-r f-r" style="position: relative;left: -120px">
    <div class="mem_t"><h3 style="position: relative;right: -50px"><b>资讯列表</b></h3></div>
    <table border="0" class="table-bordered" style="width:870px; font-size: 16px;"
           align="center">
        <tr style="line-height: 40px" align="center">
                <td><b>文章标题</b></td>
               <td> <b>创建时间</b></td>
        </tr>
        <c:forEach items="${pageInfo.list}" var="news">
            <tr style="line-height: 40px"align="center">
                <td><a style="text-decoration: none" href="${pageContext.request.contextPath}/news/queryNewsByTitle?id=${news.id}">${news.title}</a></td>
                <td style="text-decoration: underline">
                        ${news.createTime}
                </td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <%@include file="../page/page1.jsp" %>
    </div>
</div>

<div style="clear:both;"></div>
<div class="modal fade" tabindex="-1" role="dialog" id="newsModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form class="form-horizontal" id="newsForm">
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="title" id="newsTitle">
                        </div>
                    </div>
                    </br>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="content" id="newsContent">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--底部一块-->
<%@include file="foot.jsp" %>

</body>
</html>
