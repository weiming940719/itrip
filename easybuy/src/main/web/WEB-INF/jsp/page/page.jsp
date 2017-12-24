<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/12
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    $(function () {
        $("li>a").click(function () {
            var b = document.referrer;
            var no = $(this).attr("no");
            var name = $("input[name=keyWord]").val();

            if (name == "") {
                var url1 = location.href;
                var a = url1.split("&pageNum")[0];
                var b = "${pageContext.request.contextPath}/product/queryProductByName?name=";
                if (a == b) {
                    var url = url1.split("&pageNum")[0] + "&pageNum=" + no + "&" + "pageSize=8";
                    location.href = url;
                    return false;
                }

            }
            var url = b.split("&pageNum")[0] + "&pageNum=" + no + "&" + "pageSize=8";
            location.href = url;
        })
    })
</script>

<div class="row">
    <div class="col-lg-4">
    </div>
    <div class="col-lg-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li <c:if test="${pageInfo.isFirstPage}">class="disabled" </c:if>>
                    <c:if test="${pageInfo.isFirstPage}">
                        <span aria-hidden="true">首页</span>
                    </c:if>
                    <c:if test="${pageInfo.isFirstPage==false}">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true" no="1">首页</span>
                        </a>
                    </c:if>
                </li>

                <li <c:if test="${pageInfo.hasPreviousPage==false}">class="disabled" </c:if>>
                    <c:if test="${pageInfo.hasPreviousPage==false}">
                        <span aria-hidden="true">&laquo;</span>
                    </c:if>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <a href="#" aria-label="Previous" no="${pageInfo.prePage}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </c:if>
                </li>

                <c:forEach items="${pageInfo.navigatepageNums}" var="no">
                    <c:if test="${pageInfo.pageNum==no}"></c:if>
                    <li <c:if test="${pageInfo.pageNum==no}">class="active" </c:if>>
                        <a href="#" no="${no}">${no}</a>
                    </li>
                </c:forEach>

                <li <c:if test="${pageInfo.hasNextPage==false}">class="disabled" </c:if>>
                    <c:if test="${pageInfo.hasNextPage==false}">
                        <span aria-hidden="true">&raquo;</span>
                    </c:if>
                    <c:if test="${pageInfo.hasNextPage}">
                        <a href="#" aria-label="Previous" no="${pageInfo.nextPage}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </c:if>
                </li>

                <li <c:if test="${pageInfo.isLastPage}">class="disabled" </c:if>>
                    <c:if test="${pageInfo.isLastPage}">
                        <span aria-hidden="true">尾页</span>
                    </c:if>
                    <c:if test="${pageInfo.isLastPage==false}">
                        <a href="#" aria-label="Previous" no="${pageInfo.pages}">
                            <span aria-hidden="true">尾页</span>
                        </a>
                    </c:if>
                </li>
            </ul>
        </nav>

    </div>
</div>
