<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/JQuery-3.6.0.min.js"></script>
<script type="text/javascript">
function CheckEmail(str) {
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!reg_email.test(str)){
		return false;
	}else{
		return true;
	}
}

function formCheck() {
	var id = $("#id").val(); 
	if(!CheckEmail(id)){ <!-- 입력된 아이디가 이메일 형식인지 체크 -->
		alert("Email을 입력하세요");
		$("#id").val("");
		$("#id").focus();
		return;
	}
	
	if($("#password").val() == '' || $("#passwordChk").val() == ''){
		alert("패스워드를 입력해주세요.");
		$("#password").val("");
		$("#passworkChk").val("");
		$("#password").focus();
		return false;
	}
	if($("#password").val() != $("#passwordChk").val()){
		alert("패스워드가 일치하지 않습니다.");
		$("#password").val("");
		$("#passworkChk").val("");
		$("#password").focus();
		return false;
	}
	
	$.ajax({
		url : "ajaxIdCheck.do",
		type: "post",
		data: { chkid : id},
		dataType: "text",  <!-- 받는 타입 작성(JSON으로 받으면 JSON)-->
		success: function (data) {
			if(data == '0'){
				/* alert("사용할 수 있는 ID입니다.");
				$("#password").focus(); */
				joinFnc();
			}else{
				alert("이미 존재하는 ID입니다.");
				$("#id").val("");
				$("#id").focus();
			}
		}
		
	});	
}

function joinFnc() {
	frm.submit();
	alert(${message });	
} 
</script>
<!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" action="memberJoin.do" method="post" id="frm">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="email" class="form-control form-control-user" id="id" name="id"
                                            placeholder="id">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="tel" name="tel"
                                            placeholder="tel">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="address" name="address"
                                        placeholder="Address">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="password" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="passwordChk" placeholder="Repeat Password">
                                    </div>
                                </div>
                                <button type="button" onclick="formCheck()" class="btn btn-primary btn-user btn-block" >
                                    Register Account
                                </button>
                                <hr>
                                <a href="#" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="#" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.do">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>
</html>