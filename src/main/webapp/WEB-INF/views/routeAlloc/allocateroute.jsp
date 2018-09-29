<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Allocate Route</title>

<c:url var="getRouteAllocData" value="/getRouteAllocData" />

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/apple-icon.png">
<%-- <link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/favicon.ico">
 --%>
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- css for date picker proper UI -->


</head>


<!-- Translate -->



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>



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
							<strong> <spring:message code="label.routeAllocation" /></strong>
						</div>
						<div class="card-body card-block">
							<form id="route_alloc_form" method="post"
								enctype="multipart/form-data">
								<div class="form-group"></div>
								<div class="row">

									<div class="col-md-2">
										<spring:message code="label.fromDate" />
									</div>
									<div class="col-md-3">
										<input type="text" id="from_date" name="from_date"
											value="${fromDate}" onblur="getData1()" /> <span
											class="error" aria-live="polite"></span>

									</div>

									<div class="col-md-2">
										<spring:message code="label.toDate" />
									</div>
									<div class="col-md-3">
										<input type="text" id="to_date" name="to_date"
											value="${toDate}" onblur="getData1()" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>


								<div class="form-group"></div>
								<div class="row">

									<div class="col-lg-12" align="center">

										<button type="button" class="btn btn-primary"
											onclick="getData()"
											style="align-content: center; width: 226px; margin-left: 80px;">
											<spring:message code="label.submit" />
										</button>
										<button type="reset" class="btn btn-primary"
											style="align-content: center; width: 226px; margin-left: 80px;">
											<spring:message code="label.cancel" />
										</button>

									</div>
								</div>
								<br></br> <input type="hidden" name="tr_id" id="tr_id"
									value="${editRouteAll.trId}">

								<div class="row">

									<div class="col-md-2">
										<spring:message code="label.routeName" />
									</div>
									<div class="col-md-3">
										<select data-placeholder="" style="width: 100%;"
											class="standardSelect" name="route_name" id="route_name"
											oninvalid="setCustomValidity('Please Select Route Name ')"
											onchange="try{setCustomValidity('')}catch(e){}">
											<option value="-1">Please Select Route</option>

											<c:forEach items="${routeList}" var="route">


												<c:choose>
													<c:when test="${langSelected eq 0}">

														<option value="${route.routeId}">${route.routeEngName}</option>

													</c:when>
													<c:otherwise>
														<option value="${route.routeId}">${route.routeMarName}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
											<c:choose>
												<c:when test="${langSelected eq 0}">

													<option selected value="${editRouteAll.routeId}">${editRouteAll.routeEngName}</option>

												</c:when>
												<c:otherwise>
													<option selected value="${editRouteAll.routeId}">${editRouteAll.routeMarName}</option>


												</c:otherwise>
											</c:choose>




										</select> <span class="error" aria-live="polite"></span>
									</div>

									&nbsp;&nbsp;
									<div class="col-md-2">
										<spring:message code="label.vehNo" />
									</div>
									<div class="col-md-3">
										<select data-placeholder="" style="width: 100%;"
											class="standardSelect" name="veh_no" id="veh_no"
											oninvalid="setCustomValidity('Please Select Vehicle No ')"
											onchange="try{setCustomValidity('')}catch(e){}">
											<option value="-1">Please Select Vehicle No</option>

											<c:forEach items="${vehicleList}" var="veh">

												<option value="${veh.vehicleId}">${veh.vehicleNo}</option>

											</c:forEach>

											<option selected value="${editRouteAll.vehicleId}">${editRouteAll.vehicleNo}</option>

										</select> <span class="error" aria-live="polite"></span>
									</div>

								</div>


								<br></br>

								<div class="row">

									<div class="col-md-2">
										<spring:message code="label.routeSupName" />
									</div>
									<div class="col-md-3">
										<select data-placeholder="" style="width: 100%;"
											class="standardSelect" name="sup_name" id="sup_name"
											oninvalid="setCustomValidity('Please Select Route Supervisior ')"
											onchange="try{setCustomValidity('')}catch(e){}">
											<option value="-1">Please Select Route Supervisor</option>


											<c:forEach items="${routeSupList}" var="sup">
												<c:choose>

													<c:when test="${langSelected==0}">

														<option value="${sup.supId}">${sup.supEngName}</option>

													</c:when>
													<c:otherwise>
														<option value="${sup.supId}">${sup.supMarName}</option>

													</c:otherwise>

												</c:choose>

											</c:forEach>

											<c:choose>
												<c:when test="${langSelected eq 0}">

													<option selected value="${editRouteAll.supervisorId}">${editRouteAll.supEngName}</option>

												</c:when>
												<c:otherwise>
													<option selected value="${editRouteAll.supervisorId}">${editRouteAll.supMarName}</option>

												</c:otherwise>
											</c:choose>


										</select> <span class="error" aria-live="polite"></span>
									</div>

									&nbsp;&nbsp;
									<div class="col-md-2">
										<spring:message code="label.driverName" />
									</div>
									<div class="col-md-3">
										<select data-placeholder="" style="width: 100%;"
											class="standardSelect" name="driver_name" id="driver_name"
											oninvalid="setCustomValidity('Please Select Driver')"
											onchange="try{setCustomValidity('')}catch(e){}">
											<option value="-1">Please Select Driver</option>


											<c:forEach items="${driverList}" var="drList">
												<c:choose>
													<c:when test="${langSelected==0}">
														
																<option  value="${driver.driverId}">${drList.driverEngName}</option>
															</c:when>
															
													
													<c:otherwise>
														
																<option  value="${drList.driverId}">${drList.driverMarName}</option>

														

													</c:otherwise>

												</c:choose>

											</c:forEach>
											
												<c:choose>
												<c:when test="${langSelected eq 0}">

													<option selected value="${editRouteAll.driverId}">${editRouteAll.driverEngName}</option>

												</c:when>
												<c:otherwise>
													<option selected value="${editRouteAll.driverId}">${editRouteAll.driverMarName}</option>

												</c:otherwise>
											</c:choose>

										</select> <span class="error" aria-live="polite"></span>
									</div>


								</div>



								<br></br>



								<div class="col-lg-12" align="center">

									<button type="button" class="btn btn-primary"
										onclick="validateForm()"
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
								</div>

							</form>

							<%-- 				<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><spring:message
															code="label.vehList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.vehNo" /></th>
																<th><spring:message code="label.vehOwner" /></th>
																<th><spring:message code="label.inServiceFrom" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${vehicleList}" var="veh"
																varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:out value="${veh.vehicleNo}" /></td>
																	<td><c:choose>
																			<c:when test="${veh.vehicleOwnedBy==0}">
																				<spring:message code="label.self" />
																			</c:when>
																			<c:otherwise>
																				<spring:message code="label.contractor" />
																			</c:otherwise>

																		</c:choose></td>

																	<td>${veh.vehicleInServiceFrom}</td>
																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="#" onclick="editVehicle(${veh.vehicleId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteVehicle/${veh.vehicleId}"
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
							</div> --%>





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

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>

	<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 2,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script>



	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=from_date]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});

		$(function() {
			$('input[id$=to_date]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>



	<script type="text/javascript">
		function getData() {

			//alert("Hi");
			//alert("Hi");
			var fromDate = document.getElementById("from_date").value;
			var toDate = document.getElementById("to_date").value;

			//alert("from Date " +fromDate);
			//alert("toDate " +toDate);
			var valid = true;
			if (fromDate == null || fromDate == "") {
				valid = false;
				alert("Select From Date");
			} else if (toDate == null || toDate == "") {
				valid = false;
				alert("Select To Date");
			}

			if (valid == true) {

				$
						.getJSON(
								'${getRouteAllocData}',
								{

									from_date : fromDate,
									to_date : toDate,
									ajax : 'true',

								},

								function(data) {

									var selLang = ${langSelected};
									

									var html = '<option value="-1" selected >Select Route</option>';

									var len = data.routeList.length;

									//alert(selLang);
									var routeName;
									for (var i = 0; i < len; i++) {
										if (selLang == 0) {
											routeName = data.routeList[i].routeEngName;
										} else {
											routeName = data.routeList[i].routeMarName;
										}
										html += '<option value="' + data.routeList[i].routeId + '">'
												+ routeName + '</option>';
									}
									html += '</option>';

									$('#route_name').html(html);
									$("#route_name").trigger("chosen:updated");

									var html1 = '<option value="-1" selected >Select Vehicle No</option>';
									var len1 = data.vehicleList.length;

									for (var j = 0; j < len1; j++) {

										html1 += '<option value="' + data.vehicleList[j].vehicleId + '">'
												+ data.vehicleList[j].vehicleNo
												+ '</option>';
									}
									html1 += '</option>';
									$('#veh_no').html(html1);
									$("#veh_no").trigger("chosen:updated");

									var supName;
									html = '<option value="-1" selected >Select Route Supervisor</option>';
									len = data.routeSupList.length;
									for (var i = 0; i < len; i++) {
										if (selLang == 0) {
											supName = data.routeSupList[i].supEngName;
										} else {
											supName = data.routeSupList[i].supMarName;
										}

										html += '<option value="' + data.routeSupList[i].supId + '">'
												+ supName + '</option>';
									}
									html += '</option>';
									$('#sup_name').html(html);
									$("#sup_name").trigger("chosen:updated");
									//$('#sup_name').formcontrol('refresh');

									var driverName;

									html = '<option value="-1" selected >Select Driver</option>';
									len = data.driverList.length;
									for (var i = 0; i < len; i++) {

										if (selLang == 0) {
											driverName = data.driverList[i].driverEngName;
										} else {
											driverName = data.driverList[i].driverMarName;
										}

										html += '<option value="' + data.driverList[i].driverId + '">'
												+ driverName + '</option>';
									}
									html += '</option>';
									$('#driver_name').html(html);
									$("#driver_name").trigger("chosen:updated");
									//$('#driver_name').formcontrol('refresh');

								});

			}//end of if

		}
	</script>

	<script type="text/javascript">
		function validateForm() {
			var route = document.getElementById("route_name").value;

			var veh = document.getElementById("veh_no").value;
			var sup = document.getElementById("sup_name").value;
			var driver = document.getElementById("driver_name").value;

			var valid = true;
			if (route < 0) {
				valid = false;
				alert("Select Route");
			} else if (veh < 0) {

				valid = false;
				alert("Select Vehicle");
			} else if (sup < 0) {
				valid = false;
				alert("Select Supervisor");
			} else if (driver < 0) {
				valid = false;
				alert("Select Driver");
			}

			if (valid == true) {
				//alert("all true");
				var form = document.getElementById("route_alloc_form");
				form.action = "${pageContext.request.contextPath}/insertRouteAlloc";
				form.submit();
			}

		}
	</script>

	<script type="text/javascript">
		function refreshPage() {

		}
	</script>



</body>
</html>