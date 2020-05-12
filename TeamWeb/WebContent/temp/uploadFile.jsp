<%@page contentType="text/html;charset=UTF-8"%>
<form action="${pageContext.request.contextPath}/upload"
	enctype="multipart/form-data" method="post">
	<p>
		Description: <input type="text" name="desc" />
	</p>
	<p>
		File: <input type="file" name="data" size="50" />
	</p>
	<input type="submit" value="Upload" />
</form>