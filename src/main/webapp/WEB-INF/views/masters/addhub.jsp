<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Hub</title>

<c:url var="getEditHub" value="/getEditHub" />

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
		control.makeTransliteratable([ "hname_mr" ]);
		var keyVal = 32; // Space key
		$("#hname_eng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#hname_eng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#hname_mr")
										.val(
												$("#hname_mr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("hname_mr").focus();
								$("#hname_mr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#hname_mr").val("");

								$("#hname_eng").val("");
							}
						});

		$("#hname_mr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#hname_eng").val($("#hname_eng").val() + " ");
				document.getElementById("hname_eng").focus()
			}, 0);
		});
		
		
		control.makeTransliteratable([ "hadd_mr" ]);
		var keyVal = 32; // Space key
		$("#hadd_eng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#hadd_eng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#hadd_mr")
										.val(
												$("#hadd_mr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("hadd_mr").focus();
								$("#hadd_mr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#hadd_mr").val("");

								$("#hadd_eng").val("");
							}
						});

		$("#hadd_mr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#hadd_eng").val($("#hadd_eng").val() + " ");
				document.getElementById("hadd_eng").focus()
			}, 0);
		});
		

		

	} //end onLoad function

	google.setOnLoadCallback(OnLoad);
</script>
<!-- Translate -->
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<body>


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
							<strong> <spring:message code="label.addHub" /></strong>
						</div>
						<div class="card-body card-block">
							<form  action="${pageContext.request.contextPath}/insertHub" id="addHubForm" method="post" enctype="multipart/form-data">

								<input type="hidden" name="hub_id" id="hub_id" value="0">
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.nameInEng" /></div>
									<div class="col-md-4">
										<input class="form-control" name="hname_eng" id="hname_eng" maxlength="50"
											type="text" required
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>
								
							
								<div class="col-md-2">
									<spring:message code="label.nameInMr" /></div>
									<div class="col-md-4">
										<input class="form-control" name="hname_mr" id="hname_mr" maxlength="50"
											type="text" required
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

								&nbsp;
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.contactNo" />
									</div>
									<div class="col-md-3">
										<input class="form-control" name="contact_no" id="contact_no"
											type="text" required
											oninvalid="setCustomValidity('Please enter mobile no ')"
											onchange="try{setCustomValidity('')}catch(e){}"
											pattern="[0-9]{10}" /> <span class="error"
											aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.engAdd" /></div>
									<div class="col-md-4">
										<input class="form-control" name="hadd_eng" id="hadd_eng" maxlength="50"
											type="text" required
											oninvalid="setCustomValidity('Please enter address ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>

								<div class="col-md-2">
									<spring:message code="label.marAdd" /></div>
									<div class="col-md-4">
										<input class="form-control" name="hadd_mr" id="hadd_mr" maxlength="50"
											type="text" required
											oninvalid="setCustomValidity('Please enter address ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

&nbsp;

								<div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary"
									
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
															code="label.hubList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="text-align: center;"><spring:message code="label.srNo" /></th>
																<th style="text-align: center;"><spring:message code="label.hubsName" /></th>
																<th style="text-align: center;"><spring:message code="label.contactNo" /></th>
																<th style="text-align: center;"><spring:message code="label.address" /></th>
																<th style="text-align: center;"><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${hubList}" var="hub" varStatus="count">
																<tr>

																	<td style="text-align: center;">${count.index+1}</td>
																	<td style="text-align: left;"><c:if test="${langSelected == 0}">
																			<c:out value="${hub.hubEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${hub.hubMarName}" />

																		</c:if></td>
																	<td style="text-align: center;">${hub.hubContactNo}</td>

																	<td style="text-align: left;"><c:if test="${langSelected == 0}">
																			<c:out value="${hub.hubEngAdd}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${hub.hubMarAdd}" />

																		</c:if></td>
																	<td style="text-align: center;">
																			<a href="#" onclick="editHub(${hub.hubId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		&nbsp;
																			<a
																				href="${pageContext.request.contextPath}/deleteHub/${hub.hubId}"
																				onClick="return confirm('Are you sure want to delete this record');"><i
																				class="fa fa-trash-o"></i></a>
																		</td>

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
	
	function editHub(hubId){
		
		//alert(catId);
		
		$.getJSON('${getEditHub}',{
			
			hubId : hubId,
			
			ajax : 'true',

		},
		
		function(data){
			$("#hname_mr").val(data.hubMarName);
			$("#hname_eng").val(data.hubEngName);
        	
			//hidden field msId
			$("#hub_id").val(data.hubId);
			
			$("#contact_no").val(data.hubContactNo); 
			$("#hadd_mr").val(data.hubMarAdd); 
			$("#hadd_eng").val(data.hubEngAdd); 
		/* 	document.getElementById("usr_role").options.selectedIndex =data.isAdmin;
			var temp=new Array();
			
			temp=(data.hubIds).split(",");
			$("#sel_hub").val(temp); 
			$("#sel_hub").triger("chosen:updated"); */
			

		});
		
	}
	
	</script>

	<script type="text/javascript">

function validatePass(){

	var pass=document.getElementById("usr_pass").value;
	var confPass=document.getElementById("conf_pass").value;
	
	if(pass===confPass){
		
		var form = document.getElementById("msUserForm");
	    form.action ="${pageContext.request.contextPath}/insertMsUser";
	    form.submit();
	}
	else{
		alert("Password Mismacth for Confirm Password");
		$("#usr_pass").focus();
	}	
	
	
	function clearForm(){
		
		document.getElementById("msUserForm").reset();
	}
	
}

</script>


</body>
</html>