<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>XSS攻击演示</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />

    <link rel="stylesheet" type="text/css" href="${ctxStatic}/main/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/main/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/main/fonts/iconic/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/main/css/util.css">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/main/css/main.css">
</head>

<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('${ctxStatic}/main/images/bg-01.jpg');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" method="post" action="${ctx}/registe.do" onsubmit="return checkFrom()">
                <span class="login100-form-title p-b-20">注册</span>

                <div class="txt1 text-center p-t-2 p-b-2 ">
                    <h5 style="color:red ">${info}</h5>
                </div>

                <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                    <span class="label-input100">用户名</span>
                    <input class="input100" type="text" name="username" id="username" placeholder="请输入用户名" autocomplete="off">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="请输入密码">
                    <span class="label-input100">密码</span>
                    <input class="input100" type="password" name="password" id="password" placeholder="请输入密码">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="请输入密码">
                    <input class="input100" type="password" name="password1" id="password1" placeholder="请再输入密码">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div><br />

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" id="button">注册</button>
                    </div>
                </div>

                <div class="flex-col-c p-t-25">
                    <a href="${ctx}/webpage/modules/sys/login.jsp" class="txt2">转到登录</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${ctxStatic}/main/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${ctxStatic}/main/js/main.js"></script>
<script type="text/javascript">

    function checkFrom(){
        var name = $("#username").val();
        var pass1 = $("#password").val();
        var pass2 = $("#password1").val();

        if(!name || !pass1 || !pass2 ){
            alert("用户名和密码不能为空！");
            return false;
        }
        if(name.length < 4){
            alert("用户名不能小于3个字符！");
            return false;
        }
        if(pass1.length < 5 || pass1.length < 5){
            alert("密码不能小于5个字符！");
            return false;
        }
        if(pass1 != pass2){
            alert("两次输入密码不同！");
            return false;
        }
    }

    $(document).ready(function(){

    });
</script>
</body>

</html>
