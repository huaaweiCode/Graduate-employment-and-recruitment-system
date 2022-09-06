
<@override name="title">添加公司</@override>
<@override name="content">

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
            url:'${base}/admin/saveCompany',
            serializeForm:true,
            success:function (res) {
                if(res.success){
                    alert(res.message);
                    window.location.href='${base}/admin/listCompany'
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
</@override>
<@extends name="admin_layout.ftl"></@extends>

