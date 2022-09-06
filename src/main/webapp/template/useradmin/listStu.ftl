<@override name="title">学生信息</@override>
<@override name="content">
	<td class="two wide "></td>
	<td class="twelve  wide ">
		<table class="ui red table equal width celled padded ">
			<thead>
			<tr>
				<th class=" center aligned  " colspan="5">
					搜索
				</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<form class="ui fluid form">
						<table class="ui celled table">
							<tbody>
							<tr>
								<td>
									<div class="filed">
										<div class="ui labeled input">
											<div class="ui label">
												学号
											</div>
											<input type="text" placeholder="请输入学号" name="stuID">
										</div>
									</div>
								</td>
								<td>
									<div class="filed">
										<div class="ui labeled input ">
											<div class="ui label">
												姓名
											</div>
											<input type="text" placeholder="请输入姓名" name="name">
										</div>
									</div>
								</td>
								<td>
									<div class="filed">
										<div class="ui labeled input ">
											<div class="ui label">
												学历
											</div>
											<select class="ui dropdown" name="degree">
												<option value="">学历</option>
												<option value="null">不限</option>
												<option value="本科">本科</option>
												<option value="硕士">硕士</option>
												<option value="博士">博士</option>
											</select>
										</div>
									</div>
								</td>

								<td>
									<a class="ui primary submit button">搜索</a><br>
								</td>
							</tr>
							<tr>
								<div class="ui error message"></div>
							</tr>

							</tbody>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<table class="ui celled table">
						<thead>
						<tr>
							<th class="center aligned">姓名</th>
							<th class="center aligned">学号</th>
							<th class="center aligned">学位</th>
							<th class="center aligned">电话</th>
							<th class="center aligned">邮件地址</th>
							<th class="center aligned">所修专业</th>
							<th class="center aligned">操作</th>
						</tr>
						</thead>
						<tbody>
                        <#if  !  page.getList().isEmpty()  >
                            <#list   page.getList() as stu>
								<tr>
									<td class="center aligned">
                                        ${stu.name}
									</td>
									<td class="center aligned">
                                        ${stu.stuID}
									</td>
									<td class="center aligned">
                                        ${stu.degree}
									</td>
									<td class="center aligned">
                                        ${stu.tel}
									</td>
									<td class="center aligned">
                                        ${stu.email}
									</td>
									<td class="center aligned">
                                        ${stu.major}
									</td>
									<td class="center aligned">
										<a href="${base}/admin/modifyStu/${stu.stuID}"
										   class="ui button primary">修改</a>
										<a href="${base}/admin/deleteStu/${stu.stuID}"
										   class="ui button primary">删除</a>

									</td>
								</tr>

                            </#list>
                        <#else >

							<tr>
								<td class="fluid">
									<div class="ui negative massive message">
										<div class="header">
											未查询到相关信息
										</div>
									</div>
								</td>
							</tr>

                        </#if>
						</tbody>
					</table>
				</td>
			</tr>
			</tbody>
			<tfoot>
			<tr>
				<th colspan="5">
					<div class="ui right floated pagination menu">
                        <#if page.getPageNumber() !=1 >
							<a class="icon item" href="?page=${page.getPageNumber()-1}">
								<i class="left chevron icon"></i>
							</a>
                        </#if>
                        <#list  1..(page.getTotalPage()) as count >
							<a class="item">
                                <#if page.getPageNumber()==count>
									<b>${count}</b>
                                <#else>
                                    ${count}
                                </#if>
							</a>
                        </#list>
                        <#if page.getPageNumber() != page.getTotalPage() >
							<a class="icon item" href="?page=${page.getPageNumber()+1}">
								<i class="right chevron icon"></i>
							</a>
                        </#if>
					</div>
				</th>
			</tr>
			</tfoot>
		</table>
	</td>
	<td class="two wide"></td>


	<script>
        $('.ui.form').form({
            fields: {}
        }).api({
            method: 'POST',
            url: '${base}/admin/query_stu',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    window.location.href = '${base}/admin/query_stu_result'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        });
	</script>

</@override>
<@extends name="admin_layout.ftl"></@extends>