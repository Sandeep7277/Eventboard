
<jsp:include flush="true" page="mheader.jsp" />
<jsp:include flush="true" page="msg.jsp" />
<style>
.container-fluid {
	background-image: url(images/Slide2.jpg);
	background-size: 100% 100%;
	background-color: red;
	background-blend-mode: screen;
}

.shadow {
	box-shadow: 0 0 3px 3px gray;
}
</style>
<div class="container-fluid" style="min-height: 95vh;">
	<div class="card shadow"
		style="width: 400px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="card-body">
			<h4 class="pb-2 text-center" style="border-bottom: 2px solid green">Registration
				Screen</h4>
			<form method="post" action="Registration.jsp">
				<div class="form-group">
					<select class="form-control" id="role" name="role">
						<option>--- Select Role ---</option>
						<option value="lecturer">Lecturer</option>
						<option value="student">Student</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="id"
						placeholder="Select Role First" id="id">
				</div>
				<div id="error"
					class="text-danger font-weight-bold text-center d-none"></div>
				<div class="form-group">
					<input type="text" class="form-control" readonly id="uname"
						name="uname" placeholder="User Name">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="userid"
						placeholder="User ID">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="pwd" name="pwd"
						placeholder="Password">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="cpwd" name="cpwd"
						placeholder="Confirm Password">
				</div>
				<div id="error2"
					class="text-danger font-weight-bold text-center d-none"></div>
				<button class="btn btn-primary btn-block">Register Now</button>
			</form>
			<p class="text-center mt-2">
				Already registered Click <a href="Login.jsp">here</a>
			</p>
		</div>
	</div>
</div>
<script>
            $(function () {
                $("#role").change(function () {
                    if (this.value === "student") {
                        $("#id").attr({"placeholder": "Enter Reg. no"});
                    } else if (this.value === "lecturer") {
                        $("#id").attr({"placeholder": "Enter Lecturer id"});
                    } else {
                        $("#id").attr({"placeholder": "First Select role"});
                    }
                });
                $("#cpwd").blur(function () {
                    if (this.value !== $("#pwd").val()) {
                        $("#error2").html("Password not match");
                        //$("#error2").removeClass("d-none");
                    } else {
                        $("#error2").addClass("d-none");
                    }
                });
                $("#id").blur(function () {
                    $.ajax({
                        url: 'Verify.jsp',
                        data: {'role': $("#role").val(), 'id': this.value},
                        method: 'post',
                        success: function (output) {
                            console.log(output);
                            if (output.trim() === "Invalid") {
                                $("#error").html("Invalid ID given");
                                $("#error").removeClass("d-none");
                            } else {
                                $("#uname").val(output);
                                $("#error").addClass("d-none");
                            }
                        },
                        error:function(st,err){
                            console.log(err,st);
                        }
                    });
                });
            });
        </script>
<jsp:include flush="true" page="mfooter.jsp" />
