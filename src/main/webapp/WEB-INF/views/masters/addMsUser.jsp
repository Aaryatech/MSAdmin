<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Mahasangh User</title>

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
							<strong> <spring:message code="label.addMsUser" /></strong>
							
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="image"
								src="${pageContext.request.contextPath}/resources/images/addnewrecord.png"
								id="addButton" onclick="addButton();" height="25px;"
								width="25px;"  />
								<input type="image"
								src="${pageContext.request.contextPath}/resources/images/collapse_icon.png"
								id="addButton" onclick="hideButon();" height="25px;"
								width="25px;"  />
								
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertMsUser"
								id="msUserForm" method="post" enctype="multipart/form-data">
<div id="addDiv" style="display: none;">
								<input type="hidden" name="ms_id" id="ms_id" value="0">
								<div class="form-group"></div>
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.nameInEng" /></div>
									<div class="col-md-4">
										<input class="form-control" name="usrname_eng"
											id="usrname_eng" type="text" required maxlength="100"
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>
								
								<div class="col-md-2">
									<spring:message code="label.nameInMr" /></div>
									<div class="col-md-4">
										<input class="form-control" name="usrname_mr" id="usrname_mr"
											type="text" required maxlength="100"
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="row"><div class="col-md-2">
									<spring:message code="label.contactNo" /></div>
									<div class="col-md-4">
										<input class="form-control" name="contact_no" id="contact_no"
											onblur="validateMobNo()" type="text" required autocomplete="off"
											oninvalid="setCustomValidity('Please enter mobile no ')"
											onchange="try{setCustomValidity('')}catch(e){}"
											pattern="[0-9]{10}" /> <span class="error"
											aria-live="polite"></span>
									</div>
									
									<div class="col-md-2">
									<spring:message code="label.role" />
									</div>
										<spring:message code="label.role" var="urole"/>
									<spring:message code="label.staff" var="staff" />
									<spring:message code="label.admin" var="admin" />

									<div class="col-md-4">
										<select data-placeholder="${urole}" class="standardSelect"
											name="usr_role" id="usr_role" style="width: 100%"
											oninvalid="setCustomValidity('Please Select Role ')"
											onchange="try{setCustomValidity('')}catch(e){}">
											<c:choose>
												<c:when test="${langSelected == 0}">
													<option value="0">Staff</option>
													<option value="1">Admin</option>
												</c:when>
												<c:otherwise>
													<option value="0">${staff}</option>
													<option value="1">${admin}</option>
												</c:otherwise>
											</c:choose>

										</select> <span class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.password" />
									</div>
									<div class="col-md-4">
										<input class="form-control" name="usr_pass" id="usr_pass"
											onblur="validatePass()" type="password" required autocomplete="off"
											oninvalid="setCustomValidity('Please enter password ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
							<!-- 	</div>

								<div class="form-group"></div>
 -->								<div class="col-md-2">
									<spring:message code="label.confPass" /></div>
									<div class="col-md-4">
										<input class="form-control" name="conf_pass" id="conf_pass"
											onblur="validatePass()" type="text" required autocomplete="off"
											oninvalid="setCustomValidity('Please enter password ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
								<!-- <br></br>
								<div class="form-group"></div> -->
								<div class="form-group"></div>
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.chooseHub" />
									</div>
									
									<spring:message code="label.chooseHub" var="selHub" />
									<div class="col-md-10">
										<select data-placeholder="${selHub}" multiple required style="width: 100%;"
											class="standardSelect" name="sel_hub" id="sel_hub"
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
								<!-- </div>

								<div class="form-group"></div> -->
								
								</div>
<div class="form-group"></div>

								<div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary" id="submitButton"
										disabled
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
									
									<button type="reset" class="btn btn-primary"
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.cancel" />
									</button>
								</div>
</div>
							</form>

							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><spring:message
															code="label.mhusrList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="text-align: center;"><spring:message code="label.srNo" /></th>
																<th style="text-align: center;"><spring:message code="label.userName" /></th>
																<th style="text-align: center;"><spring:message code="label.contactNo" /></th>
																<th style="text-align: center;"><spring:message code="label.userType" /></th>
																<th style="text-align: center;"><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${mhsUsrList}" var="mhsUsr"
																varStatus="count">
																<tr>

																	<td style="text-align: center;">${count.index+1}</td>
																	<td style="text-align: left;"><c:if test="${langSelected == 0}">
																			<c:out value="${mhsUsr.msEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${mhsUsr.msMarName}" />

																		</c:if></td>
																	<td style="text-align: center;">${mhsUsr.msContactNo}</td>

																	<c:choose>
																		<c:when test="${mhsUsr.isAdmin==1}">

																			<spring:message code="label.admin" var="userType" />

																		</c:when>
																		<c:otherwise>
																			<spring:message code="label.staff" var="userType" />
																		</c:otherwise>
																	</c:choose>
																	<td style="text-align: center;"><c:out value="${userType}" /></td>

																	<td style="text-align: center;" >
																			<a href="#" onclick="editMsUser(${mhsUsr.msId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		&nbsp;
																			<a
																				href="${pageContext.request.contextPath}/deleteMsUser/${mhsUsr.msId}"
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


<!-- for data table  -->

	<!-- Left Panel -->
	 <script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables-init.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>


	<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 2,
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
			document.getElementById('addDiv').style.display = "block";
			$("#usrname_mr").val(data.msMarName);
			$("#usrname_eng").val(data.msEngName);
        	
			//hidden field msId
			$("#ms_id").val(data.msId);
			
			$("#contact_no").val(data.msContactNo);
			 document.getElementById("contact_no").readOnly = true; 
			$("#usr_pass").val(data.msPwd); 
			$("#conf_pass").val(data.msPwd); 
			document.getElementById("usr_role").options.selectedIndex =data.isAdmin;
			$("#usr_role").trigger("chosen:updated");
			var temp=new Array();
			
			temp=(data.hubIds).split(",");
			//alert(temp);
			$("#sel_hub").val(temp); 
			$("#sel_hub").trigger("chosen:updated");

			//$('#sel_hub').formcontrol('refresh');
	 		document.getElementById('submitButton').disabled = false;


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
		//$("#usr_pass").focus();
		document.getElementById('submitButton').disabled = true;
	}
	}
	if(mobNo.length!=0){
		validateMobNo();
		}
	
}

</script>

	<script type="text/javascript">

function validateMobNo(){
	//alert("In mob no vali");
	var mobNo=document.getElementById("contact_no").value;
	
	if(mobNo.length==10 || mobNo.length<1){
		
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

<script type="text/javascript">

function addButton() {
	//document.getElementById('addDiv').style = "display:none";
	document.getElementById('addDiv').style.display = "block";
	
}

function hideButon(){
	
	document.getElementById('addDiv').style = "display:none";
}

</script>



</body>
</html>