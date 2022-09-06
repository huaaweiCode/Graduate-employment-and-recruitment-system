<@override name="title">新闻详细信息</@override>
<@override name="content">

	<table class="ui table celled padded  ">
		<tbody>
		<tr>
			<td class="two wide "></td>
			<td class="twelve  wide ">
				<table class="ui red table equal width">
					<thead>
					<tr>
						<th class="three wide center aligned">标题</th>
						<th class="center aligned">内容</th>
						<th class=" two wide center aligned">发布时间</th>
						<th class="one wide center aligned">发布人</th>

					</tr>
					</thead>

					<tbody>
                    <#if  !  page.getList().isEmpty()  >
                        <#list   page.getList() as new>
							<tr>
								<td class="center aligned">
									<a href="${base}/company/news/${new.id}">  ${new.title}</a>
								</td>
								<td class="center aligned">
									<a href="${base}/company/news/${new.id}">${new.content}</a>
								</td>
								<td class="center aligned">
                                    ${new.newsTime}
								</td>
								<td class="center aligned">
                                    ${new.adminName}
								</td>
							</tr>

                        </#list>
                    </#if>
<#--					<tr>-->
<#--						<td colspan=""></td>-->
<#--						<td colspan=""></td>-->
<#--						<td colspan="2" class="center aligned">-->
<#--                            <#if page.getPageNumber() !=1 >-->
<#--								<a href="?page=${page.getPageNumber()-1}">上一页</a>-->
<#--                            </#if>-->
<#--                            ${page.getPageNumber()}/${page.getTotalPage()}-->
<#--                            <#if page.getPageNumber() != page.getTotalPage() >-->
<#--								<a href="?page=${page.getPageNumber()+1}">下一页</a>-->
<#--                            </#if>-->
<#--						</td>-->

					</tr>
					</tbody>
					<tfoot>

					<tr>
						<th colspan="4">
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
		</tr>
	</table>

</@override>
<@extends name="company_layout.ftl"></@extends>