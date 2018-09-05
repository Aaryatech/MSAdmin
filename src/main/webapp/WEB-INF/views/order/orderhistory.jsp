<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>

<c:url var="getEditMsUser" value="/getEditMsUser" />

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/apple-icon.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/favicon.ico">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <!-- css for date picker proper UI -->
 
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
						<%-- <div class="card-header">
							<strong> <spring:message code="label.itemList" /></strong>
						</div> --%>
						<div class="card-body card-block">
<form action="${pageContext.request.contextPath}/getOrderHistory"
								id="order_search_form" method="post" enctype="multipart/form-data">


<div class="form-group"></div>
								<div class="form-group"></div>
								<div class="row">
									<div class="col-md-2">
									<spring:message code="label.chooseHub" />
									</div>
									<spring:message code="label.chooseHub" var="selHub" />
									<div class="com-md-2">
										<select data-placeholder="${selHub}" 
											class="form-control" name="sel_hub" id="sel_hub"
											oninvalid="setCustomValidity('Please Select HUbs ')"
											onchange="try{setCustomValidity('')}catch(e){}">

											<c:forEach items="${hubList}" var="hub">
<c:choose>
													<c:when test="${langSelected == 0}">
														<c:choose>
															<c:when test="${hub.hubId==selectedHub}">
																<option selected value="${hub.hubId}">${hub.hubEngName}</option>
															</c:when>
															<c:otherwise>
																<option  value="${hub.hubId}">${hub.hubEngName}</option>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
													<c:choose>
															<c:when test="${hub.hubId==selectedHub}">
																<option selected value="${hub.hubId}">${hub.hubMarName}</option>
															</c:when>
															<c:otherwise>
																<option  value="${hub.hubId}">${hub.hubMarName}</option>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</c:forEach>


										</select> <span class="error" aria-live="polite"></span>

									</div>
									<div class="col-md-1">
									<spring:message code="label.selDate" />
									</div>
									
									<div class="col-md-1">
										<input type="text" value="${ordDate}" id="datepicker" name="date"/> <span class="error" aria-live="polite"></span>
									</div>&nbsp;&nbsp;
									<div class="col-md-2">
									
									</div>
									<div class="col-md-1">
									<button type="submit" class="btn btn-primary" id="submitButton">
										<spring:message code="label.submit" />
									</button>
									
									</div>
								</div>
								<div class="col-lg-12" align="center">

									<%-- <button type="submit" class="btn btn-primary" id="submitButton"
										
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button> --%>
								</div>
								</form>
								</div>
								
								
								
								
							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><spring:message
															code="label.ordHistory" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th><spring:message code="label.srNo" /></th>
																<th><spring:message code="label.distName" /></th>
																<th><spring:message code="label.contactNo" /></th>
																<th><spring:message code="label.orderTotal" /></th>
																<th><spring:message code="label.pendCrates" /></th>
																<th><spring:message code="label.pendAmt" /></th>
																<th><spring:message code="label.action" /></th>
																
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
															<c:forEach items="${ordHeaderList}" var="item"
																varStatus="count">
																<tr>

																	<td>${count.index+1}</td>
																	<td><c:if test="${langSelected == 0}">
																			<c:out value="${item.distEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${item.distMarName}" />


																		</c:if></td>

																	
																	<td>${item.distContactNo}</td>
																	<td><c:out value="${item.orderTotal}" /></td>
																	<td>${item.prevPendingCrateBal}</td>

																	<td>${item.prevPendingAmt}</td>
																	

																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="${pageContext.request.contextPath}/showOrderHisDetail/${item.orderHeaderId}" ><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<%-- <a
																				href="${pageContext.request.contextPath}/deleteOrder/${item.orderHeaderId}"
																				onClick="return confirm('Are you sure want to delete this record');"><i
																				class="fa fa-trash-o"></i></a> --%>
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
	
	<!-- .content -->

	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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