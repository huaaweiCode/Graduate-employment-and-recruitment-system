<#-- @ftlvariable name="recruit" type="model.Recruit" -->

<@override name="title">修改公司信息页</@override>
<@override name="content">


	<td class="three wide "></td>
	<td class="ten wide ">
		<form class="ui large form" id="apply-form">
			<table class="ui celled striped  table">
				<tbody>
				<tr>
					<td class="two wide center aligned "><b>公司名字</b></td>
					<td class="four wide  center aligned disabled">
						<div class="field">
							<input type="text" name="name" value="${company.name}" placeholder="${company.name}">
						</div>
					</td>
					<td class="two wide center aligned "><b>用户名</b></td>
					<td class="four wide  center aligned disabled">
						<div class="field">
							<input type="text" name="cname" value="${company.cname}"  placeholder="${company.cname}">
						</div>
					</td>
				</tr>
				<tr>
					<td class="two wide center aligned"><b>联系电话</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<input type="text" name="tel" value="${company.tel}"   placeholder="${company.tel}">
						</div>
					</td>
					<td class="two wide center aligned"><b>密码</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<input type="text" name="password" value="${company.password}"  placeholder="${company.password}">
						</div>
					</td>
				</tr>

				<tr>
					<td class="two wide center aligned "><b>职员数量</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="number" value="${company.number}"  placeholder="${company.number}">
						</div>
					</td>
					<td class="two wide center aligned"><b>公司地址</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<input type="text" name="address" value="${company.address}"  placeholder="${company.address}">
						</div>
					</td>
				</tr>
				<tr>

					<td class="two wide center aligned"><b>公司简介</b></td>
					<td class="four wide center aligned" colspan="3">
						<div class="field">
							<input type="text" name="detail" value="${company.detail}"  placeholder="${company.detail}">
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
                            prompt: '公司不能为空'
                        }]
                },
                cname: {
                    rules: [{
                        type: 'empty',
                        prompt: '登录名不能为空'
                    }]
                },
                address: {
                    rules: [{
                        type: 'empty',
                        prompt: '公司地址不能为空'
                    }]
                },
                password: {
                    rules: [{
                        type: 'empty',
                        prompt: '密码不能为空'
                    }]
                },
                number: {
                    rules: [{
                        type: 'empty',
                        prompt: '公司职员人数不能为空'
                    }]
                },
                detail: {
                    rules: [{
                        type: 'empty',
                        prompt: 'detail不能为空'
                    }]
                }
            }
        }).api({
            method: 'POST',
            url: '${base}/company/modify_applyinfo/',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/company/personainfo'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        })

	</script>

</@override>
<@extends name="company_layout.ftl"></@extends>