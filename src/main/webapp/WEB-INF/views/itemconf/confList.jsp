<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Configuration List</title>


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
							<strong> <spring:message code="label.confList" /></strong>
							
								&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
							&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
							&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <a
							href="${pageContext.request.contextPath}/showCreateItemConf"><spring:message
									code="label.addConf" /></a>
						</div>
						<div class="card-body card-block">


							<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="text-align: center;"><spring:message code="label.srNo" /></th>
																<th style="text-align: center;"><spring:message code="label.confsName" /></th>
																<th style="text-align: center;"><spring:message code="label.confType" /></th>
																<th style="text-align: center;"><spring:message code="label.confTypeDesc" /></th>
																<th style="text-align: center;"><spring:message code="label.hubTime" /></th>
																<th style="text-align: center;"><spring:message code="label.distTime" /></th>
																<th style="text-align: center;"><spring:message code="label.item" /></th>
															<%-- 	<th><spring:message code="label.action" /></th> --%>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${confList}" var="conf"
																varStatus="count">
																<tr>

																	<td style="text-align: center;">${count.index+1}</td>
																	<td style="text-align: left;"><c:if test="${langSelected == 0}">
																			<c:out value="${conf.configEngName}" />

																		</c:if> <c:if test="${langSelected == 1}">
																			<c:out value="${conf.configMarName}" />


																		</c:if></td>

																	<td style="text-align: center;"><c:if test="${conf.configType == 1}">
																			<spring:message code="label.dateBasis" />

																		</c:if> <c:if test="${conf.configType == 2}">
																			<spring:message code="label.dayBasis" />

																		</c:if>
																		
																		 <c:if test="${conf.configType == 3}">
																			<spring:message code="label.dailyBasis" />

																		</c:if>
																		
																		</td>
																	<td style="text-align: left;">${conf.configTypeDetails}</td>
																	<td style="text-align: center;"><c:out value="${conf.hubFromTime} To ${conf.hubToTime}" /></td>
																	<td style="text-align: center;"><c:out value="${conf.distFromTime} To ${conf.distToTime}" /></td>
<td style="text-align: left;">${conf.itemIds}</td>
																	
																	<%-- <td><div class="fa-hover col-lg-3 col-md-6">
																			<a href="${pageContext.request.contextPath}/editItem/${conf.configId}" ><i
																				class="fa fa-edit"></i> <span class="text-muted"></span></a>
																		</div>

																		<div class="fa-hover col-lg-3 col-md-6">
																			<a
																				href="${pageContext.request.contextPath}/deleteItem/${conf.configId}"
																				onClick="return confirm('Are you sure want to delete this record');"><i
																				class="fa fa-trash-o"></i></a>
																		</div></td> --%>

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

	<script type="text/javascript">
	
	function editMsUser(msId){
		
		//alert(catId);
		
		$.getJSON('${getEditMsUser}',{
			
			msId : msId,
			
			ajax : 'true',

		},
		
		function(data){
			$("#usrname_mr").val(data.msMarName);
			$("#usrname_eng").val(data.msEngName);
        	
			//hidden field msId
			$("#ms_id").val(data.msId);
			
			$("#contact_no").val(data.msContactNo); 
			$("#usr_pass").val(data.msPwd); 
			$("#conf_pass").val(data.msPwd); 
			document.getElementById("usr_role").options.selectedIndex =data.isAdmin;
			var temp=new Array();
			
			temp=(data.hubIds).split(",");
			$("#sel_hub").val(temp); 
			$("#sel_hub").triger("chosen:updated");
			

		});
		
	}
	
	</script>





</body>
</html>