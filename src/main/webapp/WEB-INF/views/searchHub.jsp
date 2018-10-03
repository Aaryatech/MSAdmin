<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>HUB Search Detail</title>


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

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- css for date picker proper UI -->


<style type="text/css">
.right {
	text-align: right;
}

.left {
	text-align: left;
}

.center {
	text-align: center;
}
</style>

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
		control.makeTransliteratable([ "txtMarathi" ]);
		var keyVal = 32; // Space key
		$("#txtEnglish")
				.on(
						'keydown',
						function(event) {
							var engText = $("#txtEnglish").val() + " ";

							if (event.keyCode === 32) {

								var engTextArray = engText.split(" ");
								$("#txtMarathi")
										.val(
												$("#txtMarathi").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("txtMarathi").focus();
								$("#txtMarathi").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#txtMarathi").val("");

								$("#txtEnglish").val("");
							}

						});

		$("#txtMarathi").bind("keyup", function(event) {
			setTimeout(function() {
				$("#txtEnglish").val($("#txtEnglish").val() + " ");
				document.getElementById("txtEnglish").focus()
			}, 0);
		});
	} //end onLoad function

	google.setOnLoadCallback(OnLoad);
</script>
<!-- Translate -->
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<body>
	<c:url var="getOrderByDate" value="/getOrderByDateHubId"></c:url>


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
							<%-- 							<strong> <spring:message code="label.addNewHubUser" /></strong>
 --%>
						</div>
						<div class="card-body card-block">
							<form method="post">
								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.hubsName" />
									</div>
									<div class="col-lg-4">
										<div class="input-group" style="align-items: center;">



											<c:set var="hubName" value="-"></c:set>
											<c:if test="${langSelected == 0}">
												<c:set var="hubName" value="${hub.hubEngName}"></c:set>
											</c:if>
											<c:if test="${langSelected == 1}">
												<c:set var="hubName" value="${hub.hubMarName}"></c:set>

											</c:if>
											<input class="form-control" name="orderDate" id="orderDate"
												type="text" value="${hubName}" disabled />

										</div>
									</div>
									<%-- 	<div class="col-md-2">

										<c:if test="${langSelected==0}">
									${hub.hubEngName}
									</c:if>
										<c:if test="${langSelected==1}">
									${hub.hubMarName}
									</c:if>

									</div> --%>

									<div class="col-md-2">
										<spring:message code="label.contactNo" />

									</div>

									<div class="col-md-4">
										<input class="form-control" name="orderDate" id="orderDate"
											type="text" value="${hub.hubContactNo}" disabled />
									</div>



									<div class="form-group"></div>

									<div class="form-group">
										<div class="col-md-5">
											<spring:message code="label.address" />
										</div>
										<div class="col-md-7">
											<div class="input-group" style="align-items: center;">



												<c:set var="hubAdd" value="-"></c:set>
												<c:if test="${langSelected == 0}">
													<c:set var="hubAdd" value="${hub.hubEngAdd}"></c:set>
												</c:if>
												<c:if test="${langSelected == 1}">
													<c:set var="hubAdd" value="${hub.hubMarAdd}"></c:set>

												</c:if>
												<input class="form-control" name="orderDate" id="orderDate"
													type="text" value="${hubAdd}" disabled />

											</div>
										</div>
									</div>
									<%-- <c:if test="${langSelected==0}">
									${hub.hubEngAdd}
									</c:if>
										<c:if test="${langSelected==1}">
									${hub.hubMarAdd}
									</c:if> --%>
								</div>
						</div>
						&nbsp;



						<spring:message code="label.regOrder" var="regOr" />
						<input type="hidden" id="regOrd" value="${regOr}">
						<spring:message code="label.spOrder" var="spOr" />
						<input type="hidden" id="spOrd" value="${spOr}">


						<%-- <div class="row">
									<div class="col-md-2">
										<spring:message code="label.routeSeqNo" />
									</div>
									<div class="col-md-2">${dist.routeDistSeqNo}</div>

									<div class="col-md-2">
										<spring:message code="label.distCratesPending" />
									</div>
									<div class="col-md-2">${dist.distCratesPending}</div>


									<div class="col-md-2">
										<spring:message code="label.distCratesLimit" />
									</div>
									<div class="col-md-2">${dist.distCratesLimit}</div>
								</div>
								&nbsp;
								<div class="row">
									<div class="col-md-2">
										<spring:message code="label.distAmtPending" />
									</div>


									<div class="col-md-2">${dist.distAmtPending}</div>

									<div class="col-md-2">
										<spring:message code="label.distAmtLimit" />
									</div>


									<div class="col-md-2">${dist.distAmtLimit}</div>

								</div> --%>
						<div class="card">
							<div class="card-header">
								<strong class="card-title"><spring:message
										code="label.search" /></strong>
							</div>
							<div class="form-group"></div>
							<div class="row">

								<div class="col-md-2">
									<spring:message code="label.orderDate" />
								</div>
								<div class="col-md-3">
									<input type="text" id="date" name="date" />
								</div>


								<div class="col-md-1" align="center"></div>

								<div class="col-md-3">
									<button type="button" class="btn btn-primary"
										onclick="callSearch()" style="width: 90%;">
										<spring:message code="label.search" />
									</button>
								</div>
							</div>
						</div>


						<input type="hidden" id="hubId" name="hubId" value="${hub.hubId}">

						<%-- <div class="card">
									<div class="card-header">
										<strong class="card-title"><spring:message
												code="label.ordHistory" /></strong>
									
								

										<div class="col-lg-4">

								<div>
									<div class="input-group" style="align-items: center;">

										<spring:message code="label.orderDeliveryDate" />
										&nbsp; <input class="form-control" name="orderDeliveryDate"
											id="orderDeliveryDate" type="text" disabled />

									</div>
								</div>
							</div>


									</div>



								</div>
 --%>
						<div class="card">
							<div class="card-body">
								<table id="bootstrap-data-table1"
									class="table table-striped table-bordered">

									<thead>
										<tr>
											<th style="text-align: center;"><spring:message
													code="label.srNo" /></th>
											<th style="text-align: center;"><spring:message
													code="label.distName" /></th>
											<th style="text-align: center;"><spring:message
													code="label.contactNo" /></th>
											<th style="text-align: center;"><spring:message
													code="label.orderTotal" /></th>
											<th style="text-align: center;"><spring:message
													code="label.pendCrates" /></th>
											<th style="text-align: center;"><spring:message
													code="label.pendAmt" /></th>
											<th style="text-align: center;"><spring:message
													code="label.orderType" /></th>
											<th style="text-align: center;"><spring:message
													code="label.action" /></th>

										</tr>
									</thead>

								</table>
							</div>
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

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Footer -->



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
		$(document)
				.ready(
						function() {
							$('#bootstrap-data-table1-export').DataTable();

							$("#flowcheckall")
									.click(
											function() {
												$(
														'#bootstrap-data-table1 tbody input[type="checkbox"]')
														.prop('checked',
																this.checked);
											});

						});
	</script>

	<script type="text/javascript">
		function callSearch() {
			//alert("cxcgxc");
			var date = $("#date").val();
			var hubId = $("#hubId").val();
			var regOrd = $("#regOrd").val();
			var spOrd = $("#spOrd").val();

			if (date == null || date == "") {

				alert("Please select order date");
				$("#date").focus();
			} else {

				$
						.getJSON(
								'${getOrderByDate}',

								{
									date : date,
									hubId : hubId,

									ajax : 'true'

								},
								function(data) {

									//alert(JSON.stringify(data));

									if (data == "") {
										alert("No records found !!");

									}

									/* document.getElementById("orderDate").value = data.orderDate;

									document.getElementById("orderTotal").value = data.orderTotal;
									document.getElementById("prevPendingCrateBal").value = data.prevPendingCrateBal;
									document.getElementById("cratesIssued").value = data.cratesIssued;
									document.getElementById("cratesReceived").value = data.cratesReceived;
									document.getElementById("cratesBalance").value = (data.prevPendingCrateBal
											+ data.cratesIssued - data.cratesReceived);

									document.getElementById("prevPendingAmt").value = data.prevPendingAmt;
									document.getElementById("orderTotal1").value = data.orderTotal;
									document.getElementById("amtReceived").value = data.amtReceived;
									document.getElementById("amountBalanced").value = (data.prevPendingAmt
											+ data.orderTotal - data.amtReceived); */

									var dataTable = $('#bootstrap-data-table1')
											.DataTable();

									$
											.each(
													data,
													function(i, v) {

														var lang = $
														{
															langSelected
														}
														;

														var distName;

														if (lang == 0) {
															distName = v.distEngName;
														} else {
															distName = v.distMarName;
														}

														var ordType;

														if (v.orderType == 0) {
															ordType = regOrd;
														} else {
															ordType = spOrd;
														}

														var str = "<i class='fa  fa-stack-exchange'></i>";
														//var str="Detail";

														var result = str
																.link("${pageContext.request.contextPath}/showOrderHisDetail/"
																		+ v.orderHeaderId);
														dataTable.row
																.add(
																		[
																				i + 1,
																				distName,
																				v.distContactNo,
																				v.orderTotal,
																				v.prevPendingCrateBal,
																				v.prevPendingAmt,
																				ordType,
																				result ])
																.draw();
													});

								});

			}//end of else
		}
	</script>


	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=date]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table1').DataTable({
				columnDefs : [ {
					targets : [ 4, 5, 6 ],
					className : "right"
				}, ]

			});
		});
	</script>

	<!-- <script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table1').DataTable({
				columnDefs : [ {
					targets : [1,3,7,8],
					className : "center"
				}, ]
			
			});
		});
	</script> -->



</body>
</html>