<#-- @ftlvariable name="recruit" type="model.Recruit" -->

<@override name="title">修改学生信息页</@override>
<@override name="content">


	<td class="three wide "></td>
	<td class="ten wide ">
		<form class="ui large form" id="apply-form">
			<table class="ui celled striped  table">
				<tbody>
				<tr>
					<td class="two wide center aligned "><b>姓名</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="name" value="${stu.name}" placeholder="${stu.name}">
						</div>
					</td>
					<td class="two wide center aligned "><b>学号</b></td>
					<td class="four wide  center aligned disabled">
						<div class="field">
							<input type="text" name="stuID" value="${stu.stuID}"  placeholder="${stu.stuID}">
						</div>
					</td>
				</tr>
				<tr>
					<td class="two wide center aligned"><b>登录名</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<input type="text" name="sname" value="${stu.sname}"  disabled="disabled"  placeholder="${stu.sname}">
						</div>
					</td>
					<td class="two wide center aligned"><b>密码</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<input type="text" name="password" value="${stu.password}"  placeholder="${stu.password}">
						</div>
					</td>
				</tr>
				<tr>
					<td class="two wide center aligned "><b>性别</b></td>
					<td class="four wide  center aligned">
						<div class="field ">
							<select class="ui dropdown  " name="gender">
								<option value="${stu.gender}">选择性别</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</div>
					</td>
					<td class="two wide center aligned "><b>电话</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="tel" value="${stu.tel}"  placeholder="${stu.tel}">
						</div>
					</td>
				</tr>
				<tr>
					<td class="two wide center aligned "><b>毕业学校</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="university" value="${stu.university}"  placeholder="${stu.university}">
						</div>
					</td>
					<td class="two wide center aligned"><b>所修专业</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<input type="text" name="major" value="${stu.major}"  placeholder="${stu.major}">
						</div>
					</td>
				</tr>
				<tr>
					<td class="two wide center aligned "><b>学位</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="degree" value="${stu.degree}"  placeholder="${stu.degree}">
						</div>
					</td>
					<td class="two wide center aligned"><b>邮件</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<input type="text" name="email" value="${stu.email}"  placeholder="${stu.email}">
						</div>
					</td>
				</tr>
				<tr>

					<td class="two wide center aligned"><b>签名</b></td>
					<td class="four wide center aligned" colspan="3">
						<div class="field">
							<input type="text" name="introduction" value="${stu.introduction}"  placeholder="${stu.introduction}">
						</div>
					</td>

				</tr>

				<tr>
					<td></td>
					<td colspan="2">
						<div class="ui error message"></div>
					</td>

					<td>
						<div class="ui fluid large teal submit button ">保存</div>
					</td>
				</tr>
				</tbody>
			</table>
		</form>
	</td>
	<td class="three wide"></td>


	<script>


        $('.ui.dropdown').dropdown();

        $('.ui.form').form({
            fields: {
                tel: {
                    rules: [{
                        type: 'empty',
                        prompt: '电话信息不能为空'
                    }]
                },
                name: {
                    rules: [
                        {
                            type: 'empty',
                            prompt: '姓名不能为空'
                        }]
                },
                sname: {
                    rules: [{
                        type: 'empty',
                        prompt: '登录名不能为空'
                    }]
                },
                gender: {
                    rules: [{
                        type: 'empty',
                        prompt: '性别未选择'
                    }]
                },
                password: {
                    rules: [{
                        type: 'empty',
                        prompt: '密码不能为空'
                    }]
                },
                email: {
                    rules: [{
                        type: 'empty',
                        prompt: '邮件不能为空'
                    }]
                },
                university: {
                    rules: [{
                        type: 'empty',
                        prompt: '毕业学校不能为空'
                    }]
                },
                major: {
                    rules: [{
                        type: 'empty',
                        prompt: '所修专业不能为空'
                    }]
                },
                degree: {
                    rules: [{
                        type: 'empty',
                        prompt: '学位不能为空'
                    }]
                },
                introduction: {
                    rules: [{
                        type: 'empty',
                        prompt: '个性签名不能为空'
                    }]
                }
            }
        }).api({
            method: 'POST',
            url: '${base}/admin/domodifyStu',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/admin/listStu'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        })

	</script>

</@override>
<@extends name="admin_layout.ftl"></@extends>