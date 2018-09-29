<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add HSN Code</title>

<c:url var="getEditHsnCode" value="/getEditHsnCode" />

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
						<div class="card-header">
							<strong> <spring:message code="label.addHsnCode" /></strong>
							
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
							<form action="${pageContext.request.contextPath}/insertHsnCode"
								method="post" enctype="multipart/form-data">
								
								<div id="addDiv" style="display: none;">
								<div class="row">
								<div class="col-md-2">
									<spring:message code="label.hsnCode" /></div>
									<div class="col-md-10">
										<input class="form-control" name="hsn_code" id="hsn_code" maxlength="100"
											type="text" required
											oninvalid="setCustomValidity('Please enter hsn code ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>
								<input type="hidden" name="hsn_id" id="hsn_id" value="0">
&nbsp;
								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.cgst" />
										</div>
										<div class="col-md-2">
											<input class="form-control" name="cgst" id="cgst" 
												type="text" required pattern="[0-9]+(\.[0-9]{0,2})?%?" maxlength="100" max="100"
												oninvalid="setCustomValidity('Please enter value ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												/> <span class="error"
												aria-live="polite"></span>
										</div>
									

									<div class="col-md-1">
										<spring:message code="label.sgst" />
										</div>
										<div class="col-md-2">
											<input class="form-control" name="sgst" id="sgst" maxlength="100" max="100"
												type="text" required
												oninvalid="setCustomValidity('Please enter value ')"
												onchange="try{setCustomValidity('')}catch(e){}"  pattern="[0-9]+(\.[0-9]{0,2})?%?"/> <span
												class="error" aria-live="polite"></span>
										</div>
								

									<div class="col-md-1">
										<spring:message code="label.igst" />
										</div>
									<div class="col-md-2">
											<input class="form-control" name="igst" id="igst" maxlength="100" max="100"
												type="text" required
												oninvalid="setCustomValidity('Please enter value ')"
												onchange="try{setCustomValidity('')}catch(e){}" pattern="[0-9]+(\.[0-9]{0,2})?%?"/> <span
												class="error" aria-live="polite"></span>
										</div>
									</div>

								
&nbsp;
								<div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
																		<button type="reset"  class="btn btn-primary" style="align-content: center; width: 226px; margin-left: 80px;" ><spring:message code="label.cancel" /></button>
									
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
															code="label.hsnCodeList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="text-align: center;"><spring:message code="label.srNo" /></th>
																<th style="text-align: center;"><spring:message code="label.hsnCode" /></th>
																<th style="text-align: center;"><spring:message code="label.cgst" /></th>
																<th style="text-align: center;"><spring:message code="label.sgst" /></th>
																<th style="text-align: center;"><spring:message code="label.igst" /></th>
																<th style="text-align: center;"><spring:message code="label.action" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${iHsnList}" var="hsn" varStatus="count">
																<tr>

																	<td style="text-align: center;">${count.index+1}</td>
																	<td style="text-align: left;"><c:out value="${hsn.itemHsnCode}" /></td>
																	<td style="text-align: center;"><c:out value="${hsn.itemCgst}" /></td>
																	<td style="text-align: center;">${hsn.itemSgst}</td>
																	
																	<td style="text-align: center;"><c:out value="${hsn.itemIgst}" /></td>
																	
																	<td style="text-align: center;">
																			<%-- <a href="#" onclick="editHsn(${hsn.itemHsnId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																				 --%>
																				<a href="#" onclick="editHsn(${hsn.itemHsnId})"><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																	&nbsp;
																			<a
																				href="${pageContext.request.contextPath}/deleteHsn/${hsn.itemHsnId}"
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
	
	function editHsn(hsnId){
		
		//alert(catId);
		
		$.getJSON('${getEditHsnCode}',{
			
			hsnId : hsnId,
			
			ajax : 'true',

		},
		
		function(data){
			document.getElementById('addDiv').style.display = "block";

			$("#hsn_code").val(data.itemHsnCode);
			$("#cgst").val(data.itemCgst);
			$("#sgst").val(data.itemSgst);
			$("#igst").val(data.itemIgst);
        	
			//hidden field hsn_id for edit
			$("#hsn_id").val(data.itemHsnId);

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