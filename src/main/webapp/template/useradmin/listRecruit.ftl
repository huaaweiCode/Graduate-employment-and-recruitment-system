<@override name="title">招聘信息</@override>
<@override name="content">
	<td class="two wide "></td>
	<td class="twelve  wide ">
		<table class="ui red table equal width celled padded ">
			<thead>
			<tr>
				<th class=" center aligned  " colspan="5">
					招聘信息
				</th>
			</tr>
			</thead>
			<tbody>
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
										<a href="${base}/admin/deleteRecruit/${recruit.recruitid}"
										   class="ui button primary">删除</a>
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


</@override>
<@extends name="admin_layout.ftl"></@extends>