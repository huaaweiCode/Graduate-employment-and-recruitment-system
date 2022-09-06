<@override name="title">新闻详细信息</@override>
<@override name="content">
	<div class="ui raised very padded text container segment">
		<h2 class="ui header">${new.title!''}</h2>
		<p>${new.content!''}</p>
		<a class="ui button primary" href="${base}/company/AllNews">返回</a>
	</div>
</@override>
<@extends name="company_layout.ftl"></@extends>