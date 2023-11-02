
<jsp:include flush="true" page="mheader.jsp" />
<jsp:include flush="true" page="msg.jsp" />
<style>
.container-fluid {
	background-image: url(images/Slide2.jpg);
	background-size: 100% 100%;
	background-color: skyblue;
	background-blend-mode: screen;
}

.shadow {
	box-shadow: 0 0 2px 3px gray;
}
</style>
<div class="container-fluid" style="min-height: 95vh;">
	<div class="card shadow bg-transparent"
		style="width: 400px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="card-body">
			<h4 class="pb-2 text-center" style="border-bottom: 2px solid green">Login
				Screen</h4>
			<form method="post" action="Validate">
				<div class="form-group">
					<input type="text" class="form-control" required name="userid"
						placeholder="User Name">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" required name="pwd"
						placeholder="Password">
				</div>
				<button class="btn btn-primary btn-block">Login</button>
			</form>
			<p class="text-center mt-2">
				To register Click <a href="Register.jsp">here</a>
			</p>
		</div>
	</div>
</div>
</div>
</div>
<jsp:include flush="true" page="mfooter.jsp" />
