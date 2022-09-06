<@override name="title">管理员信息信息</@override>
<@override name="content">
	<td class="two wide "></td>
	<td class="twelve  wide ">
		<table class="ui red table equal width celled padded ">
			<thead>
			<tr>
				<th class=" center aligned  " colspan="5">
					管理员信息管理
				</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<table class="ui celled table">
						<thead>
						<tr>
							<th class="center aligned">登录名</th>
							<th class="center aligned">密码</th>
							<th class="center aligned">操作</th>
						</tr>
						</thead>
						<tbody>
                        <#if  !  page.getList().isEmpty()  >
                            <#list   page.getList() as stu>
								<tr>
									<td class="center aligned">
                                        ${stu.adminName}
									</td>
									<td class="center aligned">
                                        ${stu.adminPassword}
									</td>
									<td class="center aligned">
										<a href="${base}/admin/modifyAdmin/${stu.adminName}"
										   class="ui button primary">修改</a>
										<a href="${base}/admin/deleteAdmin/${stu.adminName}"
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

</@override>
<@extends name="admin_layout.ftl"></@extends>