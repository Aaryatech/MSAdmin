<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Route</title>

<c:url var="getEditRoute" value="/getEditRoute" />

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
		control.makeTransliteratable([ "route_mr" ]);
		var keyVal = 32; // Space key
		$("#route_eng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#route_eng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#route_mr")
										.val(
												$("#route_mr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("route_mr").focus();
								$("#route_mr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#route_mr").val("");

								$("#route_eng").val("");
							}
						});

		$("#route_mr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#route_eng").val($("#route_eng").val() + " ");
				document.getElementById("route_eng").focus()
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
							<strong> <spring:message code="label.addRoute" /></strong>
							
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
							<form action="${pageContext.request.contextPath}/insertRoute"
								id="routeForm" method="post" enctype="multipart/form-data">

<div id="addDiv" style="display: none;">
								<input type="hidden" name="route_id" id="route_id" value="0">
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.nameInEng" /></div>
									<div class="col-md-4">
										<input class="form-control" name="route_eng" id="route_eng" maxlength="50"s
											type="text" required
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>
							
								<div class="col-md-2">
									<spring:message code="label.nameInMr" />
									</div>
									<div class="col-md-4">
										<input class="form-control" name="route_mr" id="route_mr" maxlength="50"
											type="text" required
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>
<div class="form-group"></div>
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.routeSeqNo" />
									</div>
									<div class="col-md-4">
										<input class="form-control" name="r_seq_no" id="r_seq_no"
											min=1 type="number" required 
											oninvalid="setCustomValidity('Please enter Seq No ')"
											onchange="try{setCustomValidity('')}catch(e){}"
											pattern="[0-9]" /> <span class="error" aria-live="polite"></span>
									</div>
								<!-- </div>


								</div> -->
								<div class="col-md-2">
									<spring:message code="label.chooseHub" />
									</div>
									<spring:message code="label.chooseHub" var="selHub" />
									<div class="col-md-4">
										<select class="standardSelect" data-placeholder="${selHub}" onfocus="enableSubmit()" style="width: 100%;"
											 name="sel_hub" id="sel_hub"
											oninvalid="setCustomValidity('Please Select Hub ')"
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
															code="label.routeList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="text-align: center;"><spring:message code="label.srNo" /></th>
																<th style="text-align: center;"><spring:message code="label.routeName" /></th>
																<th style="text-align: center;"><spring:message code="label.routeSeqNo" /></th>
																<th style="text-align: center;"><spring:message code="label.hubsName" /></th>
																<th style="text-align: center;"><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${routeList}" var="route"
																varStatus="count">
																<tr>

																	<td style="text-align: center;">${count.index+1}</td>
																	<td style="text-align: left;"><c:if test="${langSelected == 0}">
																			<c:out value="${route.routeEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${route.routeMarName}" />

																		</c:if></td>
																	<td style="text-align: center;">${route.routeSeqNo}</td>


																	<td style="text-align: left;"><c:if test="${langSelected == 0}">
																			<c:out value="${route.hubEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${route.hubMarName}" />

																		</c:if></td>


																	<td style="text-align: center;">
																			<a href="#" onclick="editRoute(${route.routeId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		&nbsp;
																			<a
																				href="${pageContext.request.contextPath}/deleteRoute/${route.routeId}"
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
	<!-- Left Panel --> <script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
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
	
	function editRoute(routeId){
		
		//alert(catId);
		
		$.getJSON('${getEditRoute}',{
			
			routeId : routeId,
			
			ajax : 'true',

		},
		
		function(data){
			$("#route_mr").val(data.routeMarName);
			$("#route_eng").val(data.routeEngName);
        	
			//hidden field msId
			$("#route_id").val(data.routeId);
			
			$("#r_seq_no").val(data.routeSeqNo); 
			
			//document.getElementById("usr_role").options.selectedIndex =data.isAdmin;
		
			
			$("#sel_hub").val(data.hubId); 
			$("#sel_hub").triger("chosen:updated");
			

		});
		
	}
	
	</script>

	<script type="text/javascript">

function disableSubmit(){
	document.getElementById('submitButton').disabled = true;
}

function enableSubmit(){
	document.getElementById('submitButton').disabled = false;
}
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