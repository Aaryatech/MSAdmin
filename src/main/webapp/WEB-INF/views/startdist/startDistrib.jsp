<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Start Distribution</title>
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
				<h4>
					<spring:message code="label.startDist" />
					${datewiseRouteList[0].currDate}
				</h4>
			</div>
			<div class="card-body">
			<form
								action="${pageContext.request.contextPath}/startDistProcess" id="start_dist_form"
								method="post" enctype="multipart/form-data">
				<%-- <div class="custom-tab">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">

							<a class="nav-item nav-link active" id="custom-nav-home-tab"
								data-toggle="tab" href="#custom-nav-home" role="tab"
								aria-controls="custom-nav-home" aria-selected="true">${datewiseRouteList[0].currDate}</a>
							
						</div>
					</nav> --%>
					<!-- <div class="tab-content pl-3 pt-2" id="nav-tabContent">
						<div class="tab-pane fade show active" id="custom-nav-home"
							role="tabpanel" aria-labelledby="custom-nav-home-tab"> -->
							<p>
							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"> <%-- <spring:message
															code="label.alcrtlist" /> --%>
													</strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="text-align: center" class="check" ><input type="checkbox" 
																	name="selAll" id="selAll" /> All</th>
																<th style="text-align: center"><spring:message code="label.srNo" /></th>
																<th style="text-align: center"><spring:message code="label.routeName" /></th>
																<th style="text-align: center"><spring:message code="label.routeSupName" /></th>
																<th style="text-align: center"><spring:message code="label.driverName" /></th>
																<th style="text-align: center"><spring:message code="label.vehNo" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach
																items="${datewiseRouteList[0].routeAllocationList}"
																var="routeAl" varStatus="count">
																<tr>
																	<td style="text-align: center">
																	<c:choose>
																	<c:when test="${routeAl.isSameRoute==0}">
																	<input type="checkbox" name="distRoute"
																		value="${routeAl.routeId}" /></c:when>
																		<c:otherwise>
																		<c:out value="-" />
																		</c:otherwise>
																		</c:choose>
																		</td>
																		
																	<td style="text-align: center">${count.index+1}</td>
																	
																	<td style="text-align: left"><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.routeEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.routeMarName}" />
																		</c:if></td>

																	<td style="text-align: left"><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.supEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.supMarName}" />
																		</c:if></td>

																	<td style="text-align: left"><c:if test="${langSelected == 0}">
																			<c:out value="${routeAl.driverEngName}" />
																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${routeAl.driverMarName}" />
																		</c:if></td>
																		
																	<td style="text-align: center">${routeAl.vehicleNo}</td>
																	
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
							<div class="col-lg-12" align="center">

									<button type="button" class="btn btn-primary" onclick="valthisform()"
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
								</div>
							</form>
							
						</div>
						
					</div>

			<!-- 	</div> cutom-tab  -->
				
				
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
				disable_search_threshold : 2,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
			
			   $("#selAll").click(function () {
		              $('#bootstrap-data-table tbody input[type="checkbox"]').prop('checked', this.checked);
		          });
		});
	</script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=datepicker]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
		
		
		
		function valthisform()
		{
		    var checkboxs=document.getElementsByName("distRoute");
		    var okay=false;
		    for(var i=0,l=checkboxs.length;i<l;i++)
		    {
		        if(checkboxs[i].checked)
		        {
		            okay=true;
		            break;
		        }
		    }
		    if(okay){
		    	
		    	var form=document.getElementById("start_dist_form");
		    	
		    	form.submit();
		    }
		    else alert("Please check a checkbox");
		}
	</script>
	
</body>
</html>

