<@override name="title">新闻详细信息</@override>
<@override name="content">

	<table class="ui table celled padded  ">
		<tbody>
		<tr>
			<td class="two wide "></td>
			<td class="twelve  wide ">
				<form class="ui large form" id="apply-form">
					<table class="ui celled striped  table">
						<thead>
						<tr>
							<th class="three wide center aligned" colspan="4">发布资讯</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="two wide center aligned " colspan="1"><b>标题</b></td>
							<td class="four wide  center aligned" colspan="3">
								<div class="field">
									<input type="text" name="title" >
								</div>
							</td>
						</tr>
						<tr>
							<td class="two wide center aligned" colspan="1"><b>内容</b></td>
							<td class="four wide center aligned" colspan="3">
								<div class="field">
									<textarea name="content"></textarea>
								</div>
							</td>

						</tr>

						<tr>
							<td></td>
							<td colspan="2">
								<div class="ui error message" ></div>
							</td>

							<td colspan="1">
								<div class="ui fluid large teal submit button ">发布</div>
							</td>
						</tr>
						</tbody>
					</table>
				</form>
			</td>
			<td class="two wide"></td>
		</tr>
	</table>

	<script>

		;

        $('.ui.form').form({
            fields: {
                title : {
                    rules: [{
                        type: 'empty',
                        prompt: '标题息不能为空'
                    }]
                },
                content: {
                    rules: [
                        {
                            type: 'empty',
                            prompt: '内容能为空'
                        }]
                }
            }
        }).api({
            method: 'POST',
            url: '${base}/admin/addNew',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/admin/AllNews'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        })

	</script>

</@override>
<@extends name="admin_layout.ftl"></@extends>