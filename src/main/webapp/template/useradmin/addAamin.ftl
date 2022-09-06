
<@override name="title">添加管理员</@override>
<@override name="content">

	<table class="ui table celled padded  fluid ">
		<tbody>
		<tr>
			<td class="ten wide">
				<table class="ui red table">
					<thead>
					<tr>
						<th colspan="2">添加管理员</th>
					</tr>
					</thead>

					<tbody>
					<tr>
						<td>
							<form class="ui form" id="login-form">
								<table class="ui  table  ">
									<tbody>
									<tr>
										<td class="center aligned two wide">
											<label >用户名</label>
										</td>
										<td class=" ">
											<div class="field ">
												<input type="text" name="adminName" placeholder="请输入用户名" >
											</div>
										</td>
									</tr>
									<tr>
										<td class="center aligned two wide">
											<label >密码</label>
										</td>
										<td class=" ">
											<div class="field ">
												<input type="text" name="adminPassword" placeholder="请输入密码" >
											</div>
										</td>
									</tr>
									<tr>
										<td class="center aligned two wide">
											<label >重输密码</label>
										</td>
										<td class=" ">
											<div class="field ">
												<input type="text" name="adminPassword1" placeholder="请再输入密码" >
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="1"><div class="ui error message"></div>
										</td>
										<td colspan="1">
											<button class="ui button primary fluid" type="submit">添加</button>
										</td>

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
                adminName:{
                    rules:[{
                        type:'empty',
                        prompt:'企业名字不能为空'
                    }]
                },
                adminPassword:{
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
                adminPassword1:{
                    rules:[{
                        type:'match[adminPassword]',
                        prompt:'密码不一致'
                    }]
                }
            }
        }).api({
            method:'POST',
            url:'${base}/admin/saveAdmin',
            serializeForm:true,
            success:function (res) {
                if(res.success){
                    alert(res.message);
                    window.location.href='${base}/admin/listAdmin'
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

