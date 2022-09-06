<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="${base}/scripts/jquery.min.js"></script>
	<script src="${base}/scripts/semantic.min.js"></script>
	<script src="${base}/template/script.js"></script>
	<script src="${base}/template/demo.js"></script>
	<link rel="stylesheet" href="${base}/styles/semantic.min.css"/>

	<title>用户登录</title>
	<style>
		ul,
		ol,
		li,
		div {
			margin: 0;
			padding: 0;
		}

		ul,
		ol {
			list-style: none;
		}

		.box {
			width: 100%;
			height: 100%;
			position: relative;
			overflow: hidden;
		}

		.carousel-inner {
			height: 100%;
			left: 0;
			top: 0;
			position: absolute;
		}

		.carousel-item {
			height: 100%;
			float: left;

		}

		.carousel-item img {
			height: 100%;
		}

		.carousel-indicators {
			position: absolute;
			width: 100%;
			height: 12px;
			left: 0;
			bottom: 20px;
			text-align: center;
		}

		.carousel-indicators span {
			width: 12px;
			height: 12px;
			background-color: #fff;
			border-radius: 50%;
			display: inline-block;
			margin-right: 5px;
		}

		.carousel-indicators span.active {
			background-color: #de3a3a;
		}

		.carousel-btn {
			width: 50px;
			height: 45px;
			position: absolute;
			top: 50%;
			margin-top: -25px;
			cursor: pointer;
		}

		.carousel-prev-btn {
			left: 0;
			background-image: url('${base}/template//images/prev.png');
		}

		.carousel-next-btn {
			right: 0;
			background-image: url('${base}/template//images/next.png');
		}
	</style>
</head>
<body>


<div class="ui grid ">
	<div class="row">
		<img class="ui  image  centered medium" src="${base}/template/image/title.jpg" title="" style="height: 90px">
	</div>
</div>

<div class="ui large  menu center aligned grey inverted ">
	<div class="header item">

	</div>
	<a class=" item" href="${base}/student/mainPage">
		主页
	</a>
	<a class=" item" href="${base}/student/AllNews">
		资讯
	</a>
	<a class=" item" href="${base}/student/recruit">
		招聘信息
	</a>
	<div class=" ui dropdown item">
		个人信息
		<div class="menu">
			<a class="item" href="${base}/student/personainfo">查看个人信息</a>
			<a class="item" href="${base}/student/modify_personainfo">修改个人信息</a>
			<a class="item" href="${base}/student/upload_resume">上传个人简历</a>

		</div>
	</div>

	<div class="ui dropdown item">
		其它内容
	</div>
	<div class="right menu">
        <#if (session.user)??>
			<div class="ui dropdown item">
				<i class="user icon"></i>
				<div class="text"> 欢迎  ${session.user.sname}  同学 </div>
				<i class="icon dropdown"></i>
				<div class="menu">
					<a href="${base}/student/logout" class="item">退出</a>
				</div>
			</div>
        <#else>
			<div class="item">
				<a class="ui primary button labeled icon" href="${base}/login"><i class="user icon"></i> 登陆</a>
			</div>
			<div class="item">
				<a class="ui primary button  labeled icon" href="${base}/register"><i class="registered icon"></i>注册</a>
			</div>
        </#if>


	</div>
</div>
</div>



<table class="ui table celled padded fluid ">
	<tbody>
	<tr>
		<td class="one wide fluid"></td>
		<td class="seven wide fluid">
			<div class="wrapper" style="width:799px ;height: 400px">
				<div class="box">
					<ul class="carousel-inner">
						<li class="carousel-item"><img style="width:799px ;height: 400px"
						                               src="${base}/template/images/1.jpg" alt=""></li>
						<li class="carousel-item"><img style="width: 799px  ;height: 400px"
						                               src="${base}/template/images/2.jpg" alt=""></li>
						<li class="carousel-item"><img style="width: 799px ;height: 400px"
						                               src="${base}/template/images/3.jpg" alt=""></li>
						<li class="carousel-item"><img style="width: 799px;height: 400px"
						                               src="${base}/template/images/4.jpg" alt=""></li>
						<li class="carousel-item"><img style="width: 799px;height: 400px"
						                               src="${base}/template/images/5.jpg" alt=""></li>
						<li class="carousel-item"><img style="width: 799px;height: 400px"
						                               src="${base}/template/images/6.jpg" alt=""></li>
						<li class="carousel-item"><img style="width: 799px ;height: 400px"
						                               src="${base}/template/images/7.jpg" alt=""></li>
					</ul>
				</div>


			</div>
		</td>
		<td class="seven wide">

			<table class="ui red table">
				<thead>
				<tr>
					<th>用户登录</th>
				</tr>
				</thead>

				<tbody>
				<tr>
					<td>

						<form class="ui form" id="login-form">
							<div class="field">
								<label>用户名</label>
								<input type="text" name="username" placeholder="请输入用户名">
							</div>
							<div class="field">
								<label>密码</label>
								<input type="password" name="password" placeholder="请输入密码">
							</div>

							<div class="inline fields">
								<label for="usertype">选择用户类型</label>
								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="usertype" id="" value="1">
										<label for="">学生</label>
									</div>
								</div>
								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="usertype" id="" value="2">
										<label for="">公司</label>
									</div>
								</div>

								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="usertype" id="" value="3">
										<label for="">管理员</label>
									</div>
								</div>

							</div>

							<div class="ui error message"></div>

							<button class="ui button primary" type="submit">登陆</button>
						</form>

					</td>
				</tr>
				</tbody>
			</table>
		</td>
		<td class="one wide"></td>
	</tr>
</table>




<div class="ui footer menu bottom fixed  ">

	<div class="ui text container" style="font-size:20px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	</div>
</div>
</body>

<script>

    $('.ui.form').form({
        fields: {
            username: {
                identifier: 'username',
                rules: [
                    {
                        type: 'empty', prompt: '用户名不能为空'
                    }
                ]
            },
            password: {
                identifier: 'password',
                rules: [{
                    type: 'empty', prompt: '密码不能为空'
                }]
            },
            usertype: {
                identifier: 'usertype',
                rules: [{
                    type: 'checked', prompt: '用户类型不能为空'
                }]
            }
        }
    }).api({
        method: 'POST',
        url: '${base}/loginCheck',
        serializeForm: true,
        success: function (res) {
            // alert(res.message);
            if (res.success) {
                if (res.flag == 1) {
                    window.location.href = '${base}/student'
                } else if (res.flag == 2){
                    window.location.href = '${base}/company'
                }else if(res.flag==3){
                    window.location.href = '${base}/admin'
                }
            } else {
                $('.ui.form').form('add errors', [res.message]);
            }
        }
    });

    $('.ui.radio.checkbox').checkbox();

    $('.box').sowingMap({
        count: 7,
        time: 3000
    });

    $('.ui.dropdown').dropdown();


</script>

</html>