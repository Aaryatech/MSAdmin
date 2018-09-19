<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List Detail</title>

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
						<%-- <div class="card-header">
							<strong> <spring:message code="label.itemList" /></strong>
						</div> --%>
						<div class="card-body card-block">



							<div class="form-group"></div>
							<section class="form-control">
								<div class="row">

									<div class="col-md-2">
										<spring:message code="label.distName" />
										<span class="error" aria-live="polite"></span>
									</div>
									<div class="col-md-3">
										<c:if test="${langSelected == 0}">
											<b><c:out value="${ordHeadDetail.distEngName}"></c:out></b>
										</c:if>

										<c:if test="${langSelected == 1}">
											<b><c:out value="${ordHeadDetail.distMarName}"></c:out></b>
										</c:if>
									</div>

									<div class="col-md-2">
										<spring:message code="label.contactNo" />
										<span class="error" aria-live="polite"></span>
									</div>
									<div class="col-md-2">
										<b><c:out value="${ordHeadDetail.distContactNo}"></c:out></b>
									</div>

								</div>

								<hr></hr>
								<div class="row">

									<div class="col-md-2">
										<spring:message code="label.orderTotal" />
										<span class="error" aria-live="polite"></span>
									</div>
									<div class="col-md-2">
										<b><c:out value="${ordHeadDetail.orderTotal}"></c:out></b>
									</div>

									<div class="col-md-2">
										<spring:message code="label.pendCrates" />
										<span class="error" aria-live="polite"></span>
									</div>
									<div class="col-md-2">
										<b><c:out value="${ordHeadDetail.prevPendingCrateBal}"></c:out></b>
									</div>

									<div class="col-md-2">
										<spring:message code="label.pendAmt" />
										<span class="error" aria-live="polite"></span>
									</div>
									<div class="col-md-2">
										<b><c:out value="${ordHeadDetail.prevPendingAmt}"></c:out></b>
									</div>


								</div>
							</section>

							<%-- <div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary" id="submitButton"
										
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
								</div> --%>

							<form
								action="${pageContext.request.contextPath}/editOrderProcess"
								id="order_search_form" method="post"
								enctype="multipart/form-data">
								<div class="content mt-3">
									<div class="animated fadeIn">
										<div class="row">

											<div class="col-md-12">
												<div class="card">
													<div class="card-header">
														<strong class="card-title"><spring:message
																code="label.orList" /></strong>
													</div>
													<div class="card-body">
														<table id="bootstrap-data-table"
															class="table table-striped table-bordered">
															<thead>
																<tr>
																	<th style="text-align: center;"><spring:message
																			code="label.srNo" /></th>
																	<th style="text-align: center;"><spring:message
																			code="label.name" /></th>
																	<th style="text-align: center;"><spring:message
																			code="label.itemWeight" /></th>
																	<th style="text-align: center;"><spring:message
																			code="label.UOM" /></th>
																	<th style="text-align: center;"><spring:message
																			code="label.itemRate" /></th>
																	<th style="text-align: center;"><spring:message
																			code="label.orderQty" /></th>

																	<th style="text-align: center;"><spring:message
																			code="label.total" /></th>


																</tr>
															</thead>
															<tbody>
																<c:forEach items="${ordHeadDetail.getOrderDetailList}"
																	var="order" varStatus="count">
																	<tr>

																		<td style="text-align: center;">${count.index+1}</td>
																		<td style="text-align: left;"><c:if
																				test="${langSelected == 0}">
																				<c:out value="${order.itemEngName}" />

																			</c:if> <c:if test="${langSelected == 1}">
																				<c:out value="${order.itemMarName}" />
																			</c:if></td>


																		<td style="text-align: right;">${order.itemWt}</td>
																		<td style="text-align: left;"><c:out
																				value="${order.uomName}" /></td>
																		<td style="text-align: right;">${order.itemRate}</td>
																		<td style="text-align: center;"><input
																			name='hub_ord_qty${order.orderDetailId}'
																			id="hub_ord_qty${order.orderDetailId}" type="number"
																			required value="${order.msQty}" min=0
																			style="width: 75px;"
																			onchange="updateTotal(this.value,${order.orderDetailId},${order.itemRate})"
																			pattern="[0-9]" /> <span class="error"
																			aria-live="polite"></span></td>

																		<td style="text-align: center;"><input
																			name='item_total${order.orderDetailId}'
																			id='item_total${order.orderDetailId}'
																			style="width: 90px;" type="number" readonly required
																			value="${order.itemTotal}" min=0
																			oninvalid="setCustomValidity('Please enter item total')"
																			onchange="try{setCustomValidity('')}catch(e){}" /> <span
																			class="error" aria-live="polite"></span></td>


																		<%-- 																	<td><div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/editOrderDetail/${order.orderDetailId}"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteOrderDetail/${order.orderDetailId}"
																				onClick="return confirm('Are you sure want to delete this record');"><i
																				class="fa fa-trash-o"></i></a>
																		</div></td>

 --%>
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

									<button type="submit" class="btn btn-primary" id="submitButton"
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
								</div>
							</form>

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

	<script type="text/javascript">
  function updateTotal(qty,detailId,rate){
	  
	  if(qty>=0){
	  
		var itemTot=qty*parseFloat(rate);
	  
	  document.getElementById("item_total"+detailId).value=itemTot.toFixed(2);
	  
	  }else{
		  
		  document.getElementById("hub_ord_qty"+detailId).value="0";
	  }
  }
  
  </script>


</body>
</html>