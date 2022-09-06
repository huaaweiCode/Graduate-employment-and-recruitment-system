<@override name="title">招聘信息</@override>
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
												最低薪水
											</div>
											<input type="text" placeholder="请输入数字" name="salary">
										</div>
									</div>
								</td>
								<td>
									<div class="filed">
										<div class="ui labeled input ">
											<div class="ui label">
												学历要求
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
									<div class="filed">
										<div class="ui labeled input ">
											<div class="ui label">
												工作地点
											</div>
											<select class="ui dropdown" name="address">
												<option value="">工作地</option>
												<option value="null">不限</option>
												<option value="北京">北京</option>
												<option value="上海">上海</option>
												<option value="银川">银川</option>
												<option value="郑州">郑州</option>
												<option value="杭州">杭州</option>
												<option value="广州">广州</option>
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
							<th class="center aligned">序号</th>
							<th class="center aligned">公司名字</th>
							<th class="center aligned">招聘职业</th>
							<th class="center aligned">薪水</th>
							<th class="center aligned">工作地址</th>
							<th class="center aligned">学位要求</th>
							<th class="center aligned">操作</th>
						</tr>
						</thead>
						<tbody>
                        <#if  !  page.getList().isEmpty()  >
                            <#list   page.getList() as recruit>
								<tr>
									<td class="center aligned">
                                        ${recruit.recruitid}
									</td>
									<td class="center aligned">
                                        ${recruit.name}
									</td>
									<td class="center aligned">
                                        ${recruit.position}
									</td>
									<td class="center aligned">
                                        ${recruit.salary}
									</td>
									<td class="center aligned">
                                        ${recruit.address}
									</td>
									<td class="center aligned">
                                        ${recruit.degree}
									</td>
									<td class="center aligned">
										<a href="${base}/student/companyInfo/${recruit.recruitid}"
										   class="ui button primary">详细信息</a>

                                        <#if ! recruit.sname?? >
											<a href="${base}/student/SendResume/${recruit.recruitid}"
											   class="ui button primary">投递简历</a>
                                        <#else>
	                                        <a href="${base}/student/SendResume/${recruit.recruitid}"
	                                           class="ui button red disabled">已投简历</a>
                                        </#if>

									</td>
								</tr>

                            </#list>
                        <#else >

							<tr>
								<td class="fluid">
									<div class="ui negative massive message">
										<div class="header">
											未查询到相关招聘信息
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
            url: '${base}/student/query_recruit',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    window.location.href = '${base}/student/query_recruit_result'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        });
	</script>

</@override>
<@extends name="stu_layout.ftl"></@extends>