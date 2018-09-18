<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Driver</title>

<c:url var="getEditDriver" value="/getEditDriver" />

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
		control.makeTransliteratable([ "drname_mr" ]);
		var keyVal = 32; // Space key
		$("#drname_eng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#drname_eng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#drname_mr")
										.val(
												$("#drname_mr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("drname_mr").focus();
								$("#drname_mr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#drname_mr").val("");

								$("#drname_eng").val("");
							}
						});

		$("#drname_mr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#drname_eng").val($("#drname_eng").val() + " ");
				document.getElementById("drname_eng").focus()
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
							<strong> <spring:message code="label.addDriver" /></strong>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="image"
								src="${pageContext.request.contextPath}/resources/images/addnewrecord.png"
								id="addButton" onclick="addButton();" height="25px;"
								width="25px;" /> <input type="image"
								src="${pageContext.request.contextPath}/resources/images/collapse_icon.png"
								id="addButton" onclick="hideButon();" height="25px;"
								width="25px;" />

						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertDriver"
								method="post" enctype="multipart/form-data">
								<div id="addDiv" style="display: none;">

									<div class="form-group"></div>
									<div class="row">
										<div class="col-md-2">

											<spring:message code="label.catEngName" />
										</div>
										<div class="col-md-4">
											<input class="form-control" name=drname_eng id="drname_eng"
												type="text" required
												oninvalid="setCustomValidity('Please enter name ')"
												onchange="try{setCustomValidity('')}catch(e){}" /> <span
												class="error" aria-live="polite"></span>

										</div>

										<input type="hidden" name="driver_id" id="driver_id" value="0">

										<div class="col-md-2">
											<spring:message code="label.catMarName" />
										</div>
										<div class="col-md-4">
											<input class="form-control" name="drname_mr" id="drname_mr"
												type="text" required
												oninvalid="setCustomValidity('Please enter name ')"
												onchange="try{setCustomValidity('')}catch(e){}" /> <span
												class="error" aria-live="polite"></span>
										</div>
									</div>

									<div class="form-group"></div>
									<div class="row">
										<div class="col-md-2">

											<spring:message code="label.contactNo" />
										</div>

										<div class="col-md-4">
											<input class="form-control" name="contact_no" id="contact_no"
												onblur="validateMobNo()" type="text" required
												oninvalid="setCustomValidity('Please enter mobile no ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												pattern="[0-9]{10}" /> <span class="error"
												aria-live="polite"></span>
										</div>

										<div class="col-md-2" align="center"></div>
										<div class="col-md-2">

											<button type="submit" class="btn btn-primary"
												style="align-content: center; width: auto;">
												<spring:message code="label.submit" />
											</button>
										</div>
										<div class="col-md-2">
											<button type="reset" class="btn btn-primary"
												style="align-content: center; width: auto; ">
												<spring:message code="label.cancel" />
											</button>

										</div>
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
															code="label.driverList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="text-align: center;"><spring:message code="label.srNo" /></th>
																<th style="text-align: center;"><spring:message code="label.driverName" /></th>
																<th style="text-align: center;"><spring:message code="label.contactNo" /></th>
																<th style="text-align: center;"><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${driverList}" var="driver"
																varStatus="count">
																<tr>

																	<td style="text-align: center;">${count.index+1}</td>
																	<td style="text-align: left;"><c:if test="${langSelected == 0}">
																			<c:out value="${driver.driverEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${driver.driverMarName}" />

																		</c:if></td>
																	<td style="text-align: center;">${driver.driverContactNo}</td>
																	<td style="text-align: center;">
																			<a href="#" onclick="editDriver(${driver.driverId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		&nbsp;
																			<a
																				href="${pageContext.request.contextPath}/deleteDriver/${driver.driverId}"
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
	
	function editDriver(driverId){
		
		//alert(catId);
		
		$.getJSON('${getEditDriver}',{
			
			driverId : driverId,
			
			ajax : 'true',

		},
		
		function(data){
			document.getElementById('addDiv').style.display = "block";
			$("#drname_mr").val(data.driverMarName);
			$("#drname_eng").val(data.driverEngName);
			$("#contact_no").val(data.driverContactNo);
			
        	//hidden field driver_id
			$("#driver_id").val(data.driverId);

        	

		});
		
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