<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Allocated User List</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


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
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">
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
<body>

	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->




	<!-- /# column -->
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<h4><spring:message
															code="label.alcrtlist" /></h4>
			</div>
			<div class="card-body">
				<div class="custom-tab">

					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
						
							<a class="nav-item nav-link active" id="custom-nav-home-tab"
								data-toggle="tab" href="#custom-nav-home" role="tab"
								aria-controls="custom-nav-home" aria-selected="true">${datewiseRouteList[0].currDate}</a>
								
							<a class="nav-item nav-link" id="custom-nav-profile-tab"
								data-toggle="tab" href="#custom-nav-profile" role="tab"
								aria-controls="custom-nav-profile" aria-selected="false">${datewiseRouteList[1].currDate}</a>
							<a class="nav-item nav-link" id="custom-nav-contact-tab"
								data-toggle="tab" href="#custom-nav-contact" role="tab"
								aria-controls="custom-nav-contact" aria-selected="false">${datewiseRouteList[2].currDate}</a>
								
								
								   <a class="nav-item nav-link" id="custom-nav-day4-tab" data-toggle="tab" href="#custom-nav-day4" role="tab" aria-controls="custom-nav-day4" aria-selected="false">${datewiseRouteList[3].currDate}</a>
                                           <a class="nav-item nav-link" id="custom-nav-day5-tab" data-toggle="tab" href="#custom-nav-day5" role="tab" aria-controls="custom-nav-day5" aria-selected="false">${datewiseRouteList[4].currDate}</a>
                                           
						</div>
					</nav>
					<div class="tab-content pl-3 pt-2" id="nav-tabContent">
						<div class="tab-pane fade show active" id="custom-nav-home"
							role="tabpanel" aria-labelledby="custom-nav-home-tab">
							<p>
							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><%-- <spring:message
															code="label.alcrtlist" /> --%></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.routeName" /></th>
																<th><spring:message code="label.routeSupName" /></th>
																<th><spring:message code="label.driverName" /></th>
																<th><spring:message code="label.vehNo" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach
																items="${datewiseRouteList[0].routeAllocationList}"
																var="routeAl" varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.routeEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.routeMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.supEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.supMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.driverEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.driverMarName}" />
																		</c:if></td>
																	<td>${routeAl.vehicleNo}</td>

																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="#" onclick="editCate(${routeAl.trId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteCategory/${routeAl.trId}"
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
							</p>
						</div>
						<div class="tab-pane fade" id="custom-nav-profile" role="tabpanel"
							aria-labelledby="custom-nav-profile-tab">
							<p>
							
							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><%-- <spring:message
															code="label.alcrtlist" /> --%></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.routeName" /></th>
																<th><spring:message code="label.routeSupName" /></th>
																<th><spring:message code="label.driverName" /></th>
																<th><spring:message code="label.vehNo" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach
																items="${datewiseRouteList[1].routeAllocationList}"
																var="routeAl" varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.routeEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.routeMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.supEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.supMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.driverEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.driverMarName}" />
																		</c:if></td>
																	<td>${routeAl.vehicleNo}</td>

																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="#" onclick="editCate(${routeAl.trId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteCategory/${routeAl.trId}"
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
							
							</p>
						</div>
						<div class="tab-pane fade" id="custom-nav-contact" role="tabpanel"
							aria-labelledby="custom-nav-contact-tab">
							<p><div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><%-- <spring:message
															code="label.alcrtlist" /> --%></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.routeName" /></th>
																<th><spring:message code="label.routeSupName" /></th>
																<th><spring:message code="label.driverName" /></th>
																<th><spring:message code="label.vehNo" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach
																items="${datewiseRouteList[2].routeAllocationList}"
																var="routeAl" varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.routeEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.routeMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.supEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.supMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.driverEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.driverMarName}" />
																		</c:if></td>
																	<td>${routeAl.vehicleNo}</td>

																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="#" onclick="editCate(${routeAl.trId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteCategory/${routeAl.trId}"
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
							</p>
							
							</div>
				
							
							<div class="tab-pane fade" id="custom-nav-day4" role="tabpanel" aria-labelledby="custom-nav-day4-tab">
							
							<p><div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><%-- <spring:message
															code="label.alcrtlist" /> --%></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.routeName" /></th>
																<th><spring:message code="label.routeSupName" /></th>
																<th><spring:message code="label.driverName" /></th>
																<th><spring:message code="label.vehNo" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach
																items="${datewiseRouteList[3].routeAllocationList}"
																var="routeAl" varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.routeEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.routeMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.supEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.supMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.driverEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.driverMarName}" />
																		</c:if></td>
																	<td>${routeAl.vehicleNo}</td>

																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="#" onclick="editCate(${routeAl.trId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteCategory/${routeAl.trId}"
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
							</p>
						</div>
						
						<!--  Day 5 -->
						 <div class="tab-pane fade" id="custom-nav-day5" role="tabpanel" aria-labelledby="custom-nav-day5-tab">
						 <p>
						 
						 <div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><%-- <spring:message
															code="label.alcrtlist" /> --%></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.routeName" /></th>
																<th><spring:message code="label.routeSupName" /></th>
																<th><spring:message code="label.driverName" /></th>
																<th><spring:message code="label.vehNo" /></th>
																<th><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach
																items="${datewiseRouteList[4].routeAllocationList}"
																var="routeAl" varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.routeEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.routeMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.supEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.supMarName}" />
																		</c:if></td>

																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.driverEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.driverMarName}" />
																		</c:if></td>
																	<td>${routeAl.vehicleNo}</td>

																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="#" onclick="editCate(${routeAl.trId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteCategory/${routeAl.trId}"
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
						 </p>
						 
						 </div>
						
						
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /# column -->




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
                disable_search_threshold: 10,
                no_results_text: "Oops, nothing found!",
                width: "100%"
            });
        });
    </script>

	<script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>


	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
  $( function() {
	  $('input[id$=datepicker]').datepicker({
		    dateFormat: 'dd-mm-yy'
		});
  } );
  </script>


</body>
</html>

