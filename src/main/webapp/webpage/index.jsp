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
            <span class="login100-form-title p-b-20">登录</span>

            <div class="txt1 text-center p-t-2 p-b-2 ">
                <h5 style="color:red ">${infor}</h5>
            </div>
            <form action="${ctx}/index/login.do" method="post" onsubmit="return checkFrom()">
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

                <div class="text-right p-t-8 p-b-31">
                    <a href="javascript:">忘记密码？</a>
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" id="button">登 录</button>
                    </div>
                </div>
            </form>

            <div class="txt1 text-center p-t-54 p-b-20">
                <span>第三方登录</span>
            </div>

            <div class="flex-c-m">
                <a href="#" class="login100-social-item bg1">
                    <i class="fa fa-wechat"></i>
                </a>

                <a href="#" class="login100-social-item bg2">
                    <i class="fa fa-qq"></i>
                </a>

                <a href="#" class="login100-social-item bg3">
                    <i class="fa fa-weibo"></i>
                </a>
            </div>

            <div class="flex-col-c p-t-25">
                <a href="${ctx}/webpage/user/registe.jsp" class="txt2">立即注册</a>
            </div>
        </div>
    </div>
</div>

<script src="${ctxStatic}/main/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${ctxStatic}/main/js/main.js"></script>
<script type="text/javascript">

    function checkFrom(){
        var name = $("#username").val();
        var pass = $("#password").val();
        if(!name || !pass) {
            alert("用户名和密码不能为空！");
            return false;
        }
        if(name.length < 4) {
            alert("用户名不能小于3个字符！");
            return false;
        }
        if(pass.length < 5) {
            alert("密码不能小于5个字符！");
            return false;
        }
    }

    $(document).ready(function() {

    });
</script>
</body>

</html>
