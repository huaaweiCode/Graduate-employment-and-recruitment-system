<#-- @ftlvariable name="recruit" type="model.Recruit" -->

<@override name="title">修改管理员信息页</@override>
<@override name="content">


	<td class="three wide "></td>
	<td class="ten wide ">
		<form class="ui large form" id="apply-form">
			<table class="ui celled striped  table">
				<tbody>
				<tr>
					<td class="two wide center aligned "><b>登录名</b></td>
					<td class="four wide  center aligned disabled">
						<div class="field">
							<input type="text" name="adminName" value="${useradmin.adminName}" placeholder="${useradmin.adminName}">
						</div>
					</td>
					<td class="two wide center aligned "><b>密码</b></td>
					<td class="four wide  center aligned ">
						<div class="field">
							<input type="text" name="adminPassword" value="${useradmin.adminPassword}"  placeholder="${useradmin.adminPassword}">
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
                adminName: {
                    rules: [{
                        type: 'empty',
                        prompt: '用户名不能为空'
                    }]
                },
                adminPassword: {
                    rules: [{
                        type: 'empty',
                        prompt: '密码不能为空'
                    }]
                }
            }
        }).api({
            method: 'POST',
            url: '${base}/admin/domodifyAdmin',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/admin/listAdmin'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        })

	</script>

</@override>
<@extends name="admin_layout.ftl"></@extends>