<div class="modal fade" id="changepwd">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<form action="ChangePwd.jsp" method="post">
				<div class="modal-header">
					<h4>Change Password</h4>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="password" name="opwd" class="form-control"
							placeholder="Current Password">
					</div>
					<div class="form-group">
						<input type="password" name="pwd" class="form-control"
							placeholder="New Password">
					</div>
					<div class="form-group">
						<input type="password" name="npwd" class="form-control"
							placeholder="Confirm Password">
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary btn-sm float-right">Change
						Password</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="updateprofile">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<form action="UpdateProfile.jsp" method="post">
				<div class="modal-header">
					<h4>Update Profile</h4>
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="text" name="userid" value="${sessionScope.userid}"
							class="form-control">
					</div>
					<div class="form-group">
						<input type="text" name="uname" value="${sessionScope.uname}"
							class="form-control">
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary btn-sm float-right">Update
						Profile</button>
				</div>
			</form>
		</div>
	</div>
</div>

</div>
</div>
</div>
</div>
</div>
</body>
</html>
