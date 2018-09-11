<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Assign Configuration</title>

<c:url var="getEditMsUser" value="/getEditMsUser" />

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
		control.makeTransliteratable([ "usrname_mr" ]);
		var keyVal = 32; // Space key
		$("#usrname_eng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#usrname_eng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#usrname_mr")
										.val(
												$("#usrname_mr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("usrname_mr").focus();
								$("#usrname_mr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#usrname_mr").val("");

								$("#usrname_eng").val("");
							}
						});

		$("#usrname_mr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#usrname_eng").val($("#usrname_eng").val() + " ");
				document.getElementById("usrname_eng").focus()
			}, 0);
		});

		

	} //end onLoad function

	google.setOnLoadCallback(OnLoad);
</script>
<!-- Translate -->
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<body >


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
							<strong> <spring:message code="label.assignConf" /></strong>
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/assignConf"
								id="assignConfForm" method="post" enctype="multipart/form-data">

								
								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.confsName" />
									<spring:message code="label.confsName" var="selConf" />
									<div class="input-group">
										<select data-placeholder="${selConf}" required 
											class="standardSelect" name="sel_conf" id="sel_conf"
											oninvalid="setCustomValidity('Please Select Configuration ')"
											onchange="try{setCustomValidity('')}catch(e){}">

											<c:forEach items="${confList}" var="conf">

												<c:choose>
													<c:when test="${langSelected == 0}">
														<option value="${conf.configId}">${conf.configEngName}</option>
													</c:when>
													<c:otherwise>
														<option value="${conf.configId}">${conf.configMarName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>


										</select> <span class="error" aria-live="polite"></span>

									</div>
								</div>

							
								<div class="form-group"></div>
								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.chooseHub" />
									<spring:message code="label.chooseHub" var="selHub" />
									<div class="input-group">
										<select data-placeholder="${selHub}" multiple required
											class="standardSelect" name="sel_hub[]" id="sel_hub[]"
											oninvalid="setCustomValidity('Please Select HUbs ')"
											onchange="try{setCustomValidity('')}catch(e){}">

											<c:forEach items="${hubList}" var="hub">

												<c:choose>
													<c:when test="${langSelected == 0}">
														<option value="${hub.hubId}">${hub.hubEngName}</option>
													</c:when>
													<c:otherwise>
														<option value="${hub.hubId}">${hub.hubMarName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>


										</select> <span class="error" aria-live="polite"></span>

									</div>
								</div>

								
								<div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary" id="submitButton"
										
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
								</div>

							</form>

							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><spring:message
															code="label.assignConfList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.hubsName" /></th>
																<th><spring:message code="label.confsName" /></th>
																<th><spring:message code="label.confType" /></th>
																<th><spring:message code="label.confTypeDesc" /></th>
																<th><spring:message code="label.hubTime" /></th>
																<th><spring:message code="label.distTime" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${settingList}" var="setting"
																varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${setting.hubEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${setting.hubMarName}" />

																		</c:if></td>
																		
																		<td><c:if test="${langSelected == 0}">
																			<c:out value="${setting.configEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${setting.configMarName}" />

																		</c:if></td>
																		
																		<td><c:if test="${setting.configType == 1}">
																			<spring:message code="label.dateBasis" />

																		</c:if> <c:if test="${setting.configType == 2}">
																			<spring:message code="label.dayBasis" />

																		</c:if>
																		
																		 <c:if test="${setting.configType == 3}">
																			<spring:message code="label.dailyBasis" />

																		</c:if>
																		
																		</td>
																		
																		
																	<td>${setting.configTypeDetails}</td>

																	<td><c:out value="${setting.hubFromTime} To ${setting.hubToTime}" /></td>
																	<td><c:out value="${setting.distFromTime} To ${setting.distToTime}" /></td>

																	<td>
																		<div class="fa-hover col-lg-3 col-md-6">
																			<a href="${pageContext.request.contextPath}/delAssignedConf/${setting.settingId}"
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
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>

	<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 10,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
		
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>
	<script type="text/javascript">
	
	function editMsUser(msId){
		
		//alert(catId);
		
		$.getJSON('${getEditMsUser}',{
			
			msId : msId,
			
			ajax : 'true',

		},
		
		function(data){
			$("#usrname_mr").val(data.msMarName);
			$("#usrname_eng").val(data.msEngName);
        	
			//hidden field msId
			$("#ms_id").val(data.msId);
			
			$("#contact_no").val(data.msContactNo); 
			$("#usr_pass").val(data.msPwd); 
			$("#conf_pass").val(data.msPwd); 
			document.getElementById("usr_role").options.selectedIndex =data.isAdmin;
			var temp=new Array();
			
			temp=(data.hubIds).split(",");
			$("#sel_hub").val(temp); 
			$("#sel_hub").triger("chosen:updated");
			

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
	validateMobNo();
	
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

		$("#contact_no").focus();
		document.getElementById('submitButton').disabled = true;
		validatePass();
	}
}

function disableSubmit(){
	document.getElementById('submitButton').disabled = true;
}
</script>

<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 10,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script>




</body>
</html>