<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/12/19
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/jquery-1.11.1.min_044d0927.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/jquery.bxslider_e88acd1b.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/lrscroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/iban.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/fban.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/f_ban.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/mban.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/bban.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/hban.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/tban.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/lrscroll_1.js"></script>

<title>易买网</title>
    <script type="text/javascript">
        $(function () {
            var msg='${message}';
            if(msg.length>0){
                alert(msg);
            }
        })
    </script>
</head>

<body>
<!--Begin Header Begin-->
<!--End Header End-->
<!--Begin Login Begin-->
<div class="log_bg">
    <div class="top">
    <div class="logo"><a href="${pageContext.request.contextPath}/user/toindex"><img src="${pageContext.request.contextPath}/statics/images/logo.png" /></a></div>
    </div>
        <div class="login">
        <div class="log_img"><img src="${pageContext.request.contextPath}/statics/images/l_img.png" width="611" height="425" /></div>
        <div class="log_c">
            <form action="${pageContext.request.contextPath}/user/login" method="get">
                <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
                    <tr height="50" valign="top">
                        <td width="55">&nbsp;</td>
                        <td>
                            <span class="fl" style="font-size:24px;">登录</span>
                            <span class="fr">还没有商城账号，<a href="${pageContext.request.contextPath}/user/toregist" style="color:#ff4e00;">立即注册</a></span>

                        </td>
                    </tr>
                    <tr height="70">
                        <td>用户名</td>
                        <td><input type="text" class="l_user" name="loginName"/></td>
                    </tr>
                    <tr height="70">
                        <td>密&nbsp; &nbsp;码</td>
                        <td><input type="password" class="l_pwd" name="password"/></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="60">
                        <td>&nbsp;</td>
                        <td><input type="submit" value="登录" class="log_btn"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End-->
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="${pageContext.request.contextPath}/statics/images/b_1.gif" width="98" height="33" />
        <img src="${pageContext.request.contextPath}/statics/images/b_2.gif" width="98" height="33" />
        <img src="${pageContext.request.contextPath}/statics/images/b_3.gif" width="98" height="33" />
        <img src="${pageContext.request.contextPath}/statics/images/b_4.gif" width="98" height="33" />
        <img src="${pageContext.request.contextPath}/statics/images/b_5.gif" width="98" height="33" />
        <img src="${pageContext.request.contextPath}/statics/images/b_6.gif" width="98" height="33" />
    </div>
</div>
<!--End Footer End -->

</body>
</html>
