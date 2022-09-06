<@override name="title">上传简历</@override>
<@override name="content">

	<td class="three wide "></td>
	<td class="ten wide center aligned ">

		<form class="ui form" id="form">
			<div class="ui placeholder segment">
				<div class="ui icon header">
					<i class="pdf file outline icon"></i>
					<input type="file" name="file" lass="a-upload" id="img-upload">
				</div>

			</div>
			<input style="text-align:center;padding:10px 20px;width:300px;" onclick="upload()" type="button" class="ui button primary" value="上传" >
		</form>
	</td>
	<td class="three wide"></td>

	<script type="text/javascript">

        function upload() {
            //封装表单数据
            var formData = new FormData($("#form")[0]);
            //发送ajax请求
            $.ajax({
                url: "${base}/student/upload",
                type: "post",
                data: formData,
                //将文件类型设置为二进制类型
                contentType: false,
                processData: false,
                success: function (res) {
                    alert(res.message);
                    window.location.href='${base}/student/upload_resume'
                }
            });
        }
	</script>

</@override>
<@extends name="stu_layout.ftl"></@extends>