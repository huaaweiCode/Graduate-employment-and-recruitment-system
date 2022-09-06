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

	<title>企业注册</title>
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
	<div class=" item">
		主页
	</div>
	<div class=" item">
		资讯
	</div>
	<div class=" item">
		个人信息
	</div>

	<div class="ui dropdown item">
		其它内容
		<div class="menu">
			<a class="item">数码产品</a>
			<a class="item">汽车</a>
			<a class="item">主页</a>
		</div>
	</div>
	<div class="right menu">
		<div class="item">
            			<a class="ui primary button labeled icon" href="${base}/login"><i class="user icon"></i> 登陆</a>
		</div>
		<div class="item">
<#--			<a class="ui primary button  labeled icon" href="${base}/register"><i class="registered icon"></i>注册</a>-->
		</div>
	</div>
</div>
</div>

<div class="ui equal width center aligned padded grid">

	<div class="row">
		<div class=" column three wide">

		</div>
		<div class=" column ten wide">
			<table class="ui table celled padded  fluid ">
				<tbody>
				<tr>
					<td class="ten wide">
						<table class="ui red table">
							<thead>
							<tr>
								<th>企业注册</th>
							</tr>
							</thead>

							<tbody>
							<tr>
								<td>
									<form class="ui form" id="login-form">
										<table class="ui  table      ">
											<tbody>
											<tr>
												<td class="center aligned two wide">
													<label >用户名</label>
												</td>
												<td class="eight wide">
													<div class="field ">
														<input type="text" name="cname" placeholder="请输入用户名" >
													</div>
												</td>
												<td class="six wide">
													<label>用户名</label>
												</td>
											</tr>

											<tr>
												<td class="center aligned two wide">
													<label >企业名字</label>
												</td>
												<td class="eight wide">
													<div class="field ">
														<input type="text" name="name" placeholder="请输入企业名字" >
													</div>
												</td>
												<td class="six wide">
													<label>用户名</label>
												</td>
											</tr>

											<tr>
												<td class="center aligned two wide">
													<label >密码</label>
												</td>
												<td class="eight wide">
													<div class="field ">
														<input type="text" name="password" placeholder="请输入密码" >
													</div>
												</td>
												<td class="six wide">
													<label>用户名</label>
												</td>
											</tr>

											<tr>
												<td class="center aligned two wide">
													<label >密码</label>
												</td>
												<td class="eight wide">
													<div class="field ">
														<input type="text" name="password1" placeholder="请再次输入密码" >
													</div>
												</td>
												<td class="six wide">
													<label>用户名</label>
												</td>
											</tr>

											<tr>
												<td class="center aligned two wide">
													<label >企业地址</label>
												</td>
												<td class="eight wide">
													<div class="field ">
														<input type="text" name="address" placeholder="请输入企业地址" >
													</div>
												</td>
												<td class="six wide">
													<label>用户名</label>
												</td>
											</tr>

											<tr>
												<td class="center aligned two wide">
													<label >联系电话</label>
												</td>
												<td class="eight wide">
													<div class="field ">
														<input type="text" name="tel" placeholder="请输入企业联系电话号码" >
													</div>
												</td>
												<td class="six wide">
													<label>用户名</label>
												</td>
											</tr>

											<tr>
												<td class="center aligned two wide">
													<label >职员人数</label>
												</td>
												<td class="eight wide">
													<div class="field ">
														<input type="text" name="stuffNumber" placeholder="请输入>职员人数" >
													</div>
												</td>
												<td class="six wide">
													<label>用户名</label>
												</td>
											</tr>

											<tr>
												<td class="center aligned two wide">
													<label >公司简要介绍</label>
												</td>
												<td colspan="14" >
													<div class="field ">
<#--														<input type="text" name="university" placeholder="请输入自我介绍" >-->
														<textarea type="text" name="detail" placeholder="请输入公司简要介绍"></textarea>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="1">
												</td>
												<td colspan="1">
													<button class="ui button primary fluid" type="submit">注册</button>
												</td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td>
													<div class="ui error message"></div>
												</td>
												<td></td>
											</tr>
											</tbody>
										</table>
									</form>
								</td>
							</tr>

							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class=" column three wide">

		</div>
	</div>




</div>

<div class="ui footer menu bottom fixed  ">

	<div class="ui text container" style="font-size:20px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	</div>
</div>
</body>

<script>
    $('.ui.form').form({
        fields:{
            cname:{
                rules:[{
                    type:'minLength[3]',
                    prompt:'用户名至少包含3个字符'
                }]
            },
            name:{
                rules:[{
                    type:'empty',
                    prompt:'企业名字不能为空'
                }]
            },
            password:{
                rules:[
                    {
                        type   : 'empty',
                        prompt : '请输入密码'
                    },
                    {
                        type:'minLength[6]',
                        prompt:'密码至少包含6个字符'
                    }]
            },
            password1:{
                rules:[{
                    type:'match[password]',
                    prompt:'密码不一致'
                }]
            },
            address:{
                rules:[{
                    type:'empty',
                    prompt:'地址不能为空'
                }]
            },
            stuffNumber:{
                rules:[{
                    type:'empty',
                    prompt:'职员人数不能为空'
                }]
            },
            tel:{
                rules:[{
                    type:'empty',
                    prompt:'电话不能为空'
                }]
            },
            detail:{
                rules:[{
                    type:'empty',
                    prompt:'企业介绍不能为空'
                }]
            }
        }
    }).api({
        method:'POST',
        url:'${base}/Company_Register',
        serializeForm:true,
        success:function (res) {
            if(res.success){
                alert(res.message);
                window.location.href='${base}/login'
            }else{
                $('.ui.form').form('add errors',[res.message]);
            }
        }
    })

    $('.ui.radio.checkbox').checkbox();

    $('.box').sowingMap({
        count: 7,
        time: 3000
    });

    $('.ui.dropdown').dropdown();


</script>

</html>