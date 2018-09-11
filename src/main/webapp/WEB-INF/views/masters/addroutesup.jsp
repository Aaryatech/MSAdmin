<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Route Supervisor</title>

<c:url var="getEditRouteSup" value="/getEditRouteSup" />

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/apple-icon.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>



</head>


<!-- Translate -->


<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<script type="text/javascript">
	google.load("elements", "1", {
		packages : "transliteration"
	});
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>
	function OnLoad() {
		var options = {
			sourceLanguage : google.elements.transliteration.LanguageCode.ENGLISH,
			destinationLanguage : [ google.elements.transliteration.LanguageCode.MARATHI ],
			shortcutKey : 'ctrl+g',
			transliterationEnabled : true
		};

		var control = new google.elements.transliteration.TransliterationControl(
				options);
		control.makeTransliteratable([ "rsup_mr" ]);
		var keyVal = 32; // Space key
		$("#rsup_eng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#rsup_eng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#rsup_mr")
										.val(
												$("#rsup_mr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("rsup_mr").focus();
								$("#rsup_mr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#rsup_mr").val("");

								$("#rsup_eng").val("");
							}
						});

		$("#rsup_mr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#rsup_eng").val($("#rsup_eng").val() + " ");
				document.getElementById("rsup_eng").focus()
			}, 0);
		});

	} //end onLoad function

	google.setOnLoadCallback(OnLoad);
</script>
<!-- Translate -->
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<body onload="disableSubmit()">


	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->



	<div class="content mt-3">
		<div class="animated fadeIn">

			<div class="row">

				<div class="col-xs-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<strong> <spring:message code="label.addRouteSup" /></strong>
						</div>
						<div class="card-body card-block">
							<form  action="${pageContext.request.contextPath}/insertRouteSup"  id="addRouteSupForm" method="post" enctype="multipart/form-data">

								<input type="hidden" name="sup_id" id="sup_id" value="0">
								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.nameInEng" />
									<div class="input-group">
										<input class="form-control" name="rsup_eng" id="rsup_eng"
											type="text" required
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.nameInMr" />
									<div class="input-group">
										<input class="form-control" name="rsup_mr" id="rsup_mr"
											type="text" required
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.contactNo" />
									<div class="input-group">
										<input class="form-control" name="contact_no" id="contact_no" onblur="validateMobNo()"
											type="number" required
											oninvalid="setCustomValidity('Please enter mobile no ')"
											onchange="try{setCustomValidity('')}catch(e){}"
											pattern="[0-9]{10}" /> <span class="error"
											aria-live="polite"></span>
									</div>
								</div>
								
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.password" />
									</div>
									<div class="col-md-3">
										<input class="form-control" name="usr_pass" id="usr_pass"
											onblur="validatePass()" type="password" required
											oninvalid="setCustomValidity('Please enter password ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
							<!-- 	</div>

								<div class="form-group"></div>
 -->								<%-- <div class="col-md-2">
									<spring:message code="label.confPass" /></div>
									<div class="col-md-3">
										<input class="form-control" name="conf_pass" id="conf_pass"
											onblur="validatePass()" type="text" required
											oninvalid="setCustomValidity('Please enter password ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="col-md-6">
									<spring:message code="label.password" />
									<div class="input-group">
										<input class="form-control" name="usr_pass" id="usr_pass" onblur="validatePass()"
											type="password" required
											oninvalid="setCustomValidity('Please enter password ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
 --%>
								
								<div class="col-md-2">
									<spring:message code="label.confPass" />
									</div>
									<div class="col-md-3">
										<input class="form-control" name="conf_pass" id="conf_pass" onblur="validatePass()"
											type="text" required
											oninvalid="setCustomValidity('Please enter password ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
&nbsp;
								<div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary" id="submitButton"  disabled
									
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
									<button type="reset"  class="btn btn-primary" style="align-content: center; width: 226px; margin-left: 80px;" ><spring:message code="label.cancel" /></button>
								</div>

							</form>

							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><spring:message
															code="label.rsList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.routeSupName" /></th>
																<th><spring:message code="label.contactNo" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${routeSupList}" var="rsup" varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${rsup.supEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${rsup.supMarName}" />

																		</c:if></td>
																	<td>${rsup.supContactNo}</td>

																	
																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="#" onclick="editRouteSup(${rsup.supId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteRouteSup/${rsup.supId}"
																				onClick="return confirm('Are you sure want to delete this record');"><i
																				class="fa fa-trash-o"></i></a>
																		</div></td>

																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>





						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Left Panel -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables-init.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>

	<script type="text/javascript">
	
	function editRouteSup(supId){
		
		//alert(catId);
		
		$.getJSON('${getEditRouteSup}',{
			
			supId : supId,
			
			ajax : 'true',

		},
		
		function(data){
			$("#rsup_mr").val(data.supMarName);
			$("#rsup_eng").val(data.supEngName);
        	
			//hidden field msId
			$("#sup_id").val(data.supId);
			
			$("#contact_no").val(data.supContactNo); 
			
			$("#usr_pass").val(data.supPwd); 
			$("#conf_pass").val(data.supPwd); 
			

		});
		
	}
	
	</script>

	<script type="text/javascript">

function validatePass(){

	var pass=document.getElementById("usr_pass").value;
	var confPass=document.getElementById("conf_pass").value;
	
	if(confPass.length>0){
	
	if(pass===confPass){
 		
 		document.getElementById('submitButton').disabled = false;
 		
	}
	else{
		alert("Password Mismacth for Confirm Password");
		$("#usr_pass").focus();
		document.getElementById('submitButton').disabled = true;
	}
	}
	var mobNo=document.getElementById("contact_no").value;
	if(mobNo.length!=0){
	validateMobNo();
	}
	
}

</script>

<script type="text/javascript">

function validateMobNo(){
	//alert("In mob no vali");
	var mobNo=document.getElementById("contact_no").value;
	
	if(mobNo.length==10){
		
	}else{
		
		alert("Enter Valid Mob No");
		$("#contact_no").focus();
		document.getElementById('submitButton').disabled = true;
		
	}
		
	var x=isNan(mobNo);
	if(x==false){
 		document.getElementById('submitButton').disabled = false;
	 
	}
	else{
		alert("Enter Valid Mob No");

		document.getElementById('submitButton').disabled = true;
		validatePass();
		$("#contact_no").focus();
	}
}

function disableSubmit(){
	document.getElementById('submitButton').disabled = true;
}
</script>


</body>
</html>