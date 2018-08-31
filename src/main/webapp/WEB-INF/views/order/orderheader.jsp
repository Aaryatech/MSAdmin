<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>

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
						<%-- <div class="card-header">
							<strong> <spring:message code="label.itemList" /></strong>
						</div> --%>
						<div class="card-body card-block">
<form action="${pageContext.request.contextPath}/getOrderHeader"
								id="order_search_form" method="post" enctype="multipart/form-data">


<div class="form-group"></div>
								<div class="form-group"></div>
								<div class="col-md-6">
									<spring:message code="label.chooseHub" />
									<spring:message code="label.chooseHub" var="selHub" />
									<div class="input-group">
										<select data-placeholder="${selHub}" multiple
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
								</div>
								
								<div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary" id="submitButton"
										disabled
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
															code="label.alcrtlist" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.distName" /></th>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.srNo" /></th>
																
																<!-- 
																<th>Sr no</th>
																<th>Dist Name</th>
																<th>Mob no</th>
																<th>order tot</th>
																<th>Pend crates</th>
																<th>pend amt</th>
																<th>action</th> -->
															</tr>
														</thead>
														<tbody>
															<%-- <c:forEach items="${itemList}" var="item"
																varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${item.itemEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${item.itemMarName}" />


																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${item.catEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${item.catMarName}" />


																		</c:if></td>
																	<td>${item.itemHsnCode}</td>
																	<td><c:out value="${item.uomName}" /></td>
																	<td>${item.itemWt}</td>

																	<td>${item.itemRate}</td>
																	<td><c:out value="${item.itemMrp}" /></td>

																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="${pageContext.request.contextPath}/editItem/${item.itemId}" ><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteItem/${item.itemId}"
																				onClick="return confirm('Are you sure want to delete this record');"><i
																				class="fa fa-trash-o"></i></a>
																		</div></td>

																</tr>
															</c:forEach> --%>
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
<!-- for multiple select  -->
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

	<!-- end for multiple select  -->


	<!-- for data table search and sorting  -->
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

	<!--end  for data table search and sorting  -->

	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>

	
</body>
</html>