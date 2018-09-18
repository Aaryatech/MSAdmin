<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notification</title>


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

<!-- DatePicker --><link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <!-- css for date picker proper UI -->
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>



<!-- DatePicker -->
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
		control.makeTransliteratable([ "notf_mr" ]);
		var keyVal = 32; // Space key
		$("#notf_eng")
				.on(
						'keydown',
						function(event) {
							if (event.keyCode === 32) {
								var engText = $("#notf_eng").val() + " ";
								var engTextArray = engText.split(" ");
								$("#notf_mr")
										.val(
												$("#notf_mr").val()
														+ engTextArray[engTextArray.length - 2]);

								document.getElementById("notf_mr").focus();
								$("#notf_mr").trigger({
									type : 'keypress',
									keyCode : keyVal,
									which : keyVal,
									charCode : keyVal
								});
							}

							else if ((event.keyCode === 8 || event.keyCode === 46)) {
								$("#notf_mr").val("");

								$("#notf_eng").val("");
							}
						});

		$("#notf_mr").bind("keyup", function(event) {
			setTimeout(function() {
				$("#notf_eng").val($("#notf_eng").val() + " ");
				document.getElementById("notf_eng").focus()
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
							<strong> <spring:message code="label.addNotif" /></strong>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="image"
								src="${pageContext.request.contextPath}/resources/images/addnewrecord.png"
								id="addButton" onclick="addButton();" height="25px;"
								width="25px;" /> <input type="image"
								src="${pageContext.request.contextPath}/resources/images/collapse_icon.png"
								id="addButton" onclick="hideButon();" height="25px;"
								width="25px;" />
							
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertNotif" id="insert_noti_form"
								method="post" enctype="multipart/form-data">
								
								<div id="addDiv" style="display: none;">
								
								<input type="hidden" name="conf_id" id="conf_id" value="0">

								<div class="form-group">
									<spring:message code="label.notif" />
									<div class="input-group">
										<input type="radio" checked name="lang" id="lang" 
											onchange="openDiv(0)" value="0"> English <input type="radio"
											name="lang" id="lang"  onchange="openDiv(1)" value="1">
										Marathi
									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group">
									<spring:message code="label.engNoti" />
									<div class="input-group">
										<input class="form-control" name="notf_eng" id="notf_eng"
											type="text" required
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>

								<div class="form-group"></div>
								<div class="form-group" id="notf_mr_div" style="display: none">
									<spring:message code="label.mrNoti" />
									<div class="input-group">
										<input class="form-control" name="notf_mr" id="notf_mr"
											type="text"  
											oninvalid="setCustomValidity('Please enter name ')"
											onchange="try{setCustomValidity('')}catch(e){}" /> <span
											class="error" aria-live="polite"></span>
									</div>
								</div>

								<div class="form-group"></div>
								<div class="row">
									<div class="col-md-6">
										<spring:message code="label.chooseHub" />
										<spring:message code="label.chooseHub" var="selHub" />
										<div class="input-group">
											<select data-placeholder="${selHub}" multiple
												class="standardSelect" name="sel_hub" id="sel_hub"
												oninvalid="setCustomValidity('Please Select Hubs ')"
												onchange="try{setCustomValidity('')}catch(e){}">
											<option selected value="${hubList[0].hubId}">${hubList[0].hubEngName}</option>

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

									<div class="col-md-6">
									OR &nbsp;
										<spring:message code="label.routeSupName" />
										<spring:message code="label.routeSupName" var="selRouteSup" />

										<div class="input-group">
											<select data-placeholder="${selRouteSup}"
												class="standardSelect" name="sup_name" id="sup_name"
												multiple 
												oninvalid="setCustomValidity('Please Select Route Supervisiors ')"
												onchange="try{setCustomValidity('')}catch(e){}">
												
												<%-- <option selected value="${routeSupList[0].supId}">${routeSupList[0].supEngName}</option> --%>
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

											</select> <span class="error" aria-live="polite"></span>
										</div>

									</div>
								</div>
								<br></br>

								<div class="col-lg-12" align="center">

									<button type="submit" class="btn btn-primary" onclick="validateForm1()"
										style="align-content: center; width: 226px; margin-left: 80px;">
										<spring:message code="label.submit" />
									</button>
																		<button type="reset"  class="btn btn-primary" style="align-content: center; width: 226px; margin-left: 80px;" ><spring:message code="label.cancel" /></button>
									
								</div>
								
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
			
				<div class="content mt-3">
								<div class="animated fadeIn">
									<div class="row">

										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title"><spring:message
															code="label.notifList" /></strong>
												</div>
												<div class="card-body">
													<table id="bootstrap-data-table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="text-align: center;"><spring:message code="label.srNo" /></th>
																<th style="text-align: center;"><spring:message code="label.notif" /></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${notifList}" var="notif" varStatus="count">
																<tr>

																	<td style="text-align: center">${count.index+1}</td>
																	
																	<td style="text-align: left">${notif.notifiText}</td>
																	
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
		<!-- .animated -->
	</div>
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
				disable_search_threshold : 10,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script>
	<script type="text/javascript">
		function openDiv(type) {

			if (type == 1) {
				document.getElementById('notf_mr_div').style.display = "block";
				$("#notf_eng").val("");
				$("#notf_mr").val("");
			} else if (type == 0) {
				document.getElementById('notf_mr_div').style = "display:none";
				$("#notf_eng").val("");
				$("#notf_mr").val("");
			}

		}
	</script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=datepicker]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
	
	<script type="text/javascript">
	
	function validateForm() {
	
		var hub=document.getElementById("sel_hub").value;
		var sup=document.getElementById("sup_name").value;
		var notfEng=document.getElementById("notf_eng").value;
		alert(notfEng);
		var hubIds=new Array();
		
		hubIds=JSON.stringify(hub);
		
		
		alert("hub "+hubIds);
		alert("sup "+supIds);
		 
		var valid=true;
		
		 if(notfEng==null || notfEng==""){
			 alert("In if");
			 valid=false;
			 alert("Please Add Notification Text ");
			
		 }else{
			 
			 if(hubIds<0 && supIds<0){
					valid=false;
					alert("Select At least one Hub or one Route Supervisor ");
				}
				if(hubIds>0){
					valid=true;
				}
				 if(supIds>0){
					valid=true; 	
				 }
		 }
		if(valid==true){
					//alert("all true");
					var form=document.getElementById("insert_noti_form");
					//form.action="${pageContext.request.contextPath}/insertRouteAlloc";
					form.submit();
				}
			
		}
	</script>
	
	 
	 <script type="text/javascript">
	 
	
	 $(document).ready(function() { 
			$('#sel_hub').change(
					function() {
						//alert("Hii");
						var y=$('select#sel_hub option').length;
						//alert("Y " +y);
						//$('#sup_name').setAttr('disabled', true);
						 var x = document.getElementById("sel_hub").length; 
						// alert("x==" +x);
						 var p=$('#sel_hub').val();
						 //alert("P " +p);
						 
						 if(p!=null){
					//	document.getElementById("sup_name").options.length = 0;
							 //document.getElementById("sup_name").selectedIndex = "-1"; 
							 
							 $('#sup_name').setAttr('disabled', true);
						 }
						 else{
							 //document.getElementById("sup_name").options.length=${routeSupList}
								//$('#sup_name').formcontrol('refresh');

						 }
 

					});
		});
	 
	 $(document).ready(function() { 
			$('#sup_name').change(
					function() {
						
						//document.getElementById("sel_hub").options.length = 0;

					});
		});
	
	 </script>

<script type="text/javascript">
function addButton() {
	document.getElementById('addDiv').style.display = "block";
}
function hideButon(){
	document.getElementById('addDiv').style = "display:none";
}
</script>


</body>
</html>