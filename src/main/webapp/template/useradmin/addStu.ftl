
<@override name="title">添加学生</@override>
<@override name="content">

	<table class="ui table celled padded  fluid ">
		<tbody>
		<tr>
			<td class="ten wide">
				<table class="ui red table">
					<thead>
					<tr>
						<th>添加学生</th>
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
												<input type="text" name="sname" placeholder="请输入用户名" >
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>

									<tr>
										<td class="center aligned two wide">
											<label >姓名</label>
										</td>
										<td class="eight wide">
											<div class="field ">
												<input type="text" name="name" placeholder="请输入姓名" >
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
											<label >学号</label>
										</td>
										<td class="eight wide">
											<div class="field ">
												<input type="text" name="stuID" placeholder="请输入学号" >
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>

									<tr>
										<td class="center aligned two wide">
											<label >性别</label>
										</td>
										<td class="eight wide">
											<div class="field">
												<select class="ui dropdown " name="gender">
													<option value="">选择性别</option>
													<option value="男">男</option>
													<option value="女">女</option>
												</select>
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>

									<tr>
										<td class="center aligned two wide">
											<label >电话</label>
										</td>
										<td class="eight wide">
											<div class="field ">
												<input type="text" name="tel" placeholder="请输入电话号码" >
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>

									<tr>
										<td class="center aligned two wide">
											<label >邮件地址</label>
										</td>
										<td class="eight wide">
											<div class="field ">
												<input type="text" name="email" placeholder="请输入邮件地址" >
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>

									<tr>
										<td class="center aligned two wide">
											<label >学历等级</label>
										</td>
										<td class="eight wide">
											<div class="field ">
												<input type="text" name="degree" placeholder="请输入学历等级" >
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>

									<tr>
										<td class="center aligned two wide">
											<label >毕业学校</label>
										</td>
										<td class="eight wide">
											<div class="field ">
												<input type="text" name="university" placeholder="请输入毕业学校" >
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>

									<tr>
										<td class="center aligned two wide">
											<label >专业</label>
										</td>
										<td class="eight wide">
											<div class="field ">
												<input type="text" name="major" placeholder="请输入专业" >
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>

									<tr>
										<td class="center aligned two wide">
											<label >个人介绍</label>
										</td>
										<td class="eight wide">
											<div class="field ">
                                                <#--														<input type="text" name="university" placeholder="请输入自我介绍" >-->
												<textarea type="text" name="introduction" placeholder="请输入自我介绍"></textarea>
											</div>
										</td>
										<td class="six wide">
											<label>用户名</label>
										</td>
									</tr>
									<tr>
										<td colspan="1">
										</td>
										<td colspan="1">
											<button class="ui button primary fluid" type="submit">添加</button>
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
                sname:{
                    rules:[{
                        type:'minLength[3]',
                        prompt:'用户名至少包含3个字符'
                    }]
                },
                name:{
                    rules:[{
                        type:'empty',
                        prompt:'姓名不能为空'
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
                stuID:{
                    rules:[{
                        type:'empty',
                        prompt:'学号不能为空'
                    }]
                },
                degree:{
                    rules:[{
                        type:'empty',
                        prompt:'学历等级不能为空'
                    }]
                },
                university:{
                    rules:[{
                        type:'empty',
                        prompt:'毕业学校不能为空'
                    }]
                },
                gender:{
                    rules:[{
                        type:'empty',
                        prompt:'性别不能为空'
                    }]
                },
                tel:{
                    rules:[{
                        type:'empty',
                        prompt:'电话不能为空'
                    }]
                },
                major:{
                    rules:[{
                        type:'empty',
                        prompt:'专业不能为空'
                    }]
                },
                introduction:{
                    rules:[{
                        type:'empty',
                        prompt:'个人介绍不能为空'
                    }]
                },
                email:{
                    rules:[{
                        type:'empty',
                        prompt:'邮件地址不能为空'
                    }]
                }
            }
        }).api({
            method:'POST',
            url:'${base}/admin/saveStu',
            serializeForm:true,
            success:function (res) {
                if(res.success){
                    alert(res.message);
                    window.location.href='${base}/admin/listStu'
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

